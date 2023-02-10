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
        //        Spacer()
        //        Spacer()
//        Form{
//            Text("Subtemas")
//            Text("Ano")
//            Text("Última Atualização")
//        }

        ScrollView {
            LazyVStack {
                Text("""
                     Subtemas
                     Ano
                     Última Atualização
                     """)
                .frame(width: screenWidth * 0.8, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 5) .fill(.gray) .frame(width: screenWidth * 0.8))
                
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

//struct SubthemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubthemeView()
//    }
//}
