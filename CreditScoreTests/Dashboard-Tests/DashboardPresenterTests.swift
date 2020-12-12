
import XCTest
@testable import CreditScore

/// Dashboard Scene Presenter tests...
class DashboardPresenterTests: XCTestCase {
    var sut : DashboardPresenter?
    var mockedView : MockedView?
    
    /// mocked Credit..
    var mockedCredit = Credit(accountIDVStatus: "1", creditReportInfo: CreditReportInfo(score: 540, maxScoreValue: 700, minScoreValue: 0))
    
    override func setUp() {
        sut = DashboardPresenter()
        mockedView = MockedView()
        sut?.view = mockedView
    }
    
    override func tearDown() {
        sut = nil
        mockedView = nil
    }
    
    /// test did fetch success
    func testDidFetch() {
        sut?.didFetch(credit: mockedCredit)
        XCTAssertEqual(mockedView?.crediViewModel?.score, "540")
    }
    
    /// test failure case
    func testFailure() {
        sut?.failure(message: "Failed to load")
        XCTAssertEqual(mockedView?.message, "Failed to load")
    }
    
    /// MockedView class
    class MockedView : DashboardViewProtocol {
        var crediViewModel : CreditViewModel?
        var message : String?
        func showScore(creditViewModel: CreditViewModel) {
            self.crediViewModel = creditViewModel
        }
        
        func failure(message: String) {
            self.message = message
        }
    }
}
