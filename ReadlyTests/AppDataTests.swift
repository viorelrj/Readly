//
//  AppDataTests.swift
//  ReadlyTests
//
//  Created by Viorel Rinja on 5/18/21.
//

@testable import Readly
import XCTest
import RealmSwift

class AppDataTests: XCTestCase {
    var testRealm: Realm!

    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        testRealm = try! Realm()
        AppData.setRealm(newRealm: testRealm)
        AppData.books = []
    }
    
    override func tearDown() {
        super.tearDown()
        testRealm = nil
    }
    
    func test_saves_book() {
        let books = [Book()]
        AppData.saveBooks(books)
        XCTAssertEqual(books, AppData.books)
    }
    
    func test_appends_book_given_not_empty() {
        let initialState = [Book()]
        let toAdd = [Book()]
        AppData.books = initialState;
        AppData.saveBooks(toAdd)
        XCTAssertEqual(AppData.books, initialState + toAdd)
    }
    
    func test_sets_favourite() {
        let id = "testington"
        let book = Book(_id: id, _title: "Barking up the wrong tree", _text: "Heyo. Don't bark")
        let initialValue = book.isFavourite
        
        AppData.saveBooks([book])
        AppData.switchFavourite(id: id)
        print(book, AppData.books)
        XCTAssertNotEqual(initialValue, AppData.books[0].isFavourite)
    }
    
}
