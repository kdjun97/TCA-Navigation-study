//
//  NavigationStudyApp.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import SwiftUI
import ComposableArchitecture

@main
struct NavigationStudyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(initialState: RootFeature.State(), reducer: { RootFeature()._printChanges() })
            )
        }
    }
}
