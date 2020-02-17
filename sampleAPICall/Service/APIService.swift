//
//  APIService.swift
//  sampleAPICall
//
//  Created by Sachin Baburao on 04/02/20.
//  Copyright © 2020 3i Infotech. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case domainError
    case decodingError
}

class APIService:NSObject {
    static let SharedAPIService = APIService()
    
    func fetchEmployeeDetail(completion:@escaping((Result<Employee, NetworkError>) -> ())) {
        
        let shared = URLSession.shared
        let url = URL(string:"http://dummy.restapiexample.com/api/v1/employees")!
        shared.dataTask(with: url) { (data, urlResponse, error) in
            
                guard error == nil else {
                    completion(.failure(.domainError))
                    return
                }
            
               guard let data = data else {
                    completion(.failure(.domainError))
                    return
               }
            
                do {
                    let EmpModel = try JSONDecoder().decode(Employee.self, from: data)
                    completion(.success(EmpModel))
                } catch let err {
                    print(err)
                }
            
            }.resume()
    
    }
}
