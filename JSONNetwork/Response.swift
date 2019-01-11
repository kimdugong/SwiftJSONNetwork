//
//  Data.swift
//  JSONNetwork
//
//  Created by Dugong on 10/01/2019.
//  Copyright © 2019 Dugong. All rights reserved.
//

import Foundation

struct Response: Codable {
    var message: String
    var result: String
    var storeItems: [StoreItem]
    
    enum CodingKeys: String, CodingKey {
        case message = "Msg"
        case result = "Result"
        case storeItems = "StoreItems"
    }
}
