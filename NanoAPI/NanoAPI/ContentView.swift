//
//  ContentView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    
    let temas: [ThemeModel] = [.init(theme: "Star Wars", setCount: 200, subthemeCount: 50, yearFrom: 2000, yearTo: 2023), .init(theme: "Indiana Jones", setCount: 40, subthemeCount: 2, yearFrom: 1999, yearTo: 2005)]
    
    var body: some View {
        List {
            ForEach(temas) { tema in
                Text(tema.theme)
            }
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
