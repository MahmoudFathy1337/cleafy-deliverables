//
//  Stargazer.swift
//  GithubAPI
//
//  Created by Mahmoud Fathy on 09/02/2022.
//

import Foundation

public struct Stargazer: Codable, Equatable {
    
    public let login: String?
    public let id: Int?
    public let nodeID: String?
    public let avatarURL: String?
    public let gravatarID: String?
    public let url: String?
    public let htmlURL: String?
    public let followersURL: String?
    public let followingURL: String?
    public let gistsURL: String?
    public let starredURL: String?
    public let subscriptionsURL: String?
    public let organizationsURL: String?
    public let reposURL: String?
    public let eventsURL: String?
    public let receivedEventsURL: String?
    public let type: String?
    public let siteAdmin: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "nodeId"
        case avatarURL = "avatarUrl"
        case gravatarID = "gravatarId"
        case url
        case htmlURL = "htmlUrl"
        case followersURL = "followersUrl"
        case followingURL = "followingUrl"
        case gistsURL = "gistsUrl"
        case starredURL = "starredUrl"
        case subscriptionsURL = "subscriptionsUrl"
        case organizationsURL = "organizationsUrl"
        case reposURL = "reposUrl"
        case eventsURL = "eventsUrl"
        case receivedEventsURL = "receivedEventsUrl"
        case type, siteAdmin
    }
}
