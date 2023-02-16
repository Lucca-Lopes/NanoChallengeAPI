//
//  SetsService.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 10/02/23.
//

import Foundation
import Combine

class SetsService {
    
    @Published var sets: [SetModel] = []
//    @Published var carregandoSets: Bool = false
    let keyUsageService = KeyUsageService()
    var responseSubscription: AnyCancellable?
    
    public func getSets(nomeTema: String, nomeSubtema: String) {
//        carregandoSets = true
        keyUsageService.apiKeyCheck()
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "brickset.com"
        urlComponents.path = "/api/v3.asmx/getSets"
        urlComponents.queryItems = [URLQueryItem(name: "apiKey", value: keyUsageService.apiKey), URLQueryItem(name: "userHash", value: ""), URLQueryItem(name: "params", value: "{'theme':'\(nomeTema)', 'subtheme':'\(nomeSubtema)'}")]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(SetResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.sets = result.sets
                }
            }
            catch {
                print(error)
            }
//            self?.carregandoSets = false
        }
        task.resume()
        
    }
}
