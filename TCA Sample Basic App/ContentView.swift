//
//  ContentView.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 15.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented : Bool = false
    
    @EnvironmentObject var store : Store<AppState>
    
    struct Props {
        let counter : Int
        let onIncrement : () -> Void
        let onDecrement : () -> Void
        let onAdd : (Int) -> Void
        let onIncrementAsync : () -> Void
    }
    
    private func map(state: AppState) -> Props {
        Props(counter:state.counterState.counter ) {
            store.dispatch(action: IncerementAction())
        } onDecrement: {
            store.dispatch(action: DecrementAction())
        } onAdd: {
            store.dispatch(action: AddAction(value: $0))
        } onIncrementAsync: {
            store.dispatch(action: IncrementActionAsync())
        }
    }
    
    var body: some View {
        
        let props = map(state: store.state)
        NavigationView {
        VStack {
            Spacer()
            
            Text("\(props.counter)")
            
            Button("Increment") {
                props.onIncrement()
            }
            
            Button("Decrement") {
                props.onDecrement()
            }
            
            Button("Add 100") {
                props.onAdd(50)
            }
            
            Button("IncrementAsync") {
                props.onIncrementAsync()
            }
            
            Spacer()
            
                NavigationLink {
                    AddTaskView()
                } label: {
                   Text("Naber")
                }

            Spacer()
        }.sheet(isPresented: $isPresented) {
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: appReducer, state: AppState(), middleware: [logMiddleware()])
        return ContentView().environmentObject(store)
    }
}
