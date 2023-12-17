//
//  MockURLSessionDataTask.swift
//  SoccerTests
//
//  Created by Thales Luquetti Teixeira on 16/12/23.
//

@testable import Soccer
import XCTest

final class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
