//
//  ModuleTests.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import XCTest
@testable import GithubAPI

class ModuleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreationOfRequest() {
        let request = try! MockRequest(
            baseURL: URL(string: "https://api.github.com")!,
            endpoint: "/repos/{owner}/{repository}/stargazers",
            method: .get,
            parameters: [
                .path(key: "owner", value: "octocat"),
                .path(key: "repository", value: "hello-world"),
                .query(key: "per_page", value: 10),
                .query(key: "page", value: 1)
            ],
            headers: [
                "Accept": "application/vnd.github.v3+json"
            ]
        )
        .asURLRequest()
        
        
        XCTAssert("\(request.url!.scheme!)://\(request.url!.host!)" == URL(string: "https://api.github.com")!.absoluteString)
        XCTAssert(request.url!.lastPathComponent == "stargazers")
        XCTAssert(request.httpMethod == HTTPMethod.get.rawValue)
        XCTAssert(request.allHTTPHeaderFields!.contains(where: { $0.key == "Accept" && $0.value == "application/vnd.github.v3+json" }))
        XCTAssert(request.url!.queryItems().contains(where: { $0.name == "per_page" && $0.value == "10" }))
        XCTAssert(request.url!.queryItems().contains(where: { $0.name == "page" && $0.value == "1" }))
        XCTAssert(request.url!.absoluteString.contains("octocat"))
        XCTAssert(request.url!.absoluteString.contains("hello-world"))
        XCTAssert(!request.url!.absoluteString.contains("{".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))
        
    }

}
