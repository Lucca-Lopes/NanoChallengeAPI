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
    
//    init(vm: HomeViewModel, tema: ThemeModel) {
//        self.vm = vm
//        self.tema = tema
//    }
    
    var body: some View {
        LazyVStack {
            List{
                ForEach(vm.subtemas, id: \.subtheme) { subtema in
                    Text(subtema.subtheme)
                }
            }
        }
        .navigationTitle(tema.theme)
        .onDisappear {
            vm.cleanSubthemes()
        }
    }
}

//struct SubthemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubthemeView()
//    }
//}
