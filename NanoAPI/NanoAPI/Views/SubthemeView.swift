//
//  SubthemeView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 07/02/23.
//

import SwiftUI

struct SubthemeView: View {
    
    public var vm: HomeViewModel
    @State var nomeTema: String
    
    init(vm: HomeViewModel, nomeTema: String) {
        self.vm = vm
        self.nomeTema = nomeTema
    }
    
    var body: some View {
        List{
            ForEach(vm.subtemas, id: \.subtheme) { subtema in
                Text(subtema.subtheme)
            }
        }
        .navigationTitle("Subtemas")
        .onAppear {
            vm.getSubthemes(nomeTema: nomeTema)
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
