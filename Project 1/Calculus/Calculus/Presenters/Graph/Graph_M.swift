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
    
    var selectedFunctions: [(String, (Double) -> Double)] = .init()
    var selectedOperations: [String] = []
    var scaleX: Double = 10
    var scaleY: Double = 10
    var showScale: Bool = false
    var by: Double = 0.1
    var selectedOperation = 1
    var show = true
    
    let functionsByCategory = [
        1: [
            ("sin", sin),
            ("cos", cos),
            ("tan", tan),
            ("cot", { 1 / tan($0) }),
            ("csc", { 1 / sin($0) }),
            ("sec", { 1 / cos($0) })
        ],
        
        2: [
            ("x²", { (x: Double) in pow(x, 2) }),
            ("eˣ", { (x: Double) in pow(2.74, x) }),
            ("xˣ", { (x: Double) in pow(x, x) }),
//            ("x²", { pow($0, 2) }),
//            ("eˣ", { pow(M_E, $0) }),
//            ("xˣ", { pow($0, $0) }),
        ],
        
        3: [
            ("x", { (x: Double) in x }),
            ("2x", { (x: Double) in 2 * x })
        ],
        
        4: [
            ("Log10 x", log10),
            ("Ln x", log)
        ]
    ]
    
    let operations = ["+", "-", "*", "/", "f(x)"]
}
