//
//  DetailView.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct DetailView: View {
    let store: StoreOf<DetailFeature>
    @ObservedObject private var viewStore: ViewStoreOf<DetailFeature>
    
    init(store: StoreOf<DetailFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        Text("Detail View")
    }
}
