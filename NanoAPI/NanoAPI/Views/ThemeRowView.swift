//
//  ThemeRowView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 08/02/23.
//

import SwiftUI

struct ThemeRowView: View {
    @ObservedObject var vm: HomeViewModel
    var tema: ThemeModel
    
    var body: some View {
        NavigationLink {
            SubthemeView(vm: vm, tema: tema)
        } label: {
            ZStack{
                Image(vm.temasImagens.randomElement() ?? "greenTemas")
                Text(tema.theme)
                    .foregroundColor(.white)
                    .font(.custom("SF Pro Display", fixedSize: 25))
                    .bold()
            }
        }.simultaneousGesture(TapGesture().onEnded{
            vm.getSubthemes(nomeTema: tema.theme)
        })
    }
}
