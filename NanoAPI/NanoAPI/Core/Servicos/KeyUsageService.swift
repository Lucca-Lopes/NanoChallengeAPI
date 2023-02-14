//
//  UserDefaults.swift
//  NanoAPI
//
//  Created by Lucca Lopes on 14/02/23.
//

import Foundation
import Combine

class KeyUsageService {
    
    var apiKey: String
    var numKeyAtual = 1
    let apiKeys = Bundle.main.infoDictionary?["API_KEY"] as? [String]
    var keyUsage: [KeyUsageModel] = []
    
    var responseSubscription: AnyCancellable?
    
    init(){
        apiKey = apiKeys![0]
        apiKeyCheck()
    }
            
    public func apiKeyCheck(){
        getKeyUsage()
        checkKeyUsage()
    }
    
    public func getKeyUsage(){
        
        guard let url = URL(string: "https://brickset.com/api/v3.asmx/getKeyUsageStats?apiKey=\(apiKey)") else { return }
        
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
            .decode(type: KeyUsageResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(String(describing: error))
                }
            } receiveValue: { [weak self] (returnedResponses) in
                self?.keyUsage = returnedResponses.apiKeyUsage
                self?.responseSubscription?.cancel()
            }
    }
    
    private func checkKeyUsage(){
        if keyUsage.first?.count ?? 0 >= 100 {
            apiKey = apiKeys![numKeyAtual]
            numKeyAtual+=1
            getKeyUsage()
        }
    }
}
