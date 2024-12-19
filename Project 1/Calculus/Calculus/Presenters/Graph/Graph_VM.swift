//
//  Graph_VM.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import Foundation
import SwiftUI

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
                case "f(x)": result = function(result)
                default: break
                }
            }
        }
        
        return result
    }
    
//    func composeFunction(x: Double) -> Double {
//        guard !m.selectedFunctions.isEmpty else { return 0 }
//        
//        // Inicializa o valor com a entrada x
//        var result = x
//        
//        // Aplica cada função na ordem
//        for function in m.selectedFunctions {
//            result = function.1(result)
//        }
//        
//        return result
//    }

}

#Preview {
    Graph()
}
