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
        
    }
    
    enum Action {
        case navigateToDetailButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .navigateToDetailButtonTapped:
                return .none
            }
        }
        
    }
}
