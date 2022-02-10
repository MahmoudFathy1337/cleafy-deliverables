//
//  ActivityRepositoryTests.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import XCTest
@testable import GithubAPI

class ActivityRepositoryTests: XCTestCase {

    var apiDispatcher: MockAPIDispatcher!
    var activityRepository: ActivityRepository!
    
    override func setUp() {
        super.setUp()
        apiDispatcher = MockAPIDispatcher()
        activityRepository = ActivityRepository(dispatcher: apiDispatcher)
    }
    
    override func tearDown() {
        apiDispatcher = nil
        activityRepository = nil
        super.tearDown()
    }
    
    func testGetStargazers() async throws {
        let jsonFileURL = Bundle(for: type(of: self)).url(forResource: "test_data", withExtension: "json")!
        let data = try Data(contentsOf: jsonFileURL)
        
        let decoded = try JSONDecoder.snakeCaseDecoder.decode([Stargazer].self, from: data)
        
        //GIVEN
        apiDispatcher.response = Response(
            request: .init(url: URL(string: "https://api.github.com/repos/octocat/hello-world/stargazers")!),
            response: .init(),
            data: data
        )
        
        //WHEN
        let stargazers = try await activityRepository.getStargazers(request: .init(owner: "octocat", repository: "hello-world"))
        
        //THEN
        XCTAssert(stargazers.count == decoded.count)
        XCTAssert(stargazers == decoded)
    }
    
    func testNoData() async {
        //GIVEN
        apiDispatcher.response = nil
        
        //WHEN
        do {
            _ = try await activityRepository.getStargazers(request: .init(owner: "octocat", repository: "hello-world"))
        } catch let error as MockError {
            XCTAssert(error == MockError.noData)
        } catch {
            XCTFail("Unexpected error thrown")
        }
        
    }

}
