import UIKit
import YYCalendar

class SubDetailViewController: UITableViewController {
    
    @IBOutlet weak var mPicture: UIView!
    @IBOutlet weak var mDateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mDateLabel.text = getDate()
        mPicture.dropShadow()
        
    }
    
    @IBAction func selectDate(_ sender: Any) {
        
        let calendar = YYCalendar(langType: .ENG, date: getDate(), format: "dd/MM/yyyy", disableAfterToday: false) { date in
            self.mDateLabel.text = date
        }
        
        calendar.show()
        
    }
}

extension SubDetailViewController{
    func getDate()->String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        let formattedDate = format.string(from: date)
        print(formattedDate)
        return formattedDate
    }
}
