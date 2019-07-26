
import UIKit
import YYCalendar
import Alamofire

class TransactionViewController: UIViewController {


   
    @IBOutlet weak var mAlert: UIView!

    @IBOutlet weak var mDateLabel: UILabel!
    @IBOutlet weak var mTableview: UITableView!
    var mTransactionArray:TransResponse = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mAlert.isHidden = false
        self.mTableview.isHidden = true
        self.mDateLabel.text = getParamDate()
        let Date = getParamDate()
        feedData(Date: Date)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.mDateLabel.text = getParamDate()
        let Date = getParamDate()
        feedData(Date: Date)

    }

    
    @IBAction func selectDate(_ sender: Any) {
        
        let calendar = YYCalendar(langType: .ENG, date: getDate(), format: "yyyy-MM-dd", disableAfterToday: true) { date in
            
            self.feedData(Date: date)
            self.mDateLabel.text = date
        }
        
        calendar.show()
        
    }
    

}


extension TransactionViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mTransactionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as! TransactionTableViewCell
        print(indexPath.row)
        print(mTransactionArray[indexPath.row].categories[0])
        let mData = mTransactionArray[indexPath.row].categories[0]
        
        cell.mAmount.text = "\(String(mData.amount)) ฿"
        cell.mCategoryName.text = mData.category
        cell.mTag.text = "Tag"
        switch mTransactionArray[indexPath.row].type {
        case "income":
            cell.mAmount.textColor = #colorLiteral(red: 0, green: 0.8475771546, blue: 0.3085287809, alpha: 1)
        case "expense":
            cell.mAmount.textColor = #colorLiteral(red: 1, green: 0, blue: 0.2847501636, alpha: 1)
        default:
            break
        }
        
        cell.mCategoryImage.image = setImage(type: mTransactionArray[indexPath.row].type, category: mData.category)
     
        
        return cell
        
    }
    
}


extension TransactionViewController{
    
    func setImage(type: String,category: String)->UIImage{
        switch type {
         case "expense":
            switch category {
            case "shopping":
                 return UIImage(named: "shopIcon.png")!
            case "food":
                 return UIImage(named: "foodIcon.png")!
            case "transportation":
                 return UIImage(named: "tranIcon.png")!
            case "entertainment":
                 return UIImage(named: "entIcon.png")!
            case "health":
                 return UIImage(named: "mediIcon.png")!
            case "others":
                 return UIImage(named: "otherExIcon.png")!
            default:
                return UIImage(named: "foodIcon.png")!
            }
        case "income":
            switch category {
            case "salary":
               return  UIImage(named: "salaryIcon.png")!
            case "gift":
                return UIImage(named: "giftIcon.png")!
            case "others":
                return UIImage(named: "otherInIcon.png")!
            default:
                return UIImage(named: "foodIcon.png")!
            }
        default:
         return UIImage(named: "foodIcon.png")!
        }
    }
    
    func getDate()->String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        return formattedDate
    }
    func getParamDate()->String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        return formattedDate
    }
    
    func feedData(Date:String){
        
        AF.request("https://looksorns123.localtunnel.me/transaction/date/\(Date)", method: .get).responseJSON{
            (response) in
            switch response.result{
            case .success(let value) :
                print(value)
                do{
                    let result = try JSONDecoder().decode(TransResponse.self, from: response.data!)
                    print(result)
                    self.mTransactionArray = result
                    if self.mTransactionArray.count == 0 {
                        self.mAlert.isHidden = false
                        self.mTableview.isHidden = true
                        
                    }else{
                        self.mAlert.isHidden = true
                        self.mTableview.isHidden = false
                        self.mTableview.reloadData()
                    }
                    
                    
                }catch {
                    
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
}
