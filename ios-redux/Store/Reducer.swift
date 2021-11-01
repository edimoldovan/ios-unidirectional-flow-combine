//
//  Reducer.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-10-28.
//

import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let ReduxReducer: Reducer<ReduxState, ReduxAction> = { state, action in
    var mutatingState = state
    
    switch action {
        
        case .exampleAction(let example):
            mutatingState.examples.append(example)
    
        default:
            break
    }
    return mutatingState
}
