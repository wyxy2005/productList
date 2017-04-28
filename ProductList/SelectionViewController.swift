//
//  SelectionViewController.swift
//  ProductList
//
//  Created by admin on 2017/4/28.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit

struct Selection {
    var title:String?
    var products:[AnyObject]?
}

class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var vendingMachine:VendingMachine?
    let identifier:String = "cell"
    var items:[Selection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupItems()
        setupTableView()
    }

    private func setupItems() {
        self.items.append(Selection(title: "Combo", products:self.vendingMachine?.combos))
        self.items.append(Selection(title: "Products", products:self.vendingMachine?.products))
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell?.textLabel?.text = self.items[indexPath.row].title
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let productListVC = ProductListViewController()
        productListVC.title = self.items[indexPath.row].title
        productListVC.products = self.items[indexPath.row].products as? [Product]
        self.navigationController?.pushViewController(productListVC, animated: true)
    }
}
