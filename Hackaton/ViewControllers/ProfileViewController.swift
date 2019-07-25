//
//  ProfileViewController.swift
//  Procket
//
//  Created by Pattarawadee Singhakul on 25/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var mAvatarImage: UIImageView!
    @IBOutlet weak var mName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mAvatarImage.drawAsCircle()
        mName.text = "Pattarawadee Singhakul"
    }
}
