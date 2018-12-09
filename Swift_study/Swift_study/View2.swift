//
//  View2.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/12/08.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import Foundation
import UIKit

class View2: UIViewController {
    
    var pageLabel : UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        pageLabel = UILabel()
        pageLabel!.frame = CGRect(x:20, y:80, width:self.view.bounds.size.width, height:20)
        pageLabel!.backgroundColor = UIColor.clear
        pageLabel!.text = "2"
        self.view.addSubview(pageLabel!)
        self.view.backgroundColor = UIColor.white
    }
}
