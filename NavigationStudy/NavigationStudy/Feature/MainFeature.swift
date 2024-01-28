//
//  MainFeature.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainFeature {
    struct State: Equatable {
        var isSheetPresented: Bool = false
    }
    
    enum Action {
        case navigateToDetailButtonTapped
        case showSheetButtonTapped
        case setSheetPresented(Bool)
        case bottomSheetSendButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .navigateToDetailButtonTapped:
                return .none
            case .showSheetButtonTapped:
                state.isSheetPresented = true
                return .none
            case .setSheetPresented(let value):
                state.isSheetPresented = value
                return .none
            case .bottomSheetSendButtonTapped:
                return .none
            }
        }
    }
}
