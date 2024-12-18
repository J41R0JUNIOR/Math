//
//  ContentView.swift
//  Calculus
//
//  Created by The Godfather Júnior on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedFunctions: [Int] = [] // Índices das funções selecionadas
    @State private var selectedOperations: [String] = [] // Operações escolhidas
    @State private var scaleX: Double = 10
    @State private var scaleY: Double = 10

    let functions: [(Double) -> Double] = [
        { (x: Double) in sin(x) },
        { (x: Double) in cos(x) },
        { (x: Double) in tan(x) },
        { (x: Double) in pow(x, 2) },
        { (x: Double) in pow(2.74, x) }
    ]
    
    let functionNames = ["Seno", "Cosseno", "Tangente", "Quadrado", "Exponencial"]
    let operations = ["+", "-", "*", "/"]

    var body: some View {
        VStack {
            Text("Montar Função")
                .font(.title)
                .padding()

            ZStack {
                Mesh()
                    .stroke(Color.primary, lineWidth: 1)
                
                // Renderiza a função composta
                Function(function: { x in
                    self.composeFunction(x: x)
                }, scaleX: scaleX, scaleY: scaleY)
                .stroke(Color.blue, lineWidth: 2)
            }
            .border(Color.black)
            .padding()

            // Teclado de funções e operações
            VStack(spacing: 10) {
                HStack {
                    ForEach(0..<functions.count, id: \.self) { index in
                        Button(action: {
                            selectedFunctions.append(index)
                        }) {
                            Text(functionNames[index])
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }

                HStack {
                    ForEach(operations, id: \.self) { operation in
                        Button(action: {
                            selectedOperations.append(operation)
                        }) {
                            Text(operation)
                                .font(.title2)
                                .padding()
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding()

            // Mostra as funções e operações selecionadas
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<selectedFunctions.count, id: \.self) { index in
                        Text(functionNames[selectedFunctions[index]])
                            .padding()
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(8)

                        if index < selectedOperations.count {
                            Text(selectedOperations[index])
                                .font(.title2)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .padding()
            .border(Color.gray)

            // Sliders para controle de escala
            HStack {
                Text("ScaleX: \(Int(scaleX))")
                Slider(value: $scaleX, in: 1...200, step: 1)
            }
            HStack {
                Text("ScaleY: \(Int(scaleY))")
                Slider(value: $scaleY, in: 1...250, step: 1)
            }
            Button("reset"){
                selectedFunctions.removeAll()
                selectedOperations.removeAll()
            }
        }
        .padding()
    }

    // Função composta baseada nas seleções do usuário
    func composeFunction(x: Double) -> Double {
        guard !selectedFunctions.isEmpty else { return 0 }

        var result = functions[selectedFunctions[0]](x)

        for i in 1..<selectedFunctions.count {
            let function = functions[selectedFunctions[i]]

            if i - 1 < selectedOperations.count {
                let operation = selectedOperations[i - 1]
                switch operation {
                case "+": result += function(x)
                case "-": result -= function(x)
                case "*": result *= function(x)
                case "/": result = function(x) != 0 ? result / function(x) : result 
                default: break
                }
            }
        }

        return result
    }
}

#Preview {
    ContentView()
}
