//
//  ContentView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String{
                Text("apiKey")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.accentColor)
                HStack{
                    Image(systemName: "key.fill")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                    Text(apiKey)
                        .foregroundColor(.pink)
                        .bold()
                        .font(.title)
                    Image(systemName: "key.fill")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
