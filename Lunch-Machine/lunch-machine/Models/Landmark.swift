import CoreLocation
import Foundation

struct Landmark: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String?
    var thoroughfare: String?
}
