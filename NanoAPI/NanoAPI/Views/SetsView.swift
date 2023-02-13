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
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Divider()
        ScrollView {
            LazyVStack {
                Text("""
                     Sets: \(subtema.setCount)
                     Ano: \(String(subtema.yearFrom))
                     Última Atualização: \(String(subtema.yearTo))
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
