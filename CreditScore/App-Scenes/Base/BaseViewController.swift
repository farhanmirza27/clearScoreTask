
import UIKit

class BaseViewController<P,I> : UIViewController  {
    var presenter : P
    var interactor : I

    init(presenter : P, interactor : I) {
        self.presenter = presenter
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasicUI()
    }
    
    private func setupBasicUI() {
        view.backgroundColor = .white
    }
}
