//
//  URLRequestExtension.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

extension URLRequest {
    /// cURL representation of the instance.
    ///
    /// - Returns: The cURL equivalent of the instance.
    public func cURLDescription() -> String {
        guard
            let url = url,
            let _ = url.host,
            let method = httpMethod else { return "$ curl command could not be created" }

        var components = ["$ curl -v"]

        components.append("-X \(method)")

        if let headers = allHTTPHeaderFields {
            for (key, value) in headers {
                let escapedValue = value.replacingOccurrences(of: "\"", with: "\\\"")
                components.append("-H \"\(key): \(escapedValue)\"")
            }
        }
        

        if let httpBodyData = httpBody {
            let httpBody = String(decoding: httpBodyData, as: UTF8.self)
            var escapedBody = httpBody.replacingOccurrences(of: "\\\"", with: "\\\\\"")
            escapedBody = escapedBody.replacingOccurrences(of: "\"", with: "\\\"")

            components.append("-d \"\(escapedBody)\"")
        }

        components.append("\"\(url.absoluteString)\"")

        return components.joined(separator: " \\\n\t")
    }
}
