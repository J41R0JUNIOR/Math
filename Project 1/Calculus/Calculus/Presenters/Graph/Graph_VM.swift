//
//  Graph_VM.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import Foundation

@Observable
class Graph_VM {
    var m = Graph_M()
    
    func composeFunction(x: Double) -> Double {
        guard !m.selectedFunctions.isEmpty else { return 0 }
        
        var result = m.selectedFunctions[0].1(x)
        
        for i in 1..<m.selectedFunctions.count {
            let function = m.selectedFunctions[i].1
            
            if i - 1 < m.selectedOperations.count {
                let operation = m.selectedOperations[i - 1]
                switch operation {
                case "+": result += function(x)
                case "-": result -= function(x)
                case "*": result *= function(x)
                case "/": result = function(x) != 0 ? result / function(x) : result
                default: break
                }
            }
        }
        
        return result
    }
}
