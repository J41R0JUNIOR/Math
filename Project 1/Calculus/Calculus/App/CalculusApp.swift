//
//  CalculusApp.swift
//  Calculus
//
//  Created by The Godfather Júnior on 18/12/24.
//

import SwiftUI

@main
struct CalculusApp: App {
    @Bindable var router = Router.shared
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                ContentView()
                    .environmentObject(router)
                    .navigationDestination(for: RoutePath.self) { route in
                        route.findPath()
                    }
            }
        }
    }
}



