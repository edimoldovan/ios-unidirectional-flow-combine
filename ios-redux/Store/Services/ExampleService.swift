//
//  ExampleService.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-10-28.
//

import Combine
import Foundation
import Alamofire

struct Response: Decodable {
    var json: Example
}

struct Example: Decodable {
    var id: UUID
    var name: String
}

struct ExampleService {
    
    func remoteExample(parameter: String) -> AnyPublisher<Example, Never> {
        
        return Future<Example, Never> { promise in
            
            let parameters: Parameters = [
                "id": UUID().uuidString,
                "name": "ed"
            ]
            
            AF.request(
                "https://httpbin.org/post",
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default
            )
            .responseDecodable(of: Response.self) { response in
                let result = response.value
                promise(.success(result?.json ?? Example(id: UUID(), name: "empty")))
                if response.error != nil {
                    print(response.error as Any)
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
