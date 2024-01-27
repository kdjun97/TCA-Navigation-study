//
//  RootFeature.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootFeature {
    struct State {
        var path: StackState<Path.State> = .init()
    }
    
    enum Action {
        case path(StackAction<Path.State, Path.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path(.element(id: _, action: RootFeature.Path.Action.main(.navigateToDetailButtonTapped))):
                state.path.append(.detail(DetailFeature.State()))
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension RootFeature {
    @Reducer
    struct Path {
        enum State {
            case main(MainFeature.State)
            case detail(DetailFeature.State)
        }

        enum Action {
            case main(MainFeature.Action)
            case detail(DetailFeature.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: /State.main, action: /Action.main) {
                MainFeature()._printChanges()
            }
            Scope(state: /State.detail, action: /Action.detail) {
                DetailFeature()._printChanges()
            }
        }
    }
}
