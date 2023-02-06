//
//  HomeViewModel.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 06/02/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
//    @Published var resposta: Response? {
//        get {
//            return nil
//        }
//        set {
//            guard let newValue else { return }
//            temas = newValue.themes
////            atualizarTemas(resposta: newValue)
//        }
//    }
    
    @Published var temas: [ThemeModel] = []
    @Published var subtemas: [SubthemeModel] = []
    @Published var sets: [SetModel] = []
    
    private let themesService = ThemeService()
    private var respostaCancelaveis = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        themesService.$temas
            .sink { [weak self] (returnedResponses) in
                self?.temas = returnedResponses
            }
            .store(in: &respostaCancelaveis)
    }
    
//    func atualizarTemas(resposta: Response){
//        for tema in resposta.themes {
//            temas.append(.init(tema: tema))
//        }
//        print(temas)
//    }
    
}
