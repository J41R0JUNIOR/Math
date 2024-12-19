//
//  ContentView.swift
//  Calculus
//
//  Created by The Godfather Júnior on 18/12/24.
//
import SwiftUI

struct ContentView: View {
    @State private var selectedFunctions: [(String, (Double) -> Double)] = [] // Tupla com nome e função
    @State private var selectedOperations: [String] = []
    @State private var scaleX: Double = 10
    @State private var scaleY: Double = 10
    @State private var showScale: Bool = false
    
    @State var selectedOperation = 1
    
    let functionsByCategory = [
        1: [("Sen", { (x: Double) in sin(x) }),
            ("Cos", { (x: Double) in cos(x) }),
            ("Tan", { (x: Double) in tan(x) })],
        
        2: [("xˆ2", { (x: Double) in pow(x, 2) }),
            ("e^x", { (x: Double) in pow(2.74, x) })],
        
        3: [("Log10", { (x: Double) in log10(x) })]
    ]
    
    let operations = ["+", "-", "*", "/"]
    
    var body: some View {
        VStack {
            ZStack {
                Mesh()
                    .stroke(Color.primary, lineWidth: 1)
                
                Function(function: { x in
                    self.composeFunction(x: x)
                }, scaleX: scaleX, scaleY: scaleY)
                .stroke(Color.blue, lineWidth: 2)
            }
            .border(Color.black)
            .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<selectedFunctions.count, id: \.self) { index in
                        Text(selectedFunctions[index].0) // Exibindo o nome da função
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(3)
                        
                        if index < selectedOperations.count {
                            Text(selectedOperations[index])
                                .font(.title2)
                        }
                    }
                }
            }
            
            .border(Color.gray)
            
            Picker("Selecione a operação", selection: $selectedOperation) {
                Text("Trigonometrics").tag(1)
                Text("Exponential").tag(2)
                Text("Logarithmic").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if let functions = functionsByCategory[selectedOperation] {
                        ForEach(functions.indices, id: \.self) { index in
                            Button(action: {
                                selectedFunctions.append(functions[index]) // Adicionando a tupla (nome, função)
                            }) {
                                Text(functions[index].0)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
            }
            
            HStack {
                ForEach(operations, id: \.self) { operation in
                    Button(operation) {
                        selectedOperations.append(operation)
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            
            if showScale{
                HStack {
                    Text("ScaleX: \(Int(scaleX))")
                    Slider(value: $scaleX, in: 0...200, step: 10)
                }
                
                HStack {
                    Text("ScaleY: \(Int(scaleY))")
                    Slider(value: $scaleY, in: 0...250, step: 10)
                }
            }
            
            HStack{
                Button("reset") {
                    selectedFunctions.removeAll()
                    selectedOperations.removeAll()
                }.buttonStyle(.borderedProminent)
                
                Button("Show Scale"){
                    showScale.toggle()
                }
            }
        }
       
    }
    
    func composeFunction(x: Double) -> Double {
        guard !selectedFunctions.isEmpty else { return 0 }
        
        var result = selectedFunctions[0].1(x) // Usando a função da tupla
        
        for i in 1..<selectedFunctions.count {
            let function = selectedFunctions[i].1 // Função da tupla
            
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
