//
//  VEMListViewController.swift
//  ProductList
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit
import SnapKit

class VEMListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var vems:[VendingMachine] = []
    let identifier:String = "cell"
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVems()
        setupTableView()
    }
    
    //MARK: - Init
    
    private func setupVems() {
        for index in 1...10 {
            let vem:VendingMachine = VendingMachine(withVemId: String(index))
            self.vems.append(vem)
        }
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view .addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell?.textLabel?.text = "VEM_ID = " + self.vems[indexPath.row].vemId!
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let selectionVC = SelectionViewController()
        selectionVC.title = self.vems[indexPath.row].vemId
        selectionVC.vendingMachine = self.vems[indexPath.row]
        self.navigationController?.pushViewController(selectionVC, animated: true)
    }
}
