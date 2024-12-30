//
//  Graph_Settings_Component.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import SwiftUI

struct Graph_C_Settings: View {
    @Bindable var vm: Graph_VM
    
    var body: some View {
        VStack{
            HStack {
                Text("Precision: \(String(format: "%.2f", Float(vm.m.by)))")
                Slider(value: $vm.m.by, in: 0.01...1, step: 0.01)
            }
            
            HStack {
                Text("Qtd Rectangles: \(String(format: "%.2f", Float(vm.m.qtdRectangle)))")
                Slider(value: $vm.m.qtdRectangle, in: 5...200, step: 1)
                
            }
            Toggle("Show Area", isOn: $vm.m.showArea).padding()
        }
        
        
        if vm.m.show{
            if vm.m.showScale{
                List{
                    HStack {
                        Text("ScaleX: \(Int(vm.m.scaleX))")
                        Slider(value: $vm.m.scaleX, in: 5...200, step: 5)
                    }
                    
                    HStack {
                        Text("ScaleY: \(Int(vm.m.scaleY))")
                        Slider(value: $vm.m.scaleY, in: 5...200, step: 5)
                    }
                    
                    HStack {
                        Text("DisplacementX: \(Int(vm.m.displacementX))")
                        Slider(value: $vm.m.displacementX, in: -100...100, step: 5)
                    }
                    
                    HStack {
                        Text("DisplacementY: \(Int(vm.m.displacementY))")
                        Slider(value: $vm.m.displacementY, in: -100...100, step: 5)
                    }
                }
            }
            
            HStack{
                Button("reset") {
                    vm.m.selectedFunctions.removeAll()
                    vm.m.selectedOperations.removeAll()
                    vm.m.displacementX = .zero
                    vm.m.displacementY = .zero
                    
                }.buttonStyle(.borderedProminent)
                
                Button("Show Scale"){
                    vm.m.showScale.toggle()
                }
            }
        }
    }
}

#Preview {
    Graph_C_Settings(vm: .init())
}
