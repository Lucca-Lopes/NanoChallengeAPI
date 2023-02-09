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
    let colunas = [GridItem(.flexible()), GridItem(.flexible())]
    var temas: [ThemeModel] {
        if searchText.isEmpty{
            return vm.temas
        }else{
            return vm.temas.filter { $0.theme.contains(searchText)}
        }
    }
            
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colunas, spacing: 30) {
                ForEach(temas, id: \.theme) { tema in
                    ThemeRowView(vm: vm, tema: tema)
                }
            }
            .padding()
        }
        .environmentObject(vm)
        .searchable(text: $searchText, prompt: "Procurar Tema")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
