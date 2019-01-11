//
//  TableCell.swift
//  JSONNetwork
//
//  Created by Dugong on 11/01/2019.
//  Copyright © 2019 Dugong. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func updateUI(storeData: StoreItem, indexPath: IndexPath) {
        label1.text = storeData.nmProduct
        label2.text = storeData.seqStore
    }
}
