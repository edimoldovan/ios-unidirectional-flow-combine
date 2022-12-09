//
//  Start.swift
//  ios-redux
//
//  Created by Eduard Moldovan on 2021-11-01.
//

import SwiftUI

struct Start: View {
    @EnvironmentObject var store: ReduxStore
    @State private var name = ""
    
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
                        if (name == "") {
                            store.dispatch(ReduxAction.remoteExample(parameter: "hi!"))
                        } else {
                            store.dispatch(ReduxAction.remoteExample(parameter: "hi \(name)!"))
                        }
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    TextField("name", text: $name)
                }
            }
            .navigationBarTitle("Redux Store")
        }
    }
}
