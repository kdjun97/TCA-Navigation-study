//
//  ContentView.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: StoreOf<RootFeature>
    
    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: \.path)) {
            RootContentView(store: store)
        } destination: { store in
            switch store {
            case .main:
                CaseLet(/RootFeature.Path.State.main, action: RootFeature.Path.Action.main) { store in
                    MainView(store: store)
                }
            }
        }
    }
}

private struct RootContentView: View {
    let store: StoreOf<RootFeature>
    
    fileprivate init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    
    fileprivate var body: some View {
        Text("This is Splash View")
        NavigationLink(state: RootFeature.Path.State.main(MainFeature.State())) {
            Text("Navigate To Main")
                .foregroundStyle(.white)
                .padding()
                .background(.black)
        }
    }
}
