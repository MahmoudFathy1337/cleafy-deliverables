//
//  Parameter.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

enum Parameter {
    case query(key: String, value: CustomStringConvertible)
    case path(key: String, value: CustomStringConvertible)
    case object(object: Encodable)
}
