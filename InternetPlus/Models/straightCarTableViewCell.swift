//
//  straightCarTableViewCell.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/16.
//

import UIKit

class straightCarTableViewCell: UITableViewCell {


    @IBOutlet weak var positionView: UIView!
    @IBOutlet weak var itemBottomLine: UIView!
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label1.layer.borderWidth = 0.5
        label1.layer.borderColor = #colorLiteral(red: 0.5570232868, green: 0.556581974, blue: 0.5783037543, alpha: 1)
        label1.layer.cornerRadius = 3
        label2.layer.borderWidth = 0.5
        label2.layer.borderColor = #colorLiteral(red: 0.5570232868, green: 0.556581974, blue: 0.5783037543, alpha: 1)
        label2.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
