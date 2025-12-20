import CoreLocation

struct Restaurant: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var description: String

    private var coordinates: Coordinates

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

extension Restaurant {
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
