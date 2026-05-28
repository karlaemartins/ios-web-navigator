//
//  URLValidatorTests.swift
//  WebNavigatorTests
//
//  Created by Karla E. Martins Fernandes on 11/05/26.
//

import XCTest
@testable import WebNavigator


final class URLValidatorTests: XCTestCase {
    
    func testValidateReturnsURLWhenInputIsValid() {
        //Arrange - prepara o cenário
        let validator = URLValidator()
        //Act - executa a ação
        let result = validator.validate("google.com")
        //Assert - verifica o resultado
        XCTAssertNotNil(result)

    }
    
    func testValidateReturnsNilWhenInputIsInvalid() {
        //Arrange - prepara o cenário
        let validator = URLValidator()
        //Act - executa a ação
        let result = validator.validate("google")
        //Assert - verifica o resultado
        XCTAssertNil(result)

    }
    
    func testValidateAddsHTTPSWhenNeeded() {
        //Arrange - prepara o cenário
        let validator = URLValidator()
        //Act - executa a ação
        let result = validator.validate("google.com")
        //Assert - verifica o resultado
        XCTAssertEqual(result?.absoluteString,"https://google.com")
    }

}
