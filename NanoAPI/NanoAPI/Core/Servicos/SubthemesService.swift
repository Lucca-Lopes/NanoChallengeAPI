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
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else { return }
        
        guard let url = URL(string: "https://brickset.com/api/v3.asmx/getSubthemes?apiKey=\(apiKey)&theme=\(nomeTema)") else { return }
        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue("", forHTTPHeaderField: "")
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, error in
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
