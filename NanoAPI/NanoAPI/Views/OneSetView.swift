//
//  OneSetView.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 13/02/23.
//

import SwiftUI

struct OneSetView: View {
    var set: SetModel
    @State var tamanhoImagem: CGFloat = 164
    let numFormatacao: NumberFormatter = {
        let numero = NumberFormatter()
        numero.decimalSeparator = ","
        return numero
    }()
    
    var body: some View {
        List{
            AsyncImage(url: URL(string: set.image.imageUrl ?? "nil")){ image in image
                .resizable() } placeholder: { Color.yellow }
                .frame(width: tamanhoImagem, height: tamanhoImagem)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .background(RoundedRectangle(cornerRadius: 5) .fill(Color(uiColor: .systemYellow)) .frame(width: 193, height: 193))
                .padding()
                .padding(.horizontal, UIScreen.main.bounds.size.width * 0.5)
                .listRowBackground(Color.clear)
                .onTapGesture(count: 2) {
                    if tamanhoImagem == 164 {
                        self.tamanhoImagem = 350
                    }
                    else {
                        tamanhoImagem = 164
                    }
                }
            Section(header: Text("\(set.theme) > \(set.subtheme ?? "") > \(set.name) \n\nDescrição do Produto")){
                SetDescriptionRow(texto: "Nome", informacao: set.name)
                SetDescriptionRow(texto: "Número de variações", informacao: String(set.numberVariant))
                SetDescriptionRow(texto: "Lego ID", informacao: String(set.id))
                SetDescriptionRow(texto: "Ano de criação", informacao: String(set.year))
                SetDescriptionRow(texto: "Foi lançado?", informacao: set.released ? "Sim" : "Não")
                SetDescriptionRow(texto: "Número de peças", informacao: String(set.pieces ?? 0))
                SetDescriptionRow(texto: "Número de minifiguras", informacao: String(set.minifigs ?? 0))
                SetDescriptionRow(texto: "Número de instruções", informacao: String(set.instructionsCount))
            }
            Section(header: Text("Limites de idade")){
                SetDescriptionRow(texto: "Mínima", informacao: set.ageRange.min != nil ? String(set.ageRange.min!) : "Não especificado")
                SetDescriptionRow(texto: "Máxima", informacao: set.ageRange.max != nil ? String(set.ageRange.max!) : "Não especificado")
            }
            Section(header: Text("Relatório de vendas")){
                SetDescriptionRow(texto: "Quantidade vendida", informacao: String(set.collections.ownedBy ?? 0))
                SetDescriptionRow(texto: "Nota de 0 a 5", informacao: String(format: "%.2f", locale: Locale(identifier: "br"), set.rating))
                SetDescriptionRow(texto: "Número de avaliações", informacao: String(set.reviewCount))
            }
            Section(header: Text("Preços")){
                SetDescriptionRow(texto: "EUA", informacao: set.legoCom.us.retailPrice != nil ? "US$ \(String(format: "%.2f", locale: Locale(identifier: "br"), set.legoCom.us.retailPrice!))" : "Não especificado")
                SetDescriptionRow(texto: "Reino Unido", informacao: set.legoCom.uk.retailPrice != nil ? "£ \(String(format: "%.2f", locale: Locale(identifier: "br"), set.legoCom.uk.retailPrice!))" : "Não especificado")
                SetDescriptionRow(texto: "Canadá", informacao: set.legoCom.ca.retailPrice != nil ? "C$ \(String(format: "%.2f", locale: Locale(identifier: "br"), set.legoCom.ca.retailPrice!))" : "Não especificado")
                SetDescriptionRow(texto: "Alemanha", informacao: set.legoCom.de.retailPrice != nil ? "€ \(String(format: "%.2f", locale: Locale(identifier: "br"), set.legoCom.de.retailPrice!))" : "Não especificado")
            }
            Section(header: Text("Informações da caixa")){
                SetDescriptionRow(texto: "Tipo", informacao: String(set.packagingType != "{Not specified}" ? set.packagingType : "Não especificado"))
                SetDescriptionRow(texto: "Altura", informacao: set.dimensions.height != nil ? "\(String(format: "%.2f", locale: Locale(identifier: "br"), set.dimensions.height!)) cm" : "Não especificado")
                SetDescriptionRow(texto: "Comprimento", informacao: set.dimensions.width != nil ? "\(String(format: "%.2f", locale: Locale(identifier: "br"), set.dimensions.width!)) cm" : "Não especificado")
                SetDescriptionRow(texto: "Profundidade", informacao: set.dimensions.depth != nil ? "\(String(format: "%.2f", locale: Locale(identifier: "br"), set.dimensions.depth!)) cm" : "Não especificado")
                SetDescriptionRow(texto: "Peso líquido", informacao: set.dimensions.weight != nil ? "\(String(format: "%.2f", locale: Locale(identifier: "br"), set.dimensions.weight!)) kg" : "Não especificado")
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(set.name != "{None}" ? set.name : "Não classificado")
        }
    }
    
}

struct SetDescriptionRow: View {
    let texto: String
    let informacao: String
    
    var body: some View {
        HStack{
            Text(texto)
            Spacer()
            Text(informacao)
        }
    }
}
