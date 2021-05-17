//
//  CollectionTableViewCell.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/17.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var fullStack: UIView!
    @IBOutlet weak var hotView: UIView!
    @IBOutlet weak var hotLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var toApplyButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hotView.layer.cornerRadius = 6
        label1.layer.borderWidth = 1
        label1.layer.borderColor = #colorLiteral(red: 0.709908545, green: 0.7095959783, blue: 0.7269387841, alpha: 1)
        label1.layer.cornerRadius = 3
        toApplyButton.layer.cornerRadius = 8
        fullStack.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        fullStack.layer.shadowOffset = CGSize.init(width: 2, height: 2)

        //fullStack.layer.shadowOpacity = 1
        fullStack.layer.shadowRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
