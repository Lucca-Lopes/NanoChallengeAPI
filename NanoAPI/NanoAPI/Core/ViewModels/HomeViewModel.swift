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
    @Published var carregandoSubtemas: Bool = false
    @Published var carregandoSets: Bool = false
    
    public let temasImagens: [String] = ["blueTemas", "greenTemas", "redTemas", "yellowTemas", "orangeTemas"]
    public let subtemasImagens: [String] = ["blueSubtemas", "greenSubtemas", "redSubtemas", "orangeSubtemas"]
    
    private let themesService = ThemesService()
    private let subthemesService = SubthemesService()
    private let setService = SetsService()
    
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
        
//        subthemesService.$carregandoSubtemas
//            .sink { [weak self] (returnedCarregandoSubtemas) in
//                self?.carregandoSubtemas = returnedCarregandoSubtemas
//            }
//            .store(in: &cancelaveis)
        
        setService.$sets
            .sink { [weak self] (returnedSets) in
                self?.sets = returnedSets
            }
            .store(in: &cancelaveis)
        
//        setService.$carregandoSets
//            .sink { [weak self] (returnedCarregandoSets) in
//                self?.carregandoSets = returnedCarregandoSets
//            }
//            .store(in: &cancelaveis)
    }
    
    public func getSubthemes(nomeTema: String) {
        subthemesService.getSubthemes(nomeTema: nomeTema)
    }
    
    public func getSets(nomeTema: String, nomeSubtema: String) {
        setService.getSets(nomeTema: nomeTema, nomeSubtema: nomeSubtema)
    }
}
