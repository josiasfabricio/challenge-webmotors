//
//  ChallengeWebmotorsTests.swift
//  ChallengeWebmotorsTests
//
//  Created by Josias Fabrício on 08/12/21.
//

import XCTest
@testable import ChallengeWebmotors

class ChallengeWebmotorsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let dataSource: VehicleDataSource = VehicleDataSource()
        
        dataSource.getVehicles(page: 1)
    }

}
