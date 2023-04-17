//
//  TableViewCellCafes.swift
//  PrototipoProyecto1
//
//  Created by Edel Fernando Santiago Castro on 23/04/22.
//

import UIKit

class TableViewCellCafes: UITableViewCell {

    @IBOutlet weak var lblcafe: UILabel!
    @IBOutlet weak var imgCafe: UIImageView!
    @IBOutlet weak var lblFacultad: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
