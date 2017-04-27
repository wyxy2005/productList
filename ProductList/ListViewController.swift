//
//  ListViewController.swift
//  ProductList
//
//  Created by yeemee on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit



class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var products:Array<Product>!
    
    init(products:Array<Product>) {
        super.init(nibName: nil, bundle: nil)
        self.products = products
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        
        
    }

    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductListCell
        
        return cell
    }
    

}


