import Foundation

// MARK: - TransResponseElement
struct TransResponseElement: Codable {
    let id, transactionID, transactionDateandTime, payerAccountNumber: String
    let payeeAccountNumber: String
    let totalAmount: Int
    let type: String
    let categories: [Category]
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case transactionID = "transactionId"
        case transactionDateandTime, payerAccountNumber, payeeAccountNumber, totalAmount, type, categories
        case v = "__v"
    }
}

// MARK: - Category
struct Category: Codable {
    let id, category: String
    let amount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case category, amount
    }
}

typealias TransResponse = [TransResponseElement]
