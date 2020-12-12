import UIKit

extension UIView {
    /// add sub-view
    func addSubViews(views : UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}
