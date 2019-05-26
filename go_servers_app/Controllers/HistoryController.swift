import UIKit
import Alamofire
import AlamofireImage

class HistoryController: UIViewController {
    
    var apiBasePath: String = "http://localhost:4500/api/v1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Alamofire.request("\(apiBasePath)/history").responseString { response in
            if let json = response.result.value {
                let history: [Domain] = [Domain](json: json)
                print(history)
                history.forEach { domain in
                    print(domain)
                }
            }
        }
    }
}
