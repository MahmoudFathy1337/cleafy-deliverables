//
//  EncodableExtension.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

extension Encodable {
    
    func toData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
}
