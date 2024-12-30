//
//  Graph_M.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import Foundation
import SwiftUICore

@Observable
class Graph_M {
    var router = Router.shared
    
    var selectedFunctions: [(String, (Double) -> Double)] = []
    var selectedOperations: [String] = []
    var scaleX: Double = 10
    var scaleY: Double = 10
    var displacementX: Double = 0
    var displacementY: Double = 0
    var showScale: Bool = false
    var by: Double = 0.1
    var selectedOperation = 1
    var show = true
    var qtdRectangle: Float = 10
    var showArea = false
    
    let functionsByCategory: [Int: [(String, (Double) -> Double)]] = [
        1: [
            ("sin", { sin($0) }),
            ("cos", { cos($0) }),
            ("tan", { tan($0) }),
            ("cot", { 1 / tan($0) }),
            ("csc", { 1 / sin($0) }),
            ("sec", { 1 / cos($0) })
        ],
        2: [
            ("x²", { x in pow(x, 2) }),
            ("eˣ", { x in pow(M_E, x) }), 
            ("xˣ", { x in x > 0 ? pow(x, x) : 0 })
        ],
        3: [
            ("x", { x in x }),
            ("2x", { x in 2 * x })
        ],
        4: [
            ("Log10 x", { x in x > 0 ? log10(x) : 0 }),
            ("Ln x", { x in x > 0 ? log(x) : 0 })
        ]
    ]
    
    let operations = ["+", "-", "*", "/", "f(x)"]
}
