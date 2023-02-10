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
    
    var responseSubscription: AnyCancellable?
    
    public func getSets(nomeTema: String, nomeSubtema: String) {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else { return }
                
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "brickset.com"
        urlComponents.path = "/api/v3.asmx/getSets"
        urlComponents.queryItems = [URLQueryItem(name: "apiKey", value: apiKey), URLQueryItem(name: "userHash", value: ""), URLQueryItem(name: "params", value: "{'theme':'\(nomeTema)', 'subtheme':'\(nomeSubtema)'}")]
        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("", forHTTPHeaderField: "")
        
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
        
//        responseSubscription = URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default))
//            .tryMap { (output) -> Data in
//                guard let response = output.response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                return output.data
//            }
//            .receive(on: DispatchQueue.main)
//            .decode(type: SubthemeResponse.self, decoder: JSONDecoder())
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print(String(describing: error))
//                }
//            } receiveValue: { [weak self] (returnedResponses) in
//                self?.subtemas = returnedResponses.subthemes
//                self?.responseSubscription?.cancel()
//            }
    }
}
