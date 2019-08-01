//
//  HeadlineTableViewCell.swift
//  Practical MVVM
//
//  Created by Gopi Krishna Kasireddy on 7/8/19.
//  Copyright © 2019 Gopi Krishna Kasireddy. All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

    @IBOutlet weak var details_btn: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
