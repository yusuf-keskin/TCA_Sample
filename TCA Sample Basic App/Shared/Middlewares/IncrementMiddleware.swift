//
//  IncrementMiddleware.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 20.08.2023.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        switch action {
            
        case _ as IncrementActionAsync:
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                dispatch(IncerementAction())
            }
            
        default :
            break
        }
        
    }
}
