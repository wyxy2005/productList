//
//  VEMCombo.swift
//  ProductList
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit

class VEMCombo: NSObject, Product {
    var VEM_ID:String?
    var COMBO_ID:String?
    var CNAME:String?
    var APP_PRICE:Double?
    var VEM_PRICE:Double?
    var APP_IMG:String?
    var VEM_IMG:String?
    
    var appPrice: Double? {
        get {
            return self.APP_PRICE
        }
    }
    
    var appImageURL: String? {
        get {
            return self.APP_IMG
        }
    }
    
    var vemPrice: Double? {
        get {
            return self.VEM_PRICE
        }
    }
    
    var vemImageURL: String? {
        get {
            return self.VEM_IMG
        }
    }
    
    var name: String? {
        get {
            return self.CNAME
        }
    }
}
