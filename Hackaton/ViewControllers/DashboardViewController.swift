

import UIKit
import Alamofire

class DashboardViewController: UIViewController {

    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var tranView: UIView!
    @IBOutlet weak var V1: UIView!
    @IBOutlet weak var V2: UIView!
    @IBOutlet weak var incomeImageView: UIImageView!
    @IBOutlet weak var expenseImageView: UIImageView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var income: UIView!
    @IBOutlet weak var expense: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showExpenseGrap()
        tranView.dropShadow()
        balanceView.dropShadow()
        feedData()
        setInExBalance()

        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        viewDidLoad()
//
//    }
    override func viewWillAppear(_ animated: Bool) {
        
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
        expense.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.662745098, blue: 0.6745098039, alpha: 1)
        expenseImageView.image = UIImage(named: "thai-baht-minus-light.png")
        incomeImageView.image = UIImage(named: "thai-baht-plus-click.png")
        income.dropShadow()

        
    }
    
    func showExpenseGrap(){
        V1.isHidden = true
        V2.isHidden = false
        V2.dropShadow()
        income.backgroundColor = #colorLiteral(red: 0.662745098, green: 0.7725490196, blue: 0.5764705882, alpha: 1)
        expense.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.4078431373, blue: 0.3725490196, alpha: 1)
        expenseImageView.image = UIImage(named: "thai-baht-minus-click.png")
        incomeImageView.image = UIImage(named: "thai-baht-plus-light.png")
        expense.dropShadow()
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
    func feedData(){
        AF.request("https://looksorns123.localtunnel.me/transaction/recent", method: .get).responseJSON{
            (response) in
            switch response.result{
            case .success(let value) :
                //print(value)
                do{
                    let result = try JSONDecoder().decode(TransResponse.self, from: response.data!)
                    let totalAmount = String(result[0].totalAmount)
                    let cate = "\(result[0].categories[0].category)"
                    let type = String(result[0].type)
                    self.setCategory(category: cate,type: type)
                    self.setTrans(total: totalAmount,type:type)
                }catch {
                    
                }
            case .failure(let error) :
                print(error)
            }
        }
        
    }
    
    func setCategory(category:String,type:String){
        switch type {
        case "expense":
            switch category {
            case "shopping":
                self.categoryImage.image = UIImage(named: "shopIcon.png")
                self.categoryLabel.text = category
            case "food":
                self.categoryImage.image = UIImage(named: "foodIcon.png")
                self.categoryLabel.text = category
            case "transportation":
                self.categoryImage.image = UIImage(named: "tranIcon.png")
                self.categoryLabel.text = category
            case "entertainment":
                self.categoryImage.image = UIImage(named: "entIcon.png")
                self.categoryLabel.text = category
            case "health":
                self.categoryImage.image = UIImage(named: "mediIcon.png")
                self.categoryLabel.text = category
            case "others":
                self.categoryImage.image = UIImage(named: "otherExIcon.png")
                self.categoryLabel.text = category
            default:
                break
            }
        case "income":
            switch category {
            case "salary":
                self.categoryImage.image = UIImage(named: "salaryIcon.png")
                self.categoryLabel.text = category
            case "gift":
                self.categoryImage.image = UIImage(named: "giftIcon.png")
                self.categoryLabel.text = category
            case "others":
                self.categoryImage.image = UIImage(named: "otherInIcon.png")
                self.categoryLabel.text = category
            default:
                break
            }
        default:
            break
        }
    }
    func setTrans(total:String,type:String){
        self.totalLabel.text = "\(total) ฿"
        if type == "income"{
            self.totalLabel.textColor = #colorLiteral(red: 0, green: 0.8470588235, blue: 0.3098039216, alpha: 1)}
        else{
            self.totalLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0.2862745098, alpha: 1)
        }
        
    }
    func setInExBalance(){
        AF.request("https://looksorns123.localtunnel.me/balance", method: .get).responseJSON{
            (response) in
            switch response.result{
            case .success(let value) :
                //print(value)
                do{
                    let result = try JSONDecoder().decode(BalanceResponse.self, from: response.data!)
                    self.balanceLabel.text = "\(result.balance) ฿"
                    
                }catch {
                    
                }
            case .failure(let error) :
                print(error)
            }
        }
        AF.request("https://looksorns123.localtunnel.me/inex", method: .get).responseJSON{
            (response) in
            switch response.result{
            case .success(let value) :
                //print(value)
                do{
                    let result = try JSONDecoder().decode(InexResponse.self, from: response.data!)
                    self.incomeLabel.text = "\(result[0].sum) ฿"
                    self.expenseLabel.text = "\(result[1].sum) ฿"
                    
                }catch {
                    
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    @IBAction func closeDetail() {
        self.tabBarController?.selectedIndex = 2
    }
    
}
