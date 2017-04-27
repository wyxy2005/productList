//
//  ViewController.swift
//  ProductList
//
//  Created by yeemee on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit
import SnapKit
import MJExtension


struct Item {
    var title:String?
    var handler:(()->Void)?
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var items:[Item]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
       self.items = [Item(title: "combos", handler: {
            
                self.go2ListVC(withFileName: "combo.json")
        
            }), Item(title: "products",handler: {
                
                self.go2ListVC(withFileName: "product.json")
                
            })]
        
    }
    
    //MARK: - Private
    
    public func go2ListVC(withFileName fileName:String) -> Void {
//        let path = Bundle.main.path(forResource: fileName, ofType: nil)
//        
////        let json:String?
////        do {
////            json = try String.init(contentsOf: URL.init(fileURLWithPath: path!), encoding: String.Encoding.utf8)
////        } catch {
////            throw error
////        }
//    
//        if json?.characters.count == 0 {
//            print("json文件error")
//            return;
//        }
//        
//        let dict:NSDictionary = NSString(string: json!).mj_JSONObject() as! NSDictionary
//        let products = Product.mj_objectArray(withKeyValuesArray: dict["RECORDS"]) as! [Product]
//        
//        let listVC = ListViewController(products: products)
//        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    

    //MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell!.textLabel?.text = self.items?[indexPath.row].title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if self.items?[indexPath.row].handler != nil {
            self.items?[indexPath.row].handler!()
        }
        
    }
    

}

