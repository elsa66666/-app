//
//  infoCheckTableViewCell.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/9.
//

import UIKit

class infoCheckTableViewCell: UITableViewCell {

    @IBOutlet weak var FullView: UIView!
    
    @IBOutlet weak var state: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        FullView.layer.cornerRadius = 10
        FullView.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        FullView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        FullView.layer.shadowRadius = 3
        FullView.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
