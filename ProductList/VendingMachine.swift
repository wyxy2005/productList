//
//  VendingMachine.swift
//  ProductList
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit
import MJExtension

class VendingMachine: NSObject {
    var vemId:String?
    
    lazy var products:[VEMProduct]? = {
        let vemProducts:NSMutableArray = VEMProduct.mj_objectArray(withKeyValuesArray: self.dataArray(withFileName: "products_vem.json"))
        let vemProductsByVemId = NSPredicate(format: "vem_id = %@", self.vemId!)
        return vemProducts.filtered(using: vemProductsByVemId) as? [VEMProduct]
    }()
    
    lazy var combos:[VEMCombo]? = {
        let vemCombos:NSMutableArray = VEMCombo.mj_objectArray(withKeyValuesArray: self.dataArray(withFileName: "combo_vem.json"))
        let vemCombosByVemId = NSPredicate(format: "VEM_ID = %@", self.vemId!)
        return vemCombos.filtered(using: vemCombosByVemId) as? [VEMCombo]
    }()
    
    init(withVemId vemId:String?) {
        super.init()
        self.vemId = vemId
    }
    
    
    //MARK: - Private
    
    private func dataArray(withFileName fileName:String) -> NSArray? {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)
        var JSONString:String?
        do {
            JSONString = try String.init(contentsOf: URL.init(fileURLWithPath: path!), encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
        let dict:NSDictionary = NSString(string: JSONString!).mj_JSONObject() as! NSDictionary
        return dict["RECORDS"] as? NSArray
    }
}
