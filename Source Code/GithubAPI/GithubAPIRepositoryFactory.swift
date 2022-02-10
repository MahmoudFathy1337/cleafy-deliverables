//
//  GithubAPIRepositoryFactory.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

public enum GithubAPIRepositoryFactory {
    
    private static let connectionChecker = ConnectionChecker()
    private static let jailbreakFilesChecker = JailbreakFilesChecker()
    private static let systemChecker = SystemChecker()
    private static let deviceChecker = DeviceChecker(checkers: connectionChecker, jailbreakFilesChecker, systemChecker)
    private static let apiDispatcher = APIDispatcher(deviceChecker: deviceChecker)
    
    public static func makeActivityRepository() -> ActivityRepositoryProtocol {
        return ActivityRepository(dispatcher: apiDispatcher)
    }
    
}
