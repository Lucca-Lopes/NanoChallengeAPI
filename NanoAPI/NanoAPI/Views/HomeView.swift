//
//  ContentView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 01/02/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm: HomeViewModel
    @State private var searchText = ""
    let colunas = [GridItem(.flexible()), GridItem(.flexible())]
    var temas: [ThemeModel] {
        if searchText.isEmpty{
            return vm.temas
        }else{
            return vm.temas.filter { $0.theme.localizedCaseInsensitiveContains(searchText)}
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
        .navigationTitle("Legonation")
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $searchText, prompt: "Procurar Tema")
    }
}
