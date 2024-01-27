//
//  MainView.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainFeature>
    @ObservedObject private var viewStore: ViewStoreOf<MainFeature>
    
    init(store: StoreOf<MainFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        Text("Main View")
        Button {
            viewStore.send(.navigateToDetailButtonTapped)
        } label: {
            Text("Navigate to Detail")
                .foregroundStyle(.white)
                .padding()
                .background(.black)
        }
    }
}
