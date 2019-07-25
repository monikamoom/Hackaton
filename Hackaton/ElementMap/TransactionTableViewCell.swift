//
//  TransactionTableViewCell.swift
//  Procket
//
//  Created by papob boonpat on 25/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
//    static let CellIdentifier: String = "TransactionTableViewCell"

    @IBOutlet weak var mCardView: UIView!
    @IBOutlet weak var mTag: UILabel!
    @IBOutlet weak var mAmount: UILabel!
    @IBOutlet weak var mCategoryName: UILabel!
    @IBOutlet weak var mCategoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mCardView.drawAsCircle(radius: 5)
        self.mCardView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
