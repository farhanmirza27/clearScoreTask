
/// Dashboard Scene presenter use cases...
protocol DashboardPresenterProtocol {
    var view : DashboardViewProtocol? {get set}
    func didFetch(credit : Credit)
    func failure(message : String)
}

///  Dashboard Scene Presenter class
class DashboardPresenter : DashboardPresenterProtocol {
    var view: DashboardViewProtocol?
    
    func didFetch(credit: Credit) {
        let creditViewModel = CreditViewModel(credit: credit)
        view?.showScore(creditViewModel: creditViewModel)
    }
    
    func failure(message: String) {
        view?.failure(message: message)
    }
}

