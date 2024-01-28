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
        MainContentView(store: store)
            .sheet(isPresented: viewStore.binding(
                    get: \.isSheetPresented,
                    send: { newValue in .setSheetPresented(newValue)})
            ) {
                MainBottomSheetView(store: store)
                    .presentationDetents([
                        .medium
                    ]).presentationDragIndicator(.visible)
            }
    }
}

private struct MainContentView: View {
    let store: StoreOf<MainFeature>
    
    init(store: StoreOf<MainFeature>) {
        self.store = store
    }
    
    fileprivate var body: some View {
        VStack {
            Text("Main View")
            Button {
                store.send(.navigateToDetailButtonTapped)
            } label: {
                Text("Navigate to Detail")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
            }
            Button {
                store.send(.showSheetButtonTapped)
            } label: {
                Text("Show Sheet")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
            }
        }
    }
}

private struct MainBottomSheetView: View {
    let store: StoreOf<MainFeature>
    
    init(store: StoreOf<MainFeature>) {
        self.store = store
    }
    
    fileprivate var body: some View {
        VStack {
            Text("내용 대충")
                .padding(.top, 48)
            Spacer()
            Button {
                store.send(.bottomSheetSendButtonTapped)
            } label: {
                Text("Send")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.orange)
                    .padding(.bottom, 24)
                    .padding(.horizontal, 12)
            }
        }
    }
}
