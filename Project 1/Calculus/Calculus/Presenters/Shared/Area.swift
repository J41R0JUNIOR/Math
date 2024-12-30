//
//  Area.swift
//  Calculus
//
//  Created by The Godfather Júnior on 29/12/24.
//

import Foundation
import SwiftUI

struct Area: Shape {
    var function: @Sendable (_ x: Double) -> (Double)
    var scaleX: Double
    var scaleY: Double
    var displaceX: Double
    var displaceY: Double
    var spacingBetweenPoints: Double
    var qtdRectangles: Int
    var area: Double = 0
    
    init(function: @Sendable @escaping (_ x: Double) -> Double, scaleX: Double = 1, scaleY: Double = 10, displaceX: Double = 0, displaceY: Double = 0, spacedBetweenPoints: Double = 0.1, qtdRectangles: Int = 10) {
        self.function = function
        self.scaleX = scaleX
        self.scaleY = scaleY
        self.displaceX = displaceX
        self.displaceY = displaceY
        self.spacingBetweenPoints = spacedBetweenPoints
        self.qtdRectangles = qtdRectangles
        self.area = 0
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width/Double(self.qtdRectangles)
        
        for x in stride(from: rect.minX, to: rect.maxX, by: width) {
            
            let y = -function((x - rect.maxX/2 + displaceX) / scaleX) * scaleY  + rect.height/2 + displaceY
            
            if y > rect.minY/2 && y < rect.maxY{
                
                let newY = y < rect.midY ? y : rect.midY
                
                path.move(to: CGPoint(x: x, y: rect.midY))
                
                path.addLine(to: CGPoint(x: x, y: newY))
                path.addLine(to: CGPoint(x: x + width, y: newY))
                path.addLine(to: CGPoint(x: x + width, y: rect.midY))
                path.addLine(to: CGPoint(x: x, y: rect.midY))
            }
        }
        
        return path
    }
    
    //    func calculateArea(in rect: CGRect) -> Double {
    //        let width = rect.width / Double(self.qtdRectangles)
    //        var totalArea: Double = 0
    //
    //        for x in stride(from: rect.minX, to: rect.maxX, by: width) {
    //            let y = -function((x - rect.maxX / 2 + displaceX) / scaleX) * scaleY + rect.height / 2 + displaceY
    //
    //            if y > rect.minY / 2 && y < rect.maxY {
    //
    //                totalArea += width * (rect.midY - y)
    //            }
    //        }
    //
    //        return totalArea
    //    }
}

#Preview {
    Area(function:  {sin($0)}, scaleX: 100, scaleY: 400, displaceX: 150, qtdRectangles: 20).stroke(Color.blue, lineWidth: 1)
}
