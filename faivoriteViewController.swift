
import UIKit

class faivoriteViewController: UIViewController, UINavigationBarDelegate {
    @IBOutlet weak var faivoriteNavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faivoriteNavigationBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func  position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    

}
