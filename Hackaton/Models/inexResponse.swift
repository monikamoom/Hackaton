import Foundation

// MARK: - InexResponseElement
struct InexResponseElement: Codable {
    let id: String
    let sum: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case sum
    }
}

typealias InexResponse = [InexResponseElement]
