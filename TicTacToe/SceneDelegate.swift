//
//  SceneDelegate.swift
//  TicTacToe
//
//  Created by BJ_LEE on 2021/10/26.
//

import UIKit

import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var launchRouter: LaunchRouting?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        launchRouter = RootBuilder(dependency: AppComponent()).build()
        launchRouter?.launch(from: window!)
    }

}

