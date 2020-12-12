
struct Credit : Decodable {
    let creditReportInfo : CreditReportInfo
}

struct CreditReportInfo : Decodable {
    let score : Int
    let maxScoreValue : Int
    let minScoreValue : Int
}
