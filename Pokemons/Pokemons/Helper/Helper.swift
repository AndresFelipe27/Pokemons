//
//  Helper.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import Foundation

extension Bundle {
    
    func fetchData<T: Decodable>(url: String, model: T.Type,
                                 completion: @escaping(T) ->(),
                                 failure: @escaping(Error) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }.resume()
    }
    
}
