//
//  DataService.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/25/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Foundation

protocol DataService {
    func retrieveData(fromDatabasePath databasePath: Any) -> Data
    func writeData(toDatabasePath databasePath: Any, withData: Data)
    func updateData(_ databasePath: Any) -> Bool
}
