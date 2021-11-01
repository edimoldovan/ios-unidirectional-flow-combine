//
//  ContentView.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-10-28.
//

import SwiftUI

struct ContentView: View {
    
    let store = ReduxStore(
        initial: ReduxState(),
        reducer: ReduxReducer,
        middlewares: [
            exampleMiddleware(service: ExampleService())
        ]
    )
    
    var body: some View {
        Start().environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
