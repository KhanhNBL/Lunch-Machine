import CoreLocation
import MapKit
import Combine

class GeocodeManager: ObservableObject {
    private let geocoder = CLGeocoder()

    func forwardGeocoding(address: String) async -> [CLPlacemark] {
        do {
            return try await geocoder.geocodeAddressString(address)
        } catch {
            return []
        }

    }

    func reverseGeocoding(location: CLLocation) async -> [CLPlacemark] {
        do {
            return try await geocoder.reverseGeocodeLocation(location)
        } catch {
            return []
        }
    }

    func searchBy(string: String, region: MKCoordinateRegion) {

    }
}

extension Array where Element == CLPlacemark {
    func convert() -> [Landmark] {
        return self.map { placemark in
            return Landmark(
                id: UUID(),
                name: placemark.name,
                thoroughfare: placemark.thoroughfare
            )
        }
    }
}
