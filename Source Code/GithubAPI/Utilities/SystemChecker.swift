//
//  SystemChecker.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

protocol SystemCheckerProtocol: Checker {
    func canCallSystemAPIFunctions() -> Bool
    func isRunningOnSimulator() -> Bool
}

extension SystemCheckerProtocol {
    func isSecure() -> Bool {
        return !(canCallSystemAPIFunctions() && isRunningOnSimulator())
    }
}

final class SystemChecker: SystemCheckerProtocol, Checker {
    
    func canCallSystemAPIFunctions() -> Bool {
        let pid = getpgrp()
        return pid <= 0
    }
    
    func isRunningOnSimulator() -> Bool {
        #if TARGET_IPHONE_SIMULATOR || arch(i386) || arch(x86_64)
        return true
        #else
        return false
        #endif
    }
    
}
