//
//  Store.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 15.08.2023.
//

import Foundation

//Gets a Redux State (Generic) and reduce it with an action
typealias Reducer<State: ReduxState> = (_ state : State, _ action : Action) -> State
typealias Dispatcher = (Action) -> Void
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void

protocol Action {}
protocol ReduxState {}

//Contains state slices as redux states
struct AppState: ReduxState {
    var counterState : CounterState = CounterState()
    var taskState : TaskState = TaskState()
}

struct CounterState : ReduxState {
    var counter : Int = 0
}

struct TaskState : ReduxState {
    var tasks = [Task]()
}

//Counter Actions
struct IncerementAction : Action {}
struct DecrementAction : Action {}
struct AddAction : Action { let value : Int }

//Async action for middleware usage example
struct IncrementActionAsync: Action {}

//Task Actions
struct AddTaskAction : Action { let task : Task }

class Store<StoreState : ReduxState> : ObservableObject {
    
    var reducer : Reducer<StoreState>
    var middlewares : [Middleware<StoreState>]
    @Published var state : StoreState
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middleware : [Middleware<StoreState>]) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middleware
    }
    
    func dispatch(action : Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state,action)
        }
        //run all middlewares
        middlewares.forEach { middleware in
            middleware(state,action,dispatch)
        }
    }
}

