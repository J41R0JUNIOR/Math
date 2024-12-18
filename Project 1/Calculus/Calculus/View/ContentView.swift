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
        { (x: Double) in cos(x) }
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Mesh()
                    .stroke(Color.primary, lineWidth: 1)
                
                Function(function: { x in
                    functions[selectedFunction](x)
                }, scaleX: scaleX, scaleY: scaleY)
                
                .stroke(Color.blue, lineWidth: 1)
            }
            .border(.black)
            .padding()

            Picker("Select Function", selection: $selectedFunction) {
                Text("Sine").tag(0)
                Text("Cosine").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            HStack {
                Text("ScaleX: \(Int(scaleX))")
                Slider(value: $scaleX, in: 1...200, step: 1)
            }
            HStack {
                Text("ScaleY: \(Int(scaleY))")
                Slider(value: $scaleY, in: 1...200, step: 1)
            }
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
