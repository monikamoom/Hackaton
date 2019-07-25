import Foundation

// MARK: - ExpenseResponseElement
struct ExpenseResponseElement: Codable {
    let id, type: String
    let sum: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case type, sum
    }
}

typealias ExpenseResponse = [ExpenseResponseElement]
