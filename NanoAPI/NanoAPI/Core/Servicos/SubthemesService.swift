//
//  SubthemesService.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 07/02/23.
//

import Foundation
import Combine

class SubthemesService {
    
    @Published var subtemas: [SubthemeModel] = []
    
    var responseSubscription: AnyCancellable?
    
    public func getSubthemes(nomeTema: String) {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? [String] else { return }
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "brickset.com"
        urlComponents.path = "/api/v3.asmx/getSubthemes"
        urlComponents.queryItems = [URLQueryItem(name: "apiKey", value: apiKey[0]), URLQueryItem(name: "theme", value: nomeTema)]
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: urlComponents.url!)) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(SubthemeResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.subtemas = result.subthemes
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        print(self.subtemas)
    }
}
