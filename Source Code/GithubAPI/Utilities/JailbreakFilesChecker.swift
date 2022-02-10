//
//  JailbreakFilesChecker.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import UIKit

protocol JailbreakFilesCheckerProtocol: Checker {
    func isCydiaAppInstalled() -> Bool
    func jailbrokenFilesExist() -> Bool
    func canWriteFileOutsideSandbox() -> Bool
}

extension JailbreakFilesCheckerProtocol {
    func isSecure() -> Bool {
        return !(isCydiaAppInstalled() && jailbrokenFilesExist() && canWriteFileOutsideSandbox())
    }
}

final class JailbreakFilesChecker: JailbreakFilesCheckerProtocol {
    
    private let jailbrokenFiles = [
        "/private/var/lib/apt",
        "/Applications/Cydia.app",
        "/Applications/RockApp.app",
        "/Applications/Icy.app",
        "/bin/sh",
        "/usr/libexec/sftp-server",
        "/usr/libexec/ssh-keysign",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
        "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
        "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
        "/Library/MobileSubstrate/DynamicLibraries/Veency.plist"
    ]
    
    func isCydiaAppInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
    
    func jailbrokenFilesExist() -> Bool {
        return jailbrokenFiles.contains(where: { FileManager.default.fileExists(atPath: $0) })
    }
    
    func canWriteFileOutsideSandbox() -> Bool {
        let text = "Cleafy"
        
        do {
            try text.write(
                toFile: "/private/cleaify.txt",
                atomically: true,
                encoding: .utf8
            )
            
            return true
        } catch {
            return false
        }
    }
    
}
