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
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Divider()

        ScrollView {
            LazyVStack {
                Text("""
                     Subtemas: \(tema.subthemeCount)
                     Ano: \(String(tema.yearFrom))
                     Última Atualização: \(String(tema.yearTo))
                     """)
                .lineSpacing(3)
                .padding()
                .font(.system(size: 13))
                .frame(width: screenWidth * 0.8, alignment: .leading)
                .background{
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(uiColor: .systemGray5))
                        .frame(width: screenWidth * 0.8)
                }
                
                Spacer(minLength: 30)
                
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
