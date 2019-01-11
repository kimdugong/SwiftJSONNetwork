//
//  StoreItem.swift
//  JSONNetwork
//
//  Created by Dugong on 11/01/2019.
//  Copyright © 2019 Dugong. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    var appId: String
    var clTax: String
    var dtInput: Int
    var nmProduct: String
    var noStore: String
    var reqType: String
    var seqStore: String
    var uParmFlg: String
    var userId: String
    var userType: String
    
    enum CodingKeys: String, CodingKey {
        case appId, clTax, dtInput, nmProduct, noStore, reqType, seqStore, uParmFlg, userId, userType
    }
    
    init(appId: String, clTax: String, dtIqput: Int, nmProduct: String, noStore: String, reqType: String, seqStore: String, uParmFlg: String, userId: String, userType: String) {
        self.appId = appId
        self.clTax = clTax
        
        self.dtInput = dtIqput
        
        self.nmProduct = nmProduct
        self.noStore = noStore
        self.reqType = reqType
        self.seqStore = seqStore
        self.uParmFlg = uParmFlg
        self.userId = userId
        self.userType = userType
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        let appId = try container.decode(String.self, forKey: .appId)
        let clTax = try container.decode(String.self, forKey: .clTax)
        let dtInput = try container.decode(String.self, forKey: .dtInput)
        let nmProduct = try container.decode(String.self, forKey: .nmProduct)
        let noStore = try container.decode(String.self, forKey: .noStore)
        let reqType = try container.decode(String.self, forKey: .reqType)
        let seqStore = try container.decode(String.self, forKey: .seqStore)
        let uParmFlg = try container.decode(String.self, forKey: .uParmFlg)
        let userId = try container.decode(String.self, forKey: .userId)
        let userType = try container.decode(String.self, forKey: .userType)
        
        let convertValue = dtInput == "" ? 0 : Int(dtInput) ?? 0
        
        self.init(appId: appId, clTax: clTax, dtIqput: convertValue, nmProduct: nmProduct, noStore: noStore, reqType: reqType, seqStore: seqStore, uParmFlg: uParmFlg, userId: userId, userType: userType)
    }
}
