
import UIKit
import YYCalendar

class TransactionViewController: UIViewController {


    @IBOutlet weak var mDateLabel: UILabel!
    @IBOutlet weak var mTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mDateLabel.text = getDate()

    }

    
    @IBAction func selectDate(_ sender: Any) {
        
        let calendar = YYCalendar(langType: .ENG, date: getDate(), format: "dd/MM/yyyy", disableAfterToday: false) { date in
            self.mDateLabel.text = date
        }
        
        calendar.show()
        
    }
    

}


extension TransactionViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as! TransactionTableViewCell
        
        cell.mAmount.text = "200฿"
        cell.mCategoryName.text = "Food"
        cell.mTag.text = "ข้าวมันไก่"
     
        
        return cell
        
    }
    
}


extension TransactionViewController{
    func getDate()->String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        return formattedDate
    }
}
