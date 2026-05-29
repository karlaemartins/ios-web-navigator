//
//  URLValidatorTests.swift
//  WebNavigatorTests
//
//  Created by Karla E. Martins Fernandes on 11/05/26.
//

import XCTest
@testable import WebNavigator


final class URLValidatorTests: XCTestCase {
    
    //Retorna a URL quando a entrada for válida - regra de validação
    func testValidateReturnsURLWhenInputIsValid() {
        //Arrange - prepara o cenário
        let validator = URLValidator()
        //Act - executa a ação
        let result = validator.validate("google.com")
        //Assert - verifica o resultado
        XCTAssertNotNil(result)

    }
    
    //Retorna nil quando a entrada é inválida - regra de validação
    func testValidateReturnsNilWhenInputIsInvalid() {
        //Arrange - prepara o cenário
        let validator = URLValidator()
        //Act - executa a ação
        let result = validator.validate("google")
        //Assert - verifica o resultado
        XCTAssertNil(result)

    }
    
    //Adiciona HTTPS quando necessário - regra de normalização
    func testValidateAddsHTTPSWhenNeeded() {
        //Arrange - prepara o cenário
        let validator = URLValidator()
        //Act - executa a ação
        let result = validator.validate("google.com")
        //Assert - verifica o resultado
        XCTAssertEqual(result?.absoluteString,"https://google.com")
    }

}
