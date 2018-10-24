import UIKit
import Foundation

class MainViewController: UIViewController {
    // Defines the variables
    var rates: Rate?
    var Rates: URLBuilder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // When view has been loaded, Rates will create a new instance of URLBuilder class
        Rates = URLBuilder()
        
        // Gets the rates for today.
        getRatesforToday()
    }
    public func getRatesforToday() -> Void {
        let url: URL = Rates!.getURL("latest")
        Rates!.createRequest(url: url) { (response: Rate?) in
            if let resp = response {
                self.rates = resp
            }
        }
    }
}
