
import Foundation

/// Dashboard Scene Worker use cases...
protocol DashboardWorkerProtocol {
    func getCreditScore(completion : @escaping (Result<Credit,Error>) ->())
}

/// Dashboard Scene  Worker class to handle data requests from interactor..
class DashboardWorker : DashboardWorkerProtocol {
    func getCreditScore(completion: @escaping (Result<Credit, Error>) -> ()) {
        let resource = Resource<Credit>(url: URL.creditScoreURL()!)
        URLRequest.load(resource: resource) { result in
            switch result {
            case .success(let creditScore):
                completion(.success(creditScore))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
