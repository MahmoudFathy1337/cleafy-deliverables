//
//  DeviceChecker.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import UIKit

protocol DeviceCheckerProtocol {
    func isDeviceSecure() -> Bool
}

final class DeviceChecker: DeviceCheckerProtocol {
    
    private let checkers: [Checker]
    
    init(checkers: Checker...) {
        self.checkers = checkers
    }
    
    func isDeviceSecure() -> Bool {
        return checkers.allSatisfy({ $0.isSecure() })
    }
}
