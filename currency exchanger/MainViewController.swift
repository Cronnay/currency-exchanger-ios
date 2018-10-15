import UIKit
import Foundation

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Rates = URLBuilder()
        print(Rates.getRatesforToday())
    }
}
