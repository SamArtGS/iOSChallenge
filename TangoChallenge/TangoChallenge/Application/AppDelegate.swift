//
//  AppDelegate.swift
//  AlbumTango
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit
@main
class AppDelegate: UIResponder {
    
    //MARK: - Properties
    
    var window: UIWindow?
    var appFlowCoordinator: MainCoordinator?
    
    //MARK: - Main
    /**
            This Application is for getting into Tango. I hope I can get it
     */
    
    func main(){
        guard #available(iOS 13, *) else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let navigationController = UINavigationController()
            window?.rootViewController = navigationController
            appFlowCoordinator = MainCoordinator(navigationController: navigationController)
            appFlowCoordinator?.start()
            window?.makeKeyAndVisible()
        }
    }
    

}

extension AppDelegate: UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        main()
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
