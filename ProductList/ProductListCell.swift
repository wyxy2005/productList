//
//  ProductListCell.swift
//  ProductList
//
//  Created by yeemee on 2017/4/27.
//  Copyright © 2017年 yeemee. All rights reserved.
//

import UIKit
import AlamofireImage
import SnapKit


class ProductListCell: UITableViewCell {

    var product:Product? {
        willSet {
            self.appImageView?.image = nil
            self.vemImageView?.image = nil
        }
        
        didSet {
            self.appImageView?.af_setImage(withURL: URL.init(string: (self.product?.appImageURL)!)!)
            self.vemImageView?.af_setImage(withURL: URL(string: (self.product?.vemImageURL)!)!)
            self.cnameLabel?.text = self.product?.name
        }
    }
    var appImageView:UIImageView?
    var vemImageView:UIImageView?
    var cnameLabel:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        let appImageView = UIImageView()
//        appImageView.backgroundColor = UIColor.orange
        self.contentView.addSubview(appImageView)
        let appImageLabel = UILabel()
        appImageLabel.font = UIFont.systemFont(ofSize: 14)
        appImageLabel.text = "App"
        appImageLabel.textAlignment = .center
        self.contentView.addSubview(appImageLabel)
        
        let vemImageView = UIImageView()
        self.contentView.addSubview(vemImageView)
        let vemImageLabel = UILabel()
        vemImageLabel.font = UIFont.systemFont(ofSize: 14)
        vemImageLabel.textAlignment = .center
        vemImageLabel.text = "Vem"
        self.contentView.addSubview(vemImageLabel)
        
        let cnameLabel = UILabel()
        cnameLabel.font = UIFont.systemFont(ofSize: 15.5)
        cnameLabel.numberOfLines = 0
        self.contentView.addSubview(cnameLabel)
        
        appImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(13)
        }
        appImageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(appImageView)
            make.right.equalTo(appImageView)
            make.top.equalTo(appImageView.snp.bottom)
        }
        
        vemImageView.snp.makeConstraints { (make) in
            make.size.equalTo(appImageView)
            make.top.equalTo(appImageView)
            make.left.equalTo(appImageView.snp.right).offset(13)
        }
        vemImageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(vemImageView)
            make.right.equalTo(vemImageView)
            make.top.equalTo(vemImageView.snp.bottom)
        }
        
        cnameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appImageView)
            make.bottom.equalTo(appImageLabel)
            make.left.equalTo(vemImageView.snp.right).offset(13)
            make.right.equalToSuperview().offset(-13)
        }
        
        self.appImageView = appImageView
        self.vemImageView = vemImageView
        self.cnameLabel = cnameLabel
    }
    
}
