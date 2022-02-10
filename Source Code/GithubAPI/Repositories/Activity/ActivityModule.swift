//
//  ActivityModule.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

enum ActivityModule: Module {
    
    case getStargazers(request: GetStargazersRequest)
    
    var baseURL: URL {
        return Configuration.baseURL
    }
    
    var endpoint: String {
        switch self {
        case .getStargazers:
            return ActivityEndpoints.getStargazers
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getStargazers:
            return .get
        }
    }
    
    var parameters: [Parameter] {
        switch self {
        case .getStargazers(let request):
            return [
                .path(key: "owner", value: request.owner),
                .path(key: "repository", value: request.repository),
                .query(key: "per_page", value: request.perPage),
                .query(key: "page", value: request.page)
            ]
        }
    }
    
    var headers: [String: String] {
        return [
            "Accept": "application/vnd.github.v3+json"
        ]
    }
    
    
}
