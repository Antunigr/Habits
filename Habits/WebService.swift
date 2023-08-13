//
//  WebService.swift
//  Habits
//
//  Created by antuni gt on 12/08/23.
//

import Foundation

enum WebService{
    
    enum Endpoint: String {
        case link = "https://habitplus-api.tiagoaguiar.co"
        case postUser = "/users"
    }
    
    enum Result{
        case sucess(Data)
        case failure(NetworkError, Data?)
    }
    
    enum NetworkError {
        case badRequest
        case notFound
        case unauthorized
        case internalServerError
    }

    private static func call<T: Encodable>(path: Endpoint, body: T, callback: @escaping (Result) -> Void){
        
        guard var urlRequest = completeUrl(path: path) else {return}
        guard let jsonData = try? JSONEncoder().encode(body) else {return}
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else{
                print(error)
                callback(.failure(.internalServerError, nil))
                return
            }
            
            if let r = response as? HTTPURLResponse {
                switch r.statusCode{
                    case 400:
                        callback(.failure(.internalServerError, nil))
                        break
                    case 200:
                        callback(.sucess(data))
                    default:
                        break
                }
            }
            
            print(String(data: data, encoding: .utf8))
            print("response\n")
            print(response)
        }
        task.resume()
    }
    
    static func completeUrl(path: Endpoint) -> URLRequest?{
        guard let url = URL(string: "\(Endpoint.link.rawValue)\(path.rawValue)") else {return nil}
        
        return URLRequest(url: url)
    }
    
    static func postUser(request: SignUpRequest){
        call(path: .postUser, body: request) { result in
            
        }
    }
}

