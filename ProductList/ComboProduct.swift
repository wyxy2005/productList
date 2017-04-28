//
//  ComboProduct.swift
//  ProductList
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit

class ComboProduct: NSObject, Product {
    
    var COMBO_ID:String?
    var PRODUCT_ID:String?
    var CNAME:String?
    var APP_PRICE:Double?
    var vem_price:Double?
    var COUPON:String?
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
            return self.vem_price
        }
    }
    
    var vemImageURL: String? {
        get {
            return self.VEM_IMG
        }
    }
    
    var name: String? {
        get  {
            return self.CNAME
        }
    }
}
