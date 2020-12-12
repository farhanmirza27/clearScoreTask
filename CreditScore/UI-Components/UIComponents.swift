
import UIKit

/// UIComponent class to create views with ease..
class UIComponents {
    static let shared = UIComponents()
    private init() {}
    
    /// label
    func label(text : String,alignment : NSTextAlignment = .left,fontSize : CGFloat = 13,numberOfLines : Int = 0, color : UIColor = .black) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = numberOfLines
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.textColor = color
        label.sizeToFit()
        return label
    }
}
