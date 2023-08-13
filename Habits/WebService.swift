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

    static func completeUrl(path: Endpoint) -> URLRequest?{
        guard let url = URL(string: "\(Endpoint.link.rawValue)\(path.rawValue)") else {return nil}
        
        return URLRequest(url: url)
    }
    
    static func postUser(fullname: String,
                         email: String,
                         password: String,
                         phone: String,
                         birthday: String,
                         gender: Int){
        
    let json: [String: Any] = [
        "name": fullname,
        "email": email,
        "phone": phone,
        "gender": gender,
        "password": password,
        "birthday": birthday]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        guard var urlRequest = completeUrl(path: .postUser) else {return}
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else{
                print(error)
                return
            }
            
            print(String(data: data, encoding: .utf8))
            print("response\n")
            print(response)
            
            if let r = response as? HTTPURLResponse {
                print(r.statusCode)
            }
        }
        task.resume()
    }
}

