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
    
    weak var delegate: TableViewCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
