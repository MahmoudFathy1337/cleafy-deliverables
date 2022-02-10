//
//  MockRequest.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import Foundation
@testable import GithubAPI

struct MockRequest: Module {
    let baseURL: URL
    let endpoint: String
    let method: HTTPMethod
    let parameters: [Parameter]
    let headers: [String: String]
}
