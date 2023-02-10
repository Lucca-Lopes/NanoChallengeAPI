//
//  NanoAPIApp.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 01/02/23.
//

import SwiftUI

@main
struct NanoAPIApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView(vm: vm)
            }
//            .environmentObject(vm)
        }
    }
}
