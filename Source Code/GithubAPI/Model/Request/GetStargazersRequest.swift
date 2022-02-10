//
//  GetStargazersRequest.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

public struct GetStargazersRequest {
    public let owner: String
    public let repository: String
    public let perPage: Int
    public let page: Int
    
    public init(owner: String, repository: String, perPage: Int = 10, page: Int = 1) {
        self.owner = owner
        self.repository = repository
        self.perPage = perPage
        self.page = page
    }
}
