//
//  ThemeRowView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 08/02/23.
//

import SwiftUI

struct ThemeRowView: View {
    let vm: HomeViewModel
    let tema: ThemeModel
    
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
//                    .shadow(radius: 40)
            }
        }
        .onTapGesture {
            vm.getSubthemes(nomeTema: tema.theme)
        }
    }
}
