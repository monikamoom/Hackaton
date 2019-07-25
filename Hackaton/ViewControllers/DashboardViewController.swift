

import UIKit

class DashboardViewController: UIViewController {

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

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDidLoad()
        
    }
    
    @IBAction func change(_ sender: UIButton) {
        changeGrpah(sender.titleLabel?.text)
        
    }

}

extension DashboardViewController{
    
    func showIncomeGraph(){
        V1.isHidden = false
        V2.isHidden = true
        V1.dropShadow()
        income.backgroundColor = #colorLiteral(red: 0.4196078431, green: 0.7803921569, blue: 0.368627451, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 0.9025627375, green: 0.5417140722, blue: 0.5517635942, alpha: 1)
    }
    
    func showExpenseGrap(){
        V1.isHidden = true
        V2.isHidden = false
        V2.dropShadow()
        income.backgroundColor = #colorLiteral(red: 0.6339422464, green: 0.77593261, blue: 0.5515819788, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.3725490196, blue: 0.3490196078, alpha: 1)
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
