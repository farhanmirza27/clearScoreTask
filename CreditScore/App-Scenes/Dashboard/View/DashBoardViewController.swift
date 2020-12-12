
import UIKit
import ProgressHUD

/// Dashboard Scene view use cases..
protocol DashboardViewProtocol {
    func showScore(creditViewModel : CreditViewModel)
    func failure(message : String)
}

/// Dashboard Scene Controller..
class DashboardViewController : BaseViewController<DashboardPresenterProtocol,DashboardInteractorProtocol> {
    var donutView = DonutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getCreditScore()
    }
    /// get credit score...
    private func getCreditScore() {
        ProgressHUD.show()
        interactor.getCreditScore()
    }
}

/// setup UI and Constraints
extension DashboardViewController {
    /// setup UI
    func setupUI() {
        navigationItem.title = "Dashboard"
        view.addSubViews(views: donutView)
        setupConstraints()
    }
    /// setup constraints.
    func setupConstraints() {
        NSLayoutConstraint.activate([
            donutView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            donutView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            donutView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            donutView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2)
        ])
    }
}

// MARK: DashboardViewProtocol
extension DashboardViewController : DashboardViewProtocol {
    func showScore(creditViewModel: CreditViewModel) {
        ProgressHUD.dismiss()
        donutView.bindData(score: creditViewModel.score)
    }
    
    func failure(message : String) {
        ProgressHUD.dismiss()
        self.alertWithRetry(message: message) { [weak self] in
            self?.getCreditScore()
        }
    }
}
