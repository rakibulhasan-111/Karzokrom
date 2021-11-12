//
//  karzoTableViewCell.swift
//  Karzokrom
//
//  Created by CSE on 11/8/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit

class karzoTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var karzo: UILabel!
    
    func Karzofn(table : karzosuchi) {
        
        //print(table.name, " ", table.karzo)
        name.text = table.name
        karzo.text = table.karzo
    }
}
