//
//  MockJailbreakFilesChecker.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import Foundation
@testable import GithubAPI

final class MockJailbreakFilesChecker: JailbreakFilesCheckerProtocol {
    
    var result = false
    
    func isCydiaAppInstalled() -> Bool {
        return result
    }
    
    func jailbrokenFilesExist() -> Bool {
        return result
    }
    
    func canWriteFileOutsideSandbox() -> Bool {
        return result
    }
    
}
