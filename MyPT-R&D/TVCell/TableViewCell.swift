//
//  TableViewCell.swift
//  MyPT-R&D
//
//  Created by MacMini6 on 11/02/25.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapExpandButton(at indexPath: IndexPath)
    func didTapAlternateExerciseButton() // New function for sheet presentation
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var downArrowBtn: UIButton!
    @IBOutlet weak var tableView2: UITableView!
    weak var delegate: TableViewCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.register(UINib(nibName: "TVCellInsideCell", bundle: nil), forCellReuseIdentifier: "TVCellInsideCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    @IBAction func BtnTapped(_ sender: UIButton) {
        print("Down Arrow Button Tapped")
        guard let indexPath = indexPath else { return }
        delegate?.didTapExpandButton(at: indexPath)
    }
    
    @IBAction func AlternateExerciseBtnTapped(_ sender: UIButton) {
        delegate?.didTapAlternateExerciseButton() // Call delegate instead of presenting directly
    }
}

extension TableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "TVCellInsideCell", for: indexPath) as! TVCellInsideCell
        return cell2
    }
}
