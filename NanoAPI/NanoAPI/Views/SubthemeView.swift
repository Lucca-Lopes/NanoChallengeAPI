//
//  SubthemeView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 07/02/23.
//

import SwiftUI

struct SubthemeView: View {
    
    @ObservedObject var vm: HomeViewModel
    var tema: ThemeModel
    @State private var searchText = ""
    var subtemas: [SubthemeModel] {
        if searchText.isEmpty{
            return vm.subtemas
        }else{
            return vm.subtemas.filter { $0.subtheme.contains(searchText)}
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(subtemas, id: \.subtheme) { subtema in
                    SubthemeRowView(vm: vm, subtema: subtema)
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(tema.theme)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Procurar Subtema")
    }
}

//struct SubthemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubthemeView()
//    }
//}
