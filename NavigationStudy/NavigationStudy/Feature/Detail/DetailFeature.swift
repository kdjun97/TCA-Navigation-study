//
//  DetailFeature.swift
//  NavigationStudy
//
//  Created by 김동준 on 1/27/24
//

import Foundation
import ComposableArchitecture

@Reducer
struct DetailFeature {
    struct State: Equatable {
        @PresentationState var alert: AlertState<Action.Alert>?
    }
    
    enum Action {
        case alertButtonTapped
        case alert(PresentationAction<Alert>)
        
        enum Alert {
            case success
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .alertButtonTapped:
                state.alert = AlertState.noticeAlert
                return .none
            case .alert(.dismiss):
                print("alert dismissed!")
                return .none
            case .alert(.presented(.success)):
                print("Success Tapped!")
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}

extension AlertState where Action == DetailFeature.Action.Alert {
    static let noticeAlert = AlertState {
        TextState("전 페이지로 돌아가기 시도!")
    } actions: {
        ButtonState(role: .destructive, action: .success) {
            TextState("success")
        }
    }
}
