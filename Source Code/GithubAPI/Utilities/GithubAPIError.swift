//
//  GithubAPIError.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

enum GithubAPIError: Error {
    case invalidEndpointProvided
    case notConnectedToInternet
    case timedOut
    case internalServerError
    case serverError(statusCode: Int, data: Data)
    case deviceNotSecure
}
