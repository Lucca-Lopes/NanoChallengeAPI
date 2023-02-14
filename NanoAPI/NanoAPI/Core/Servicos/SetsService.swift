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
    let userDefaults = PrefsUserDefaults()
    var responseSubscription: AnyCancellable?
    
    public func getSets(nomeTema: String, nomeSubtema: String) {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? [String] else { return }
        print(apiKey)
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "brickset.com"
        urlComponents.path = "/api/v3.asmx/getSets"
        urlComponents.queryItems = [URLQueryItem(name: "apiKey", value: apiKey[userDefaults.numUsosDaKey]), URLQueryItem(name: "userHash", value: ""), URLQueryItem(name: "params", value: "{'theme':'\(nomeTema)', 'subtheme':'\(nomeSubtema)'}")]
        
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
        }
        task.resume()
        print(self.sets)
    }
}
