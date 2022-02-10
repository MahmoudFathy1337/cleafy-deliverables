//
//  MockAPIDispatcher.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import Foundation
@testable import GithubAPI

final class MockAPIDispatcher: APIDispatcherProtocol {
    
    var response: Response?
    
    func dispatch(request: URLRequestConvertible) async throws -> Response {
        if let response = response {
            return response
        }
        
        throw MockError.noData
    }
    
    
}
