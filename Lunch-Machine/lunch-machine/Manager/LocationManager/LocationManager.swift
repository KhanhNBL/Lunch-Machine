import CoreLocation
import OSLog
import Combine

final class LocationManager: NSObject, ObservableObject {
    let manager = CLLocationManager()

    @Published
    var location: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
    }

    private func requestLocationPermission() {
        manager.requestWhenInUseAuthorization()
    }

    private func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }

    private func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }

    func requestAndStartUpdatingLocation() {
        requestLocationPermission()
        startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        location = locations.first
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Location error \(error)")
    }
}
