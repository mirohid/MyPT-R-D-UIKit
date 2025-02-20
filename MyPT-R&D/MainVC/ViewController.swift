//
//  ViewController.swift
//  MyPT-R&D
//
//  Created by MacMini6 on 11/02/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var submitBtn: UIButton!{
        didSet{
            submitBtn.layer.cornerRadius = 25
        }
    }
    
    var expandedCells = Set<Int>() // Track expanded cells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return expandedCells.contains(indexPath.row) ? 250 : 90  // Increase height when expanded
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.indexPath = indexPath  //  Assign indexPath so BtnTapped works
        cell.delegate = self        //  Assign delegate so it triggers expansion
        return cell
    }
}

// Handle Button Click to Expand/Collapse
extension ViewController: TableViewCellDelegate {
    func didTapExpandButton(at indexPath: IndexPath) {
        if expandedCells.contains(indexPath.row) {
            expandedCells.remove(indexPath.row) // Collapse
        } else {
            expandedCells.insert(indexPath.row) // Expand
        }
        // Reload only the affected row for smooth animation
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
        //Present the sheet when the AlternateExercise button is tapped
    
//        func didTapAlternateExerciseButton() {
//            let sheetVC = SheetVC(nibName: "SheetVC", bundle: nil) // Load from XIB
//            if let sheet = sheetVC.sheetPresentationController {
//                sheet.detents = [.medium()] // Set sizes
//                sheet.prefersGrabberVisible = true    // Show grabber handle
//            }
//            present(sheetVC, animated: true, completion: nil)
//        }
    
    func didTapAlternateExerciseButton() {
        let sheetVC = SheetVC(nibName: "SheetVC", bundle: nil) // Load from XIB
        
        if let sheet = sheetVC.sheetPresentationController {
            let customDetent = UISheetPresentationController.Detent.custom { context in
                return 350 // Set your desired height here
            }
            sheet.detents = [customDetent] // Apply custom height
            sheet.prefersGrabberVisible = true // Show grabber handle
        }
        
        present(sheetVC, animated: true, completion: nil)
    }
    
}
