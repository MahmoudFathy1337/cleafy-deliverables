//
//  MockConnectionChecker.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import Foundation
@testable import GithubAPI

final class MockConnectionChecker: ConnectionCheckerProtocol {
    
    var result = false
    
    func isConnectedToVPN() -> Bool {
        return result
    }
    
    func isRunningProxy() -> Bool {
        return result
    }
    
}
