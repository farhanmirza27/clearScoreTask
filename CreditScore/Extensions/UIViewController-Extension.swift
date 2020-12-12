
import UIKit

/// alert
extension UIViewController {
    func alertWithRetry(message: String = "", title : String = "", retryClosure: @escaping () -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in
            retryClosure()
        }
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
