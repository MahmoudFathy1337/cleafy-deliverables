//
//  DeviceCheckerTests.swift
//  GithubAPITests
//
//  Created by Mahmoud Fathy on 10/02/2022.
//

import XCTest
@testable import GithubAPI

class DeviceCheckerTests: XCTestCase {

    var connectionChecker: MockConnectionChecker!
    var jailbreakFilesChecker: MockJailbreakFilesChecker!
    var deviceChecker: DeviceChecker!
    
    override func setUp() {
        super.setUp()
        connectionChecker = MockConnectionChecker()
        jailbreakFilesChecker = MockJailbreakFilesChecker()
        deviceChecker = DeviceChecker(checkers: connectionChecker, jailbreakFilesChecker)
    }
    
    override func tearDown() {
        connectionChecker = nil
        jailbreakFilesChecker = nil
        deviceChecker = nil
        super.tearDown()
    }
    
    func testAnyCheckerIsNotSecure() {
        //GIVEN
        connectionChecker.result = true
        jailbreakFilesChecker.result = false
        
        //WHEN
        let result = deviceChecker.isDeviceSecure()
        
        //THEN
        XCTAssert(result == false, "Device shouldn't be secure if any of the checkers return false for isSecure()")
    }
    
    func testAllCheckersAreSecure() {
        //GIVEN
        connectionChecker.result = false
        jailbreakFilesChecker.result = false
        
        //WHEN
        let result = deviceChecker.isDeviceSecure()
        
        //THEN
        XCTAssert(result, "Device should be secure if all checkers return true for isSecure()")
    }

}
