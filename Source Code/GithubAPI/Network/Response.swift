//
//  Response.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

struct Response {

    let request: URLRequest
    let statusCode: Int
    let headers: [AnyHashable: Any]
    let data: Data

    init(request: URLRequest, response: HTTPURLResponse, data: Data) {
        self.request = request
        self.statusCode = response.statusCode
        self.headers = response.allHeaderFields
        self.data = data
    }

}
