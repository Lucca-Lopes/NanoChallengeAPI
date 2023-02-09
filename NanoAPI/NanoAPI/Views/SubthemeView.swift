//
//  SubthemeView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 07/02/23.
//

import SwiftUI

struct SubthemeView: View {
    
    public var vm: HomeViewModel
    @State var tema: ThemeModel
    
    init(vm: HomeViewModel, tema: ThemeModel) {
        self.vm = vm
        self.tema = tema
    }
    
    var body: some View {
        List{
            ForEach(vm.subtemas, id: \.subtheme) { subtema in
                Text(subtema.subtheme)
            }
        }
        .navigationTitle(tema.theme)
        .onAppear {
            vm.getSubthemes(nomeTema: tema.theme)
//            print(nomeTema)
            print(vm.subtemas)
        }
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
