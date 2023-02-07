//
//  ContentView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 01/02/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
            
    var body: some View {
        VStack {
            List {
                ForEach(vm.temas, id: \.theme) { tema in
                    NavigationLink {                        
                        SubthemeView(vm: vm, nomeTema: tema.theme)
                    } label: {
                        Text(tema.theme)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Temas")
        .environmentObject(vm)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
