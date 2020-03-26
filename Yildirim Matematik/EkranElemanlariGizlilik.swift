//
//  EkranElemanlariGizlilik.swift
//  Yildirim Matematik
//
//  Created by Bekir Duran on 30.01.2020.
//  Copyright © 2020 info. All rights reserved.
//

import Foundation

class EkranElemanlariGizlilik:ViewController {
    
    func hepsiniGizle() {
           labelNum1.isHidden = true
           labelNum2.isHidden = true
           labelOp.isHidden = true
           chA.isHidden = true
           chB.isHidden = true
           chC.isHidden = true
           chD.isHidden = true
       }
       func hepsiniGoster() {
           labelNum1.isHidden = false
           labelNum2.isHidden = false
           labelOp.isHidden = false
           chA.isHidden = false
           chB.isHidden = false
           chC.isHidden = false
           chD.isHidden = false
       }
}
