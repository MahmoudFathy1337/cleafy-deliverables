//
//  Module.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

protocol Module: URLRequestConvertible {
    var baseURL: URL { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: [Parameter] { get }
    var headers: [String: String] { get }
}

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

extension Module {
    
    func asURLRequest() throws -> URLRequest {
        let url: URL
        
        if endpoint.isEmpty {
            url = baseURL
        } else {
            url = baseURL.appendingPathComponent(endpoint)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        headers.forEach { header in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        try parameters.forEach { parameter in
            switch parameter {
            case .query(let key, let value):
                urlRequest.url = urlRequest.url?.appending(key, value: value)
                
            case .path(let key, let value):
                let pattern = "{key}"
                
                guard var urlString = urlRequest.url?.absoluteString else { return }
                
                let urlSafePattern = pattern.replacingOccurrences(of: "key", with: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                urlString = urlString.replacingOccurrences(of: urlSafePattern, with: String(describing: value))
                urlRequest.url = URL(string: urlString)
                
            case .object(let object):
                let data = try object.toData()
                urlRequest.httpBody = data
            }
        }
        
        return urlRequest
    }
    
}
