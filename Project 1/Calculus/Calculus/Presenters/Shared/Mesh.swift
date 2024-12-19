//
//  Mesh.swift
//  Calculus
//
//  Created by The Godfather Júnior on 18/12/24.
//

import Foundation
import SwiftUI

struct Mesh: Shape {
    var spacing: CGFloat = 10
    var markerSize: CGFloat = 3
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        for x in stride(from: rect.minX, to: rect.maxX, by: spacing) {
            path.move(to: CGPoint(x: x, y: rect.midY - markerSize))
            path.addLine(to: CGPoint(x: x, y: rect.midY + markerSize))
        }
        
        for y in stride(from: rect.minY, to: rect.maxY, by: spacing) {
            path.move(to: CGPoint(x: rect.midX - markerSize, y: y))
            path.addLine(to: CGPoint(x: rect.midX + markerSize, y: y))
        }
        
        return path
    }
}

#Preview {
    ContentView()
}
