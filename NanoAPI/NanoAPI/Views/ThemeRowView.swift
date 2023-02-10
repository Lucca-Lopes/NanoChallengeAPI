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
                    .resizable()
                    .frame(width: 139.5, height: 100.5)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                Text(tema.theme)
                    .bold()
                    .frame(width: 137)
                    .foregroundColor(.white)
                    .font(.custom("SF Pro Display Black", fixedSize: 20))
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
            }
        }.simultaneousGesture(TapGesture().onEnded{
            vm.getSubthemes(nomeTema: tema.theme)
        })
    }
}
