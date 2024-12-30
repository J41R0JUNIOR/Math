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
    var scaleX: Double 
    var scaleY: Double
    var displaceX: Double
    var displaceY: Double
    var spacingBetweenPoints: Double
    
    init(function: @Sendable @escaping (_ x: Double) -> Double, scaleX: Double, scaleY: Double, displaceX: Double = 0, displaceY: Double = 0, spacedBetweenPoints: Double = 0.1) {
        self.function = function
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.displaceX = displaceX
        self.displaceY = displaceY
        self.spacingBetweenPoints = spacedBetweenPoints
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for x in stride(from: rect.minX, to: rect.maxX, by: self.spacingBetweenPoints) {
            
            let y = -function((x - rect.maxX/2 + displaceX) / scaleX) * scaleY  + rect.height/2 + displaceY
            
            if y > rect.minY/2 && y < rect.maxY{
                path.move(to: CGPoint(x: x, y: y))
                path.addLine(to: CGPoint(x: x - 0.5, y: y ))
            }
        }
        
        return path
    }
}

#Preview {
    ContentView()
}
