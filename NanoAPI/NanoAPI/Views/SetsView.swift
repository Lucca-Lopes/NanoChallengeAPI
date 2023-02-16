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
            return vm.sets.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Divider()
        ScrollView {
            LazyVStack {                
                VStack{
                    Text("Sets: \(subtema.setCount)")
                        .frame(width: screenWidth*0.91, alignment: .leading)
                    Divider()
                    Text("Ano: \(String(subtema.yearFrom))")
                        .frame(width: screenWidth*0.91, alignment: .leading)
                    Divider()
                    Text("Última Atualização: \(String(subtema.yearTo))")
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
                
                if vm.carregandoSets {
                    ProgressView()
                }
                else {
                    ForEach(sets, id: \.id) { set in
                        SetRowView(set: set)
                    }
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(subtema.subtheme != "{None}" ? subtema.subtheme : "Não classificado")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Procurar Set")
    }
}
