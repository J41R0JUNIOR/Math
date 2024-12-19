//
//  Graph_M.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import Foundation
import SwiftUICore

@Observable
class Graph_M{
    var router = Router.shared
    
    var selectedFunctions: [(String, (Double) -> Double)] = []
    var selectedOperations: [String] = []
    var scaleX: Double = 10
    var scaleY: Double = 10
    var showScale: Bool = false
    var by: Double = 0.1
    var selectedOperation = 1
    var show = true
    
    let functionsByCategory = [
        1: [
            ("Sen", { (x: Double) in sin(x) }),
            ("Cos", { (x: Double) in cos(x) }),
            ("Tan", { (x: Double) in tan(x) }),
            ("Cot", { (x: Double) in 1 / tan(x) }),
            ("Coss", { (x: Double) in 1 / sin(x)}),
            ("Sec", { (x: Double) in 1 / cos(x)})
            
        ],
        
        3: [
            ("x", { (x: Double) in x}),
            ("2x", { (x: Double) in 2 * x})
        ],
        
        2: [
            ("xˆ2", { (x: Double) in pow(x, 2) }),
            ("e^x", { (x: Double) in pow(2.74, x) }),
            ("xˆx", { (x: Double) in pow(x, x)})
        ],
        
        4: [
            ("Log10", { (x: Double) in log10(x) })
        ]
    ]
    
    let operations = ["+", "-", "*", "/"]
}
