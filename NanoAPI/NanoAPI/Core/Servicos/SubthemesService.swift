//
//  SubthemesService.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 07/02/23.
//

import Foundation
import Combine

class SubthemesService {
    
//    @Published var resposta: Response?
    @Published var subtemas: [SubthemeModel] = []
    
    var responseSubscription: AnyCancellable?
    
//    init(){
//        getSubthemes()
//    }
    
    public func getSubthemes(nomeTema: String){
        guard let url = URL(string: "https://brickset.com/api/v3.asmx/getSubthemes?apiKey=3-Qym0-pfwQ-Tu0in&theme=\(nomeTema)") else { return }
        
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
            .decode(type: SubthemeResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(String(describing: error))
                }
            } receiveValue: { [weak self] (returnedResponses) in
                self?.subtemas = returnedResponses.subthemes
                self?.responseSubscription?.cancel()
            }
    }
}
