//
//  AppReducer.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 19.08.2023.
//

import Foundation

// Updates state with changes on state slices

func appReducer(_ state : AppState, _ action : Action) -> AppState {

    var state = state
    
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    
    return state
}
