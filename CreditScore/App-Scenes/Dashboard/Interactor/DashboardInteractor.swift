
import Foundation

/// Dashboard Scene Interactor use cases...
protocol DashboardInteractorProtocol {
    var worker : DashboardWorkerProtocol? {get set}
    var presenter : DashboardPresenterProtocol? {get set}
    func getCreditScore()
}

/// Dashboard Scene Interactor class to handle business logic...
class DashboardInteractor : DashboardInteractorProtocol {
    var worker: DashboardWorkerProtocol?
    var presenter: DashboardPresenterProtocol?
    
    /// get credit score..
    func getCreditScore() {
        worker?.getCreditScore(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let credit):
                    self.presenter?.didFetch(credit: credit)
                case .failure(let error):
                    self.presenter?.failure(message : error.localizedDescription)
                }
            }
        })
    }
}
