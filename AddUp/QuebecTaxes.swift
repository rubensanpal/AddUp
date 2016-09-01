//=================================
import Foundation
//=================================
class QuebecTaxes {
    
    var gst: Float!
    var qst: Float!
    
    func getTaxes(initialAmount: Float) -> String {
        self.gst = initialAmount * 0.05
        self.qst = initialAmount * 0.09975
        return String(format: "%.2f", (self.gst + self.qst))
    }
    
    func getAmountWithTaxes(initialAmount: Float) -> String {
        let taxes: Float = Float(self.getTaxes(initialAmount: initialAmount))!
        return String(format: "%.2f", (taxes + initialAmount))
    }    
}
//=================================
