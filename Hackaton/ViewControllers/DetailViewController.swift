//
//  DetailViewController.swift
//  Procket
//
//  Created by Pattarawadee Singhakul on 25/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet weak var mCardView: UIView!
    @IBOutlet weak var mCardViewTop: UIView!
    @IBOutlet weak var mTableView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mCardView.dropShadow()
        mCardViewTop.dropShadow()
        mTableView.dropShadow()

    }
    
    @IBAction func closeDetail() {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.selectedIndex = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

}
