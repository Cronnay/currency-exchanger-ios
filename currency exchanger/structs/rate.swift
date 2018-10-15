import Foundation

struct Rate: Codable {
    let success: Bool
    let timestamp: Int
    let historical: Bool?
    let base: String
    let date: String
    let rates: [String: Double]
}
