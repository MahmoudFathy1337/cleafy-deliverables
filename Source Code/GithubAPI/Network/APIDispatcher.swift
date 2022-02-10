//
//  APIDispatcher.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

protocol APIDispatcherProtocol {
    func dispatch(request: URLRequestConvertible) async throws -> Response
}

final class APIDispatcher: APIDispatcherProtocol {
    
    private let deviceChecker: DeviceCheckerProtocol
    
    init(deviceChecker: DeviceCheckerProtocol) {
        self.deviceChecker = deviceChecker
    }
    
    func dispatch(request: URLRequestConvertible) async throws -> Response {
        guard
            deviceChecker.isDeviceSecure()
        else {
            throw GithubAPIError.deviceNotSecure
        }
        
        let urlRequest = try request.asURLRequest()
        debugPrint("=======================================")
        debugPrint(NSString(string: urlRequest.cURLDescription()))
        debugPrint("=======================================")
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    switch error.code {
                    case URLError.dataNotAllowed.rawValue, URLError.notConnectedToInternet.rawValue:
                        continuation.resume(throwing: GithubAPIError.notConnectedToInternet)
                        
                    case URLError.timedOut.rawValue:
                        continuation.resume(throwing: GithubAPIError.timedOut)
                        
                    default:
                        continuation.resume(throwing: GithubAPIError.internalServerError)
                    }
                } else {
                    guard
                        let data = data,
                        let response = response as? HTTPURLResponse
                    else {
                        continuation.resume(throwing: GithubAPIError.internalServerError)
                        return
                    }
                    
                    if (200..<300).contains(response.statusCode) == false {
                        continuation.resume(throwing: GithubAPIError.serverError(statusCode: response.statusCode, data: data))
                        return
                    } else {
                        let response = Response(
                            request: urlRequest,
                            response: response,
                            data: data
                        )
                        
                        continuation.resume(returning: response)
                        return
                    }
                }
            }
            .resume()
        }
    }
    
}
