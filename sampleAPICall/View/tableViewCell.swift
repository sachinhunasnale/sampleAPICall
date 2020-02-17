//
//  tableView.swift
//  sampleAPICall
//
//  Created by Sachin Baburao on 04/02/20.
//  Copyright © 2020 3i Infotech. All rights reserved.
//

import Foundation
import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var salary: UILabel!
    
    var empViewModel:EmpViewModel! {
        didSet{
            self.name.text = empViewModel.name
            self.salary.text = empViewModel.salary
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .red : .white
    }
    
}
