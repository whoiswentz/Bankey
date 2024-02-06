//
//  AccountSummaryViewController+Networking.swift
//  Bankey
//
//  Created by Vinicios Wentz on 04/02/24.
//

import UIKit
    
extension AccountSummaryViewController {
    func fetchAccounts(forUserId userId: String, completion: @escaping (Result<[Account],NetworkError>) -> Void) {
            let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)/accounts")!

            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        completion(.failure(.serverError))
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        
                        let accounts = try decoder.decode([Account].self, from: data)
                        completion(.success(accounts))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                }
            }.resume()
        }
}
