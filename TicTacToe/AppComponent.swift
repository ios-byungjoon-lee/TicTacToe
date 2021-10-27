//
//  AppComponent.swift
//  TicTacToe
//
//  Created by BJ_LEE on 2021/10/26.
//

import RIBs

final class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
