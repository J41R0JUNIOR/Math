import SwiftUI

public struct RoutePath: Hashable { 
    var route: Routes
    
    init(_ route: Routes) {
        self.route = route
    }
    
    @ViewBuilder
    func findPath() -> some View {
        switch route {
        case .content:
            ContentView().navigationBarBackButtonHidden()

        case .graph:
            Graph()
            
        }
    }
}
