//=================================
import UIKit
//=================================
class ViewController: UIViewController {
    
    @IBOutlet weak var labelNumberToDisplay: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    var numberToDisplay: String = ""
    var decimalClicked: Bool = false
    var decimalCounter: Int = -1
    var totalAmount: Float = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelNumberToDisplay.text = Singleton.sharedInstance.totalAmount
        self.totalAmount = Singleton.sharedInstance.totalAmountAsFloat
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonsManager(_ sender: UIButton) {
        switch sender.tag {
            case 10 :
                if !decimalClicked {
                    decimalClicked = true
                    displayAmount(theString: ".")
                }
            case 11 :
                if sender.alpha != 0.5 {
                    addingTotal()
                    sender.alpha = 0.5
                }
            default:
                self.plusButton.alpha = 1.0
                displayAmount(theString: String(sender.tag))
        }
    }
    
    private func displayAmount(theString: String) {
        if decimalClicked {
            decimalCounter += 1
            if decimalCounter <= 2 {
                numberToDisplay += theString
                labelNumberToDisplay.text = "$\(numberToDisplay)"
            }
        } else {
            numberToDisplay += theString
            labelNumberToDisplay.text = "$\(numberToDisplay)"
        }
    }
    
    @IBAction func erase(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Message", message: "Do you really want to erase everything?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
                self.numberToDisplay = ""
                self.labelNumberToDisplay.text = "$0.00"
                self.decimalClicked = false
                self.decimalCounter = -1
                self.totalAmount = 0.00
                self.plusButton.alpha = 0.5
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func addingTotal() {
        self.totalAmount += Float(numberToDisplay)!
        self.numberToDisplay = ""
        self.labelNumberToDisplay.text = String(format: "Total = $%.2f", self.totalAmount)
        self.decimalClicked = false
        self.decimalCounter = -1
    }
    
    @IBAction func sendToSingleton(_ sender: UIButton) {
        Singleton.sharedInstance.totalAmountAsFloat = self.totalAmount
        Singleton.sharedInstance.totalAmount = String(format: "Total = $%.2f", self.totalAmount)
    }
}
//=================================












