//
//  ProfileViewController.swift
//  Procket
//
//  Created by Pattarawadee Singhakul on 25/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    @IBOutlet weak var mCardView: UIView!
    @IBOutlet weak var mAvatarImage: UIImageView!
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mInformation: UIView!
    @IBOutlet weak var mCardInformation: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        mCardView.dropShadow()
        mAvatarImage.drawAsCircle()
        mName.text = "Krpton"
        mInformation.dropShadow()
        mCardInformation.dropShadow()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
