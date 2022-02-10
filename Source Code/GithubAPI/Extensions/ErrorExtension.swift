//
//  ErrorExtension.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

extension Error {
    var code: Int {
        return (self as NSError).code
    }
}
