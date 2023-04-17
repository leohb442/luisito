//
//  TableViewCellFacultades.swift
//  PrototipoProyecto1
//
//  Created by UNAM FCA 09 on 06/04/22.
//

import UIKit

class TableViewCellFacultades: UITableViewCell {
    
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgFac: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
