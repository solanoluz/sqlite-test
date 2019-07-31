class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    documents_path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0]
    file_path = File.join(documents_path, 'test.db')
    db = SQLite3::Database.new(file_path)
    db.execute('SELECT * FROM sqlite_master WHERE name=?', ['users'])

    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'test'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
