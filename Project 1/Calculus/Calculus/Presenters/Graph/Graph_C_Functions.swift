//
//  Graph_Functions_Component.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import SwiftUI

struct Graph_C_Functions: View {
    @Bindable var vm: Graph_VM
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(0..<vm.m.selectedFunctions.count, id: \.self) { index in
                    HStack {
                        if !((index - 1) >= 0 && vm.m.selectedOperations[index - 1] == "f(x)") {
                            Text(vm.m.selectedFunctions[index].0)
                                .padding(5)
                                .background(Color.blue.opacity(0.3))
                                .cornerRadius(5)
                        }
                        
                        if index < vm.m.selectedOperations.count {
                            let operation = vm.m.selectedOperations[index]
                            if operation == "f(x)", index + 1 < vm.m.selectedFunctions.count {
                                Text("(\(vm.m.selectedFunctions[index + 1].0))")
                                    .font(.body.italic())
                                    .foregroundColor(.purple)
                            } else {
                                Text(operation)
                                    .font(.title2)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .border(Color.gray)
        
        if vm.m.show{
            
            Picker("Selecione a operação", selection: $vm.m.selectedOperation) {
                Image(systemName: "circle").tag(1)
                Text("ˆ").tag(2)
                Text("/").tag(3)
                Text("Log").tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    if let functions = vm.m.functionsByCategory[vm.m.selectedOperation] {
                        ForEach(functions.indices, id: \.self) { index in
                            Button(action: {
                                vm.m.selectedFunctions.append(functions[index])
                            }) {
                                Text(functions[index].0)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                }
            }
            
            HStack {
                Text("Operations:")
                ForEach(vm.m.operations, id: \.self) { operation in
                    Button(operation) {
                        vm.m.selectedOperations.append(operation)
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding(.horizontal)
            .cornerRadius(10)
        }
    }
}

#Preview {
    Graph_C_Functions(vm: .init())
}
