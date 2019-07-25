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
        self.mCardView.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1568627451, alpha: 0.55)
        self.backgroundColor = #colorLiteral(red: 0.1087233052, green: 0.1087233052, blue: 0.1087233052, alpha: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
