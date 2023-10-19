//
//  CoreDataCellTableViewCell.swift
//  testing
//
//  Created by P090MMCTSE014 on 19/10/23.
//

import UIKit

class CoreDataCellTableViewCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelSalary: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
