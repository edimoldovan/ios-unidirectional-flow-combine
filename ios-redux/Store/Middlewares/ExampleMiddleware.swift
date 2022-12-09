//
//  ExampleMiddleware.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-10-28.
//

import Foundation
import Combine

struct Response: Decodable {
    var json: Example
}
struct Example: Decodable {
    var id: UUID
    var name: String
}

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>

func exampleMiddleware() -> Middleware<ReduxState, ReduxAction> {
    
    return { state, action in
        switch action {

            case .remoteExample(let parameter):
                var request = URLRequest(url: URL(string: "https://httpbin.org/post")!)
                let payload = ["id": UUID().uuidString, "name": parameter]
                
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try! JSONEncoder().encode(payload)
            
                return URLSession.shared
                    .dataTaskPublisher(for: request)
                    .map {
                        // leaving this in here for debug purposes
                        let text = String(decoding: $0.data, as: UTF8.self)
                        print("------- debug -------")
                        print(text)
                        print("------- debug -------")
                        return $0.data
                    }
                    .decode(type: Response.self, decoder: JSONDecoder())
                    .print()
                    .replaceError(with: Response(json: Example(id: UUID(), name: "error")))
                    .map { ReduxAction.exampleAction(example: $0.json) }
                    .eraseToAnyPublisher()
            default:
                break
            }
        
        return Empty().eraseToAnyPublisher()
    }
}
