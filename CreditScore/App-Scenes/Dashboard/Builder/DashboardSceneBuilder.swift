
/// Dashboard Scene builder class to handle dependencies...
class DashboardSceneBuilder {
    static func buildScene() -> DashboardViewController {
        let worker = DashboardWorker()
        let interactor = DashboardInteractor()
        let presenter  = DashboardPresenter()
        
        interactor.worker = worker
        interactor.presenter = presenter
        
        let view = DashboardViewController(presenter: presenter, interactor: interactor)
        presenter.view = view
        return view
    }
}
