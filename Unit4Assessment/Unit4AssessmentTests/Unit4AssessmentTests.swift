//
//  Unit4AssessmentTests.swift
//  Unit4AssessmentTests
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import XCTest
@testable import Unit4Assessment

class Unit4AssessmentTests: XCTestCase {

    func testAPIClient() {
        let expectedID = "1"
        let exp = XCTestExpectation(description: "cards found")
        
        CardsApiClient.getCards { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("\(appError)")
            case .success(let cards):
                let id = cards.first?.id
                XCTAssertEqual(expectedID, id)
                 exp.fulfill()
                
            }
        }
        wait(for:[exp], timeout: 5.0)
    }

}
