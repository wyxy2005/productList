//
//  VEMProduct.swift
//  ProductList
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit

class VEMProduct: NSObject, Product {
    var vem_id:String?
    var product_id:String?
    var CNAME:String?
    var app_price:Double?
    var vem_price:Double?
    var APP_IMG:String?
    var VEM_IMG:String?
    
    var appPrice: Double? {
        get {
            return self.app_price
        }
    }
    
    var appImageURL: String? {
        get {
            return self.APP_IMG
        }
    }
    
    var vemPrice: Double? {
        get {
            return self.vem_price
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
