//
//  SetsView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 10/02/23.
//

import SwiftUI

struct SetsView: View {
    
    @ObservedObject var vm: HomeViewModel
    var subtema: SubthemeModel
    @State private var searchText = ""
    var sets: [SetModel] {
        if searchText.isEmpty{
            return vm.sets
        }else{
            return vm.sets.filter { $0.name.contains(searchText)}
        }
    }
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(sets, id: \.id) { set in
                    SetRowView(set: set)
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(subtema.subtheme != "{None}" ? subtema.subtheme : "Não classificado")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Procurar Set")
    }
}

//struct SetsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetsView()
//    }
//}
