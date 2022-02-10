//
//  ActivityRepository.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

public protocol ActivityRepositoryProtocol {
    func getStargazers(request: GetStargazersRequest) async throws -> [Stargazer]
}

public final class ActivityRepository: Repository, ActivityRepositoryProtocol {
    
    public func getStargazers(request: GetStargazersRequest) async throws -> [Stargazer] {
        let request = ActivityModule.getStargazers(request: request)
        let response = try await dispatcher.dispatch(request: request)
        return try JSONDecoder.snakeCaseDecoder.decode([Stargazer].self, from: response.data)
    }
    
}
