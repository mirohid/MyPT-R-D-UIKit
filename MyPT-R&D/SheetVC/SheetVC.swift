//
//  SheetVC.swift
//  MyPT-R&D
//
//  Created by MacMini6 on 12/02/25.
//

import UIKit
import SwiftUI
class SheetVC: UIViewController {

    
    @IBOutlet weak var sheetTVCell: UITableView!
    
    @IBOutlet weak var confirmBtn: UIButton!{
        didSet{
            confirmBtn.layer.cornerRadius = 15
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sheetTVCell.dataSource = self
        sheetTVCell.delegate = self
        sheetTVCell.register(UINib(nibName: "SheetTVCell", bundle: nil), forCellReuseIdentifier: "SheetTVCell")
    }
}

extension SheetVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sheetTVCell.dequeueReusableCell(withIdentifier: "SheetTVCell", for: indexPath) as! SheetTVCell
        return cell
    }
}
