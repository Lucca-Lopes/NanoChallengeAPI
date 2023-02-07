//
//  SubthemeView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 07/02/23.
//

import SwiftUI

struct SubthemeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        List{
            ForEach(vm.subtemas, id: \.subtheme) { subtema in
                Text(subtema.subtheme)
            }
        }
        .navigationTitle("Subtemas")
    }
}

//struct SubthemeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubthemeView()
//    }
//}
