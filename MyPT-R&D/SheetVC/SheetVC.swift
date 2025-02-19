//
//  SheetVC.swift
//  MyPT-R&D
//
//  Created by MacMini6 on 12/02/25.
//

import UIKit
import SwiftUI
class SheetVC: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!{
        didSet{
            confirmBtn.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var view1: UIView!{
        didSet {
            view1.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var view2: UIView!{
        didSet {
            view2.layer.cornerRadius = 10
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  

}
