//
//  SetRowView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 13/02/23.
//

import SwiftUI

struct SetRowView: View {
    var set: SetModel
    let setsImagens: [String] = ["blueSets", "greenSets", "redSets", "orangeSets"]
    let subtemasImagens: [String] = ["blueSubtemas", "greenSubtemas", "redSubtemas", "orangeSubtemas"]

    
    var body: some View {
        NavigationLink {
            OneSetView(set: set)
        } label: {
            HStack {
                ZStack{
                    Image(setsImagens.randomElement() ?? "greenSets")
                        .resizable()
                        .frame(width: 70.85, height: 100.5)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    AsyncImage(url: URL(string: set.image.thumbnailUrl)){ image in image
                        .resizable() } placeholder: { Color.green }
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top)
                }
                ZStack{
                    Image(subtemasImagens.randomElement() ?? "greenSubtemas")
                        .resizable()
                        .frame(width: 277.5, height: 100.5)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    Text(set.name != "{None}" ? set.name : "Não classificado")
                        .bold()
                        .frame(width: 275)
                        .foregroundColor(.white)
                        .font(.custom("SF Pro Display Black", fixedSize: 20))
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.top)
                }
            }
        }
    }
}
