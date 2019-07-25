
import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var mTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}


extension TransactionViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as! TransactionTableViewCell
        
        cell.mAmount.text = "100฿"
        cell.mCategoryName.text = "Food"
        cell.mTag.text = "good"
     
        
        return cell
        
    }
    
    
    
    
}
