//=================================
import Foundation
//=================================
class QuebecTaxes {
    //# MARK: - Properties
    var gst: Float!
    var qst: Float!
    
    //# MARK: - getTaxes
    func getTaxes(initialAmount: Float) -> String {
        self.gst = initialAmount * 0.05
        self.qst = initialAmount * 0.09975
        return String(format: "%.2f", (self.gst + self.qst))
    }
    
    //# MARK: - getAmountWithTaxes
    func getAmountWithTaxes(initialAmount: Float) -> String {
        let taxes: Float = Float(self.getTaxes(initialAmount: initialAmount))!
        return String(format: "%.2f", (taxes + initialAmount))
    }    
}
//=================================
