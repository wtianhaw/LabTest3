//
//  LabTestTests.swift
//  LabTestTests
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import XCTest
import Combine
@testable import LabTest

class LabTestTests: XCTestCase {
    private var cancellables: [AnyCancellable] = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchAPI() throws {
        
        let exp = expectation(description: "fetching data from API")

        let vm: SearchVM = SearchVM()
       
        vm.searchKeyWord = "Paris"
        vm.apply(.search)
        
        vm.responseSubject
            .sink(receiveValue: { [weak self] data in
                guard self != nil else { return }
                XCTAssertNotNil(data)
                XCTAssertTrue(data.location?.name != nil)
                exp.fulfill()
            })
            .store(in: &self.cancellables)
        
        waitForExpectations(timeout: 10.0) { [weak self] error in
            guard self != nil else { return }
            print(error?.localizedDescription ?? "error")
        }
    }

}
