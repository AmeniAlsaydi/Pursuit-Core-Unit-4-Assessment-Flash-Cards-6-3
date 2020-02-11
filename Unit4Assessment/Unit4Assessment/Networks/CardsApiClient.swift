//
//  CardsApiClient.swift
//  Unit4Assessment
//
//  Created by Amy Alsaydi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
import NetworkHelper

struct CardsApiClient {
    static func getCards(completion: @escaping (Result<[Card], AppError>) -> ()) {
        
        let endpoint = "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.badURL(endpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(CardSearch.self, from: data)
                    completion(.success(results.cards))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
