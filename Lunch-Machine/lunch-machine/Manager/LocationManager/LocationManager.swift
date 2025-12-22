import Combine
import CoreLocation
import OSLog

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
        _: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        location = locations.first
    }

    func locationManager(
        _: CLLocationManager,
        didFailWithError error: Error
    ) {
        print("Location error \(error)")
    }
}
