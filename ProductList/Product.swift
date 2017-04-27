//
//  Product.swift
//  ProductList
//
//  Created by yeemee on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit

class Product: NSObject {
    var id:String?
    var CNAME:String?
    var vem_img:String?
    var app_img:String?
    
    var title:String? {
        get {
            return self.id! + self.CNAME!;
        }
    }
}
