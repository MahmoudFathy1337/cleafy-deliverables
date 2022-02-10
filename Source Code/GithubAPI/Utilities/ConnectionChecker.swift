//
//  ConnectionChecker.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

protocol ConnectionCheckerProtocol: Checker {
    func isConnectedToVPN() -> Bool
    func isRunningProxy() -> Bool
}

extension ConnectionCheckerProtocol {
    func isSecure() -> Bool {
        return !(isConnectedToVPN() && isRunningProxy())
    }
}

final class ConnectionChecker: ConnectionCheckerProtocol {
    
    func isConnectedToVPN() -> Bool {
        guard
            let systemProxySettings = CFNetworkCopySystemProxySettings()?
                .takeRetainedValue() as? [String: AnyObject],
            let scopedDictionary = systemProxySettings["__SCOPED__"] as? [String: Any]
        else {
            return false
        }
        
        let vpnConfigurationKeys = [
            "tap",
            "tun",
            "ppp",
            "ipsec",
            "ipsec0",
            "utun1",
            "utun2"
        ]
        
        return scopedDictionary.keys.contains(where: { vpnConfigurationKeys.contains($0) })
    }
    
    func isRunningProxy() -> Bool {
        guard
            let systemProxySettings = CFNetworkCopySystemProxySettings()?
                .takeRetainedValue() as? [String: AnyObject]
        else {
            return false
        }
        
        return systemProxySettings.keys.contains("HTTPProxy") ||
            systemProxySettings.keys.contains("HTTPSProxy")
    }

}

