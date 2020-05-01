//
//  ToDoListTableViewCell.swift
//  Skillbox14
//
//  Created by Александр Сорока on 17.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var itemLabel: UILabel!
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
