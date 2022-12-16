//
//  ViewController.swift
//  Demo
//
//  Created by xq on 2022/12/15.
//

import UIKit
import SnapKit
import XQUITextField_Navigation

class ViewController: UIViewController {
    
    let tf1 = UITextField()
    let tf2 = UITextField()
    let tv3 = UITextView()
    let tf4 = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tf1)
        self.view.addSubview(self.tf2)
        self.view.addSubview(self.tv3)
        self.view.addSubview(self.tf4)
        
        self.tf1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(44)
        }
        
        self.tf2.snp.makeConstraints { make in
            make.top.equalTo(self.tf1.snp.bottom).offset(12)
            make.left.right.height.equalTo(self.tf1)
        }
        
        self.tv3.snp.makeConstraints { make in
            make.top.equalTo(self.tf2.snp.bottom).offset(12)
            make.left.right.equalTo(self.tf1)
            make.height.equalTo(150)
        }
        
        self.tf4.snp.makeConstraints { make in
            make.top.equalTo(self.tv3.snp.bottom).offset(12)
            make.left.right.height.equalTo(self.tf1)
        }
        
        self.tf1.borderStyle = .roundedRect
        self.tf1.placeholder = "输入框1"
        
        self.tf2.borderStyle = .roundedRect
        self.tf2.placeholder = "输入框2"
        
        self.tv3.layer.borderWidth = 1
        self.tv3.layer.borderColor = UIColor.black.cgColor
        self.tv3.text = "I am UITextView"
        
        self.tf4.borderStyle = .roundedRect
        self.tf4.placeholder = "输入框4"
        
        self.view.xq_showTextField_Navigation()
        
    }


}

