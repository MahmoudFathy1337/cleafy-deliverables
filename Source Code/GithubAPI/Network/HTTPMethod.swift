//
//  HTTPMethod.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    
    static let connect = HTTPMethod(rawValue: "CONNECT")
    static let delete = HTTPMethod(rawValue: "DELETE")
    static let get = HTTPMethod(rawValue: "GET")
    static let head = HTTPMethod(rawValue: "HEAD")
    static let options = HTTPMethod(rawValue: "OPTIONS")
    static let patch = HTTPMethod(rawValue: "PATCH")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    static let query = HTTPMethod(rawValue: "QUERY")
    static let trace = HTTPMethod(rawValue: "TRACE")

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
