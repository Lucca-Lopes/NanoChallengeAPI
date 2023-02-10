//
//  HomeViewModel.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 06/02/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var temas: [ThemeModel] = []
    @Published var subtemas: [SubthemeModel] = []
    @Published var sets: [SetModel] = []
    
    public let temasImagens: [String] = ["blueTemas", "greenTemas", "redTemas", "yellowTemas", "orangeTemas"]
    public let subtemasImagens: [String] = ["blueSubtemas", "greenSubtemas", "redSubtemas", "orangeSubtemas"]
    private let themesService = ThemesService()
    private let subthemesService = SubthemesService()
    private var cancelaveis = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        themesService.$temas
            .sink { [weak self] (returnedThemes) in
                self?.temas = returnedThemes
            }
            .store(in: &cancelaveis)
        
        subthemesService.$subtemas
            .sink { [weak self] (returnedSubthemes) in
                self?.subtemas = returnedSubthemes
            }
            .store(in: &cancelaveis)
    }
    
    public func getSubthemes(nomeTema: String) {
        subthemesService.getSubthemes(nomeTema: nomeTema)
        print(subtemas)
    }
    
    public func cleanSubthemes(){
        subtemas = []
    }
    
    public func getThemesNames() -> [String] {
            var nomesTemas: [String] = []
            for tema in temas {
                nomesTemas.append(tema.theme)
            }
            return nomesTemas
    }
}
