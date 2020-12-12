
import XCTest
@testable import CreditScore

/// Dashboard Scene Interactor tests..
class DashboardInteractorTests: XCTestCase {
    var sut : DashboardInteractor?
    var mockedWorker : MockedWorker?
    var mockedPresenter : MockedPresenter?
    
    override func setUp() {
        sut = DashboardInteractor()
        mockedWorker = MockedWorker()
        mockedPresenter = MockedPresenter()
        sut?.worker = mockedWorker
        sut?.presenter = mockedPresenter
    }
    
    /// test get credit score success
    func testGetCreditScoreSuccess() {
        mockedWorker?.dataReturnedFromAPI = true
        sut?.getCreditScore()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(self.mockedPresenter!.credit!.creditReportInfo.score, 540)
        }
    }
    
    /// test get credit score failure case
    func testGetCreditScoreFail() {
        mockedWorker?.dataReturnedFromAPI = false
        sut?.getCreditScore()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue((self.mockedPresenter!.failureCalled))
        }
    }
    
    // Mocked Woker class
    class MockedWorker : DashboardWorkerProtocol {
        var dataReturnedFromAPI = false
        func getCreditScore(completion: @escaping (Result<Credit, Error>) -> ()) {
            if dataReturnedFromAPI {
                let mockedCredit = Credit(accountIDVStatus: "1", creditReportInfo: CreditReportInfo(score: 540, maxScoreValue: 700, minScoreValue: 0))
                completion(.success(mockedCredit))
            }
            else {
                completion(.failure(NSError(domain: "", code: 1, userInfo: nil)))
            }
        }
    }
    
    // Mocked Presenter class
    class MockedPresenter : DashboardPresenterProtocol {
        var view: DashboardViewProtocol?
        var credit : Credit?
        var failureCalled = false
        func didFetch(credit: Credit) {
            self.credit = credit
        }
        
        func failure(message: String) {
            failureCalled = true
        }
    }
}
