//
//  URLExtension.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

extension URL {
    func appending(_ queryItem: String, value: CustomStringConvertible) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: queryItem, value: String(describing: value))
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
    
    func queryItems() -> [URLQueryItem] {
        guard let urlComponents = URLComponents(string: absoluteString) else { return [] }
        return urlComponents.queryItems ??  []
    }
}
