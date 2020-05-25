//
//  DatabaseProvider.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 25/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import SQLite3


class DatabaseProvider {
    
    // MARK: Private Variables
    private let dbPath = "KidsAllergies.sqlite"
    private var db: OpaquePointer?
    
    // MARK: Public Variables
    public var params: [String: Any] = [:]
    
    // MARK: SQL Statements
    private final let createUserTable = """
        CREATE TABLE USERS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT,
            SURNAME TEXT,
            USERNAME TEXT,
            PASSWORD TEXT,
            CATEGORIES TEXT);
    """
    private final let insertUser = """
        INSERT INTO USERS (NAME, SURNAME, USERNAME, PASSWORD, CATEGORIES)
            VALUES (?, ?, ?, ?, ?);
    """
    
    // MARK: SQL Statement IDs
    // Next ID: 2
    public final let INSERT_USER: Int = 1
    
    // MARK: Initializers and open/close DB Methods
    init() {
        db = openDatabase()
        createTables()
    }
    
    private func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent(dbPath)
        var db:OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database!")
            return nil
        } else {
            return db
        }
        
    }
    
    // MARK: Helper Methods
    public func insertUser(_ withParams: [String: Any]) {
        params = withParams
        let userCreated = insert(INSERT_USER)
        NotificationCenter.default.post(name: CREATE_USER, object: nil, userInfo: ["userCreated": userCreated])
    }
    
    // MARK: Main SQL Methods
    private func createTables() {
        var createTableStatement: OpaquePointer?
        // Compile statements
        if sqlite3_prepare_v2(db, createUserTable, -1, &createTableStatement, nil) == SQLITE_OK {
            // Run compiled code
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Create User table created\n")
            } else {
                print("Create User table not created\n")
            }
        } else {
            print("Create Statement not ready!\n")
        }
        // Prevent resource leaks
        sqlite3_finalize(createTableStatement)
    }
    
    private func insert(_ query: Int) -> Bool {
        var insertStatement: OpaquePointer?
        switch query {
        case INSERT_USER:
            if sqlite3_prepare_v2(db, insertUser, -1, &insertStatement, nil) == SQLITE_OK {
                guard let user = params[User.className] as? User else {
                    sqlite3_finalize(insertStatement)
                    return false
                }
                let name = user.name as NSString
                let lastname = user.surname as NSString
                let username = user.username as NSString
                let password = user.password as NSString
                let category = user.categories[0] as NSString
                sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, lastname.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, username.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, password.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, category.utf8String, -1, nil)
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("User added successfully!\n")
                    sqlite3_finalize(insertStatement)
                    return true
                } else {
                  print("Could not insert row.\n")
                }
            } else {
                print("Insert user Statement not ready!\n")
            }
            break
        default:
            break
        }
        sqlite3_finalize(insertStatement)
        return false
    }
    
    
}
