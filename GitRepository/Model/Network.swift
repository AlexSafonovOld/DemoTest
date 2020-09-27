//
//  Network.swift
//  GitRepository
//
//  Created by Алексей Сафонов on 24.09.2020.
//

import Foundation

class Networking {
    
    private var dataTask: URLSessionDataTask?
    
    func getInfoAboutRepo(_ nameUser: String, complition: @escaping(Result<gitData,Error>) -> ()){
        
        guard let url = URL(string: "https://api.github.com/users/\(nameUser)/repos") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DataTask : error: \(error.localizedDescription)")
                return
            }
           guard let response = response as? HTTPURLResponse else {
                print("Empty response")
                return
            }
            
        print("Response status code: \(response.statusCode)")
     
           
            
            guard let data = data else {
                print("Empty data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(gitData.self, from: data)
                DispatchQueue.main.async {
                    complition(.success(jsonData))
                }
               
            } catch let error  {
                complition(.failure(error))
            }
                }
        dataTask?.resume()
    }
}
