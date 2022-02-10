//
//  Repository.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

public class Repository {
    let dispatcher: APIDispatcherProtocol
    
    init(dispatcher: APIDispatcherProtocol) {
        self.dispatcher = dispatcher
    }
}
