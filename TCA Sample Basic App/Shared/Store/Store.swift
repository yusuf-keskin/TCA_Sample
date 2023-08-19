//
//  Store.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 15.08.2023.
//

import Foundation

//Gets a Redux State (Generic) and reduce it with an action
typealias Reducer<State: ReduxState> = (_ state : State, _ action : Action) -> State

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

//Task Actions
struct AddTaskAction : Action { let task : Task }

class Store<StoreState : ReduxState> : ObservableObject {
    
    var reducer : Reducer<StoreState>
    @Published var state : StoreState
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action : Action) {
        state = reducer(state, action)
    }
}

