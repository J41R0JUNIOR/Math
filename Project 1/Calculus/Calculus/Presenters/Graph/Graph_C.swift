//
//  Graph_Component.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import SwiftUI

struct Graph_C: View {
    @Bindable var vm: Graph_VM

    var body: some View {
        ZStack {
            Mesh()
                .stroke(Color.primary, lineWidth: 1)
            
            Function(
                function: { x in
                    vm.composeFunction(x: x)
                },
                scaleX: vm.m.scaleX,
                scaleY: vm.m.scaleY,
                displaceX: vm.m.displacementX,
                displaceY: vm.m.displacementY,
                spacedBetweenPoints: vm.m.by
            )
            .stroke(Color.blue, lineWidth: 2)
            .id(vm.m.selectedFunctions.count + vm.m.selectedOperations.count)
        }
//        .border(Color.black)
        
    }
}

#Preview {
    Graph_C(vm: .init())
}
