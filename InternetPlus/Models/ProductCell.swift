//
//  ProductCell.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/4.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var CellMainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CellMainView.layer.cornerRadius = 10
        CellMainView.layer.shadowOpacity = 1
        CellMainView.layer.shadowRadius = 3
        CellMainView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        CellMainView.layer.shadowColor = #colorLiteral(red: 0.6883381009, green: 0.713113308, blue: 0.9509810805, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
