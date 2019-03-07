//
//  ViewController.swift
//  UIChainable
//
//  Created by yfm on 2019/3/7.
//  Copyright © 2019年 yfm. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var timeLabel: UILabel = {
        return UILabel.Builder()
            .background(color: .lightGray)
            .text(text: "10:20")
            .textColor(color: .cyan)
            .textAlignment(textAlignment: .center)
            .build()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel
            .addTo(superView: self.view)
            .layout { (make) in
                make.center.equalToSuperview()
                make.width.height.equalTo(100)
            }
    }


}
