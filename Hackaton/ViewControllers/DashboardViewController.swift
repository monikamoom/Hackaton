

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var tranView: UIView!
    @IBOutlet weak var V1: UIView!
    @IBOutlet weak var V2: UIView!
    @IBOutlet weak var incomeImageView: UIImageView!
    @IBOutlet weak var expenseImageView: UIImageView!
    
    @IBOutlet weak var income: UIView!
    @IBOutlet weak var expense: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showExpenseGrap()
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
        income.backgroundColor = #colorLiteral(red: 0.5098039216, green: 0.7725490196, blue: 0.4196078431, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.5568627451, blue: 0.5607843137, alpha: 1)
        expenseImageView.image = UIImage(named: "thai-baht-minus-light.png")
        incomeImageView.image = UIImage(named: "thai-baht-plus-click.png")

        
    }
    
    func showExpenseGrap(){
        V1.isHidden = true
        V2.isHidden = false
        V2.dropShadow()
        income.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.7725490196, blue: 0.5764705882, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.4078431373, blue: 0.3725490196, alpha: 1)
        expenseImageView.image = UIImage(named: "thai-baht-minus-click.png")
        incomeImageView.image = UIImage(named: "thai-baht-plus-light.png")
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
