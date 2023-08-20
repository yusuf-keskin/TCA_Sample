//
//  CounterReducer.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 19.08.2023.
//

import Foundation

// Takes slice of the state, uses action and return slice
func counterReducer(_ state : CounterState, _ action : Action) -> CounterState {
    
    var state = state
    
    switch action {
    case _ as IncerementAction :
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let action as AddAction:
        state.counter += action.value
    default :
        break
    }
    print(state)
    return state
}
