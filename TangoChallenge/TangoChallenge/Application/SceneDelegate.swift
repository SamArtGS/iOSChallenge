//
//  SceneDelegate.swift
//  AlbumTango
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

class SceneDelegate: UIResponder {
    
    //MARK: - Properties
    
    var window: UIWindow?
    var appFlowCoordinator: MainCoordinator?
    
    //MARK: - Scene Configuration (iOS 13 or newer)
    /**
            This Application is for getting into Tango. I hope I can get it
     */
    
    func main(scene: UIScene){
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        appFlowCoordinator = MainCoordinator(navigationController: navigationController)
        appFlowCoordinator?.start()
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate: UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        main(scene: scene)
    }
    
    // MARK: - Scene Lifecycle
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Save changes in the application's managed object context when the application transitions to the background.
        // (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
