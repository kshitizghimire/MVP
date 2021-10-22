import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appNavigator: AppNavigator!
    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        appNavigator = AppNavigator()
        window?.rootViewController = appNavigator.start()
        window?.makeKeyAndVisible()
    }
}
