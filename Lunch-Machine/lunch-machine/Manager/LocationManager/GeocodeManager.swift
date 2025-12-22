import Combine
import CoreLocation
import MapKit

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

    func searchBy(string _: String, region _: MKCoordinateRegion) {}
}

extension Array where Element == CLPlacemark {
    func convert() -> [Landmark] {
        return map { placemark in
            Landmark(
                id: UUID(),
                name: placemark.name,
                thoroughfare: placemark.thoroughfare
            )
        }
    }
}
