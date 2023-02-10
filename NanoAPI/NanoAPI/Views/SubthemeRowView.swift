//
//  SubthemeRowView.swift
//  NanoAPI
//
//  Created by Rodrigo Ferreira Pereira on 10/02/23.
//

import SwiftUI

struct SubthemeRowView: View {
    @ObservedObject var vm: HomeViewModel
    var subtema: SubthemeModel
    
    var body: some View {
        NavigationLink {
            SetsView(vm: vm, subtema: subtema)
        } label: {
            ZStack{
                Image(vm.subtemasImagens.randomElement() ?? "greenSubtemas")
                    .resizable()
                    .frame(width: 277.5, height: 100.5)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                Text(subtema.subtheme != "{None}" ? subtema.subtheme : "Não classificado")
                    .bold()
                    .frame(width: 275)
                    .foregroundColor(.white)
                    .font(.custom("SF Pro Display Black", fixedSize: 20))
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
            }
        }.simultaneousGesture(TapGesture().onEnded{
            vm.getSets(nomeTema: subtema.theme, nomeSubtema: subtema.subtheme)
        })
    }
}
