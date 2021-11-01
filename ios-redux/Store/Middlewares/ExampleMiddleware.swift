//
//  ExampleMiddleware.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-10-28.
//

import Foundation
import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

func exampleMiddleware(service: ExampleService) -> Middleware<ReduxState, ReduxAction> {
    
    return { state, action in
        switch action {

            case .remoteExample(let parameter):
                return service.remoteExample(parameter: parameter)
                    .subscribe(on: DispatchQueue.main)
                    .map { ReduxAction.exampleAction(example: $0) }
                    .eraseToAnyPublisher()
                
            default:
                break
            }
        
        return Empty().eraseToAnyPublisher()
    }
    
}
