//
//  Graph.swift
//  Calculus
//
//  Created by The Godfather Júnior on 19/12/24.
//

import SwiftUI

struct Graph: View {
    @Bindable var vm = Graph_VM()
    
    
    var body: some View {
        VStack {
            Graph_C(vm: vm)
            
            Graph_C_Functions(vm: vm)
            
            Graph_C_Settings(vm: vm)
        }
    }
    
    
}

#Preview {
    Graph()
}
