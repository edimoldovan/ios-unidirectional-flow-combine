//
//  Start.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-11-01.
//

import SwiftUI

struct Start: View {
    @EnvironmentObject var store: ReduxStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.state.examples, id: \.id) { example in
                    Text(example.name)
                }
            }
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        store.dispatch(ReduxAction.remoteExample(parameter: "some name"))
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationBarTitle("Redux Store")
        }
    }
}
