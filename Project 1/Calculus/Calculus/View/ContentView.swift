//
//  ContentView.swift
//  Calculus
//
//  Created by The Godfather Júnior on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFunction: Int = 0
    @State private var scaleX: Double = 10
    @State private var scaleY: Double = 10

    let functions = [
        { (x: Double) in sin(x) },
        { (x: Double) in cos(x) },
        { (x: Double) in tan(x) },
        { (x: Double) in pow(x, 2) },
        { (x: Double) in pow(2.74, x) }
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Mesh()
                    .stroke(Color.primary, lineWidth: 1)
                
                Function(function: { x in
                    functions[0](x) / functions[1](x)
                
                }, scaleX: scaleX, scaleY: scaleY)
                
                .stroke(Color.blue, lineWidth: 1)
            }
            .border(.black)
            .padding()

            Picker("Select Function", selection: $selectedFunction) {
                Text("func 1").tag(0)
                Text("func 2").tag(1)
                Text("func 3").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            HStack {
                Text("ScaleX: \(Int(scaleX))")
                Slider(value: $scaleX, in: 1...200, step: 1)
            }
            HStack {
                Text("ScaleY: \(Int(scaleY))")
                Slider(value: $scaleY, in: 1...250, step: 1)
            }
            
            Text("Settings to Calculate Area")
            
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
