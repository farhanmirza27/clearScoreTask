
struct CreditViewModel {
    var score : String
    
    init(credit : Credit) {
        score =  "\(credit.creditReportInfo.score)"
    }
}
