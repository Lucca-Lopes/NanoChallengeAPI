//
//  ContentView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 01/02/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var searchText = ""
    var nomesTemas: [String] {
        get {
            vm.getThemesNames()
        }
    }
            
    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.self) { tema in
                    NavigationLink {
                        SubthemeView(vm: vm, nomeTema: tema)
                    } label: {
                        Text(tema)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Temas")
        .environmentObject(vm)
        .searchable(text: $searchText, prompt: "Procurar Tema")
    }
    
    var searchResults: [String]{
        if searchText.isEmpty{
            return nomesTemas
        }else{
            return nomesTemas.filter { $0.contains(searchText)}
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
