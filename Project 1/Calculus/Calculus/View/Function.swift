//
//  Function.swift
//  Calculus
//
//  Created by The Godfather Júnior on 18/12/24.
//

import Foundation
import SwiftUI


struct Function: Shape {
    var function: @Sendable (_ x: Double) -> (Double)
    var scaleX: Double = 1
    var scaleY: Double = 10
    
    init(function: @Sendable @escaping (_ x: Double) -> Double, scaleX: Double, scaleY: Double) {
        self.function = function
        self.scaleX = scaleX
        self.scaleY = scaleY
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
                
        for x in stride(from: rect.minX, to: rect.maxX, by: 0.1) {
            
            let y = -function(normalize(x: x - rect.maxX/2, rect: rect) / scaleX) * scaleY  + rect.height/2
            
            if y > rect.minY/2 && y < rect.maxY{
//                if path.isEmpty {
                    path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x - 1, y: y ))
//                }
//                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }

    func normalize(x: Double, rect: CGRect) -> Double {
        
        return x
    }
}

#Preview {
    ContentView()
}
