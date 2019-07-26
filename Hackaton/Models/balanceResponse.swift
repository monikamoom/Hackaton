import Foundation

// MARK: - BalanceResponse
struct BalanceResponse: Codable {
    let id, userAccountNo: String
    let balance: Int
    let updateTime: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userAccountNo, balance, updateTime
        case v = "__v"
    }
}
