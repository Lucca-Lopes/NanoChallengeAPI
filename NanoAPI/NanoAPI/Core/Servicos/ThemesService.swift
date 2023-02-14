//
//  ThemesService.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 06/02/23.
//

import Foundation
import Combine

class ThemesService {
    
    @Published var temas: [ThemeModel] = []
    
    var responseSubscription: AnyCancellable?
    
    init(){
        getThemes()
    }
    
    private func getThemes(){
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else { return }
        
        guard let url = URL(string: "https://brickset.com/api/v3.asmx/getThemes?apiKey=\(apiKey)") else { return }
        
        responseSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: ThemeResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(String(describing: error))
                }
            } receiveValue: { [weak self] (returnedResponses) in
                self?.temas = returnedResponses.themes
                self?.responseSubscription?.cancel()
            }
    }
}
