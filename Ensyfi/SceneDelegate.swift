//
//  SceneDelegate.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
//        guard let _ = (scene as? UIWindowScene) else { return }
        
//
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        window = UIWindow(windowScene: windowScene)
        self.loadBaseContrloler()
        
    }
    
    func loadBaseContrloler ()
    {
        let user_loginType = UserDefaults.standard.object(forKey: UserDefaultsKey.user_login_type_Key.rawValue) ?? ""
        
        if user_loginType as! String == ""
        {
            let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
           
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
        }
        else if user_loginType as! String == "Admin"
        {
            let storyboard = UIStoryboard.init(name: "AdminDashBoard", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "adminNavVc") as! UINavigationController
           
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
        }
        else if user_loginType as! String == "Students" || user_loginType as! String == "Parents"
        {
            let storyboard = UIStoryboard.init(name: "StudentsDashBoard", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "studentsDashboardVC") as! UINavigationController
           
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
        }
        else if user_loginType as! String == "Teachers"
        {
            let storyboard = UIStoryboard.init(name: "TeachersDashBoard", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "teachersDashBoardVC") as! UINavigationController
           
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

