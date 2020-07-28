//
//  swifttestViewController.swift
//  teststronge
//
//  Created by 刘佳 on 2020/7/29.
//  Copyright © 2020 OS. All rights reserved.
//

import UIKit

class swifttestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let array = ["a","b","c"]
        for (index,value) in array.enumerated() {
            let backView = UIView()
            self.view.addSubview(backView)
            backView.snp.makeConstraints { (make) in
                make.top.equalTo(0)
                make.size.equalTo(CGSize.init(width: 200, height: 40))
                make.left.equalTo(index * 40)
            }
            
            let btn = UIButton.init(type: .custom)
            btn.setTitleColor(.yellow, for: .selected)
            btn.setTitleColor(.green, for: .normal)
            btn.addTarget(self, action: #selector(changeClick(sender:)), for: .touchUpInside)
            backView.addSubview(btn)
            btn.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
            //title
            let titleLabel = UILabel.init()
            titleLabel.text = value
            titleLabel.font = UIFont.systemFont(ofSize: 15.0)
            backView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(15)
                make.centerY.equalToSuperview()
            }
            
            //UISwitch
            let swit = UISwitch.init()
            backView.addSubview(swit)
            swit.onTintColor = .yellow
            swit.tintColor = .red
            //圆形颜色
            swit.thumbTintColor = .blue
            swit.transform = CGAffineTransform(scaleX: 0.8, y: 0.8);
            swit.snp.makeConstraints { (make) in
                make.left.equalTo(titleLabel.snp.right).offset(10)
                make.centerY.equalToSuperview()
            }
        }
    }

        @objc func changeClick(sender:UIButton){
            sender.isSelected = !sender.isSelected
        }
    }
    

}
