# ios-redux
## Eample implementation of a Redux pattern for iOS with SwiftUI and a little bit of Combine and promises.

Actions can be dispatched from views like this `store.dispatch(ReduxAction.remoteExample(parameter: "hi \(name)!"))` then the `Middleware` will catch them, perform the remote networking call, receive result and pass that back to the `Reducer` through another `Action`.
