//
//  ViewController.swift
//  Hackaton
//
//  Created by s89506 on 24/7/2562 BE.
//  Copyright © 2562 s89506. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var tranView: UIView!
    @IBOutlet weak var V1: UIView!
    @IBOutlet weak var V2: UIView!
    
    @IBOutlet weak var income: UIView!
    @IBOutlet weak var expense: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showIncomeGraph()
        tranView.dropShadow()
        balanceView.dropShadow()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change(_ sender: UIButton) {
        changeGrpah(sender.titleLabel?.text)
        
    }
    

}


extension ViewController{
    
    func showIncomeGraph(){
        V1.isHidden = false
        V2.isHidden = true
        V1.dropShadow()
        income.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 1, green: 0.5472803116, blue: 0.4751736522, alpha: 1)
    }
    
    func showExpenseGrap(){
        V1.isHidden = true
        V2.isHidden = false
        V2.dropShadow()
        income.backgroundColor = #colorLiteral(red: 0.1704154909, green: 0.8661643267, blue: 0.487077415, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.2980392157, blue: 0.2352941176, alpha: 1)
    }
    
    func changeGrpah(_ page:String!){
        switch page {
        case "income":
            showIncomeGraph()
        case "expense":
            showExpenseGrap()
        default:
            break
        }

    }
}

