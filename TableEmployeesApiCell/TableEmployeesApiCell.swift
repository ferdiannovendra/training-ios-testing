//
//  TableEmployeesApiCell.swift
//  testing
//
//  Created by P090MMCTSE014 on 18/10/23.
//

import UIKit

class TableEmployeesApiCell: UITableViewCell {

    @IBOutlet weak var labelGaji: UILabel!
    @IBOutlet weak var labelUmur: UILabel!
    @IBOutlet weak var labelNama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setValue(value: Employee) {
        labelNama.text = value.nama
        labelGaji.text = String(value.gaji)
        labelUmur.text = String(value.umur)
        
//        if type == ProfileType.bio {
//            descriptionLabel.numberOfLines = 0
//        } else {
//            descriptionLabel.numberOfLines = 1
//        }
    }

    
}
