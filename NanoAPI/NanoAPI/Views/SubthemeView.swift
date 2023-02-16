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
            return vm.subtemas.filter { $0.subtheme.localizedCaseInsensitiveContains(searchText)}
        }
    }
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Divider()
        
        ScrollView {
            LazyVStack {
                VStack{
                    Text("Subtemas: \(tema.subthemeCount)")
                        .frame(width: screenWidth*0.91, alignment: .leading)
                    Divider()
                    Text("Ano: \(String(tema.yearFrom))")
                        .frame(width: screenWidth*0.91, alignment: .leading)
                    Divider()
                    Text("Última Atualização: \(String(tema.yearTo))")
                        .frame(width: screenWidth*0.91, alignment: .leading)
                }
                .lineSpacing(3)
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                        .frame(width: screenWidth*0.99)
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
