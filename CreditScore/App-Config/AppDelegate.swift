import UIKit
import ProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        configUI()
        setupNavbar()
        let rootViewController = DashboardSceneBuilder.buildScene()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        return true
    }
}

/// navbar..
extension AppDelegate {
    func setupNavbar() {
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
    }
}

/// UI config...
extension AppDelegate {
    func configUI() {
        ProgressHUD.animationType = .circleStrokeSpin
    }
}
