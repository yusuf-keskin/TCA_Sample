//
//  LogMiddleware.swift
//  TCA Sample Basic App
//
//  Created by YUSUF KESKİN on 20.08.2023.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    
    return {  state, action, dispatch in
       print("Log Middleware")
    }
    
}
