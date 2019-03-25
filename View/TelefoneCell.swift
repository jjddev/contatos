//
//  TelefoneCell.swift
//  contatos
//
//  Created by juliano on 23/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit

class TelefoneCell: UITableViewCell {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
