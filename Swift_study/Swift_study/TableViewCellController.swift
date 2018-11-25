//
//  TableViewCellController.swift
//  Swift_study
//
//  Created by 信次　智史 on 2018/11/25.
//  Copyright © 2018年 stoshi nobutsugu. All rights reserved.
//

import Foundation
import UIKit

class TableViewCellController: UIViewController {
    
    @IBOutlet weak var lable: UILabel!
    var text: String? 
    override func viewDidLoad() {
        super.viewDidLoad()
        lable.text = self.text
    }
}
