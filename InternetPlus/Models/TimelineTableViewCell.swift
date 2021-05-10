//
//  TimelineTableViewCell.swift
//  TimelineTableViewCell
//
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var operationTitle: UILabel!
    
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var submitTimeLabel: UILabel!
    
    @IBOutlet weak var operateButton: UIButton!
    @IBOutlet weak var timelineLineView: UIView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var seeAddition: UIButton!
    @IBOutlet weak var submitPerson: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seeAddition.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
