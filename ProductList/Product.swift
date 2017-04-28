//
//  Product.swift
//  ProductList
//
//  Created by admin on 2017/4/28.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import Foundation

protocol Product {
    
    var appPrice:Double? { get }
    
    var appImageURL:String? { get }
    
    var vemPrice:Double? { get }
    
    var vemImageURL:String? { get }
    
    var name:String? { get }
    
}
