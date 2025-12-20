import Foundation
import Combine
import CoreLocation

class RestaurantsRepository: ObservableObject {
    let apiClient: ApiProtocol
    let locationManager: LocationManager

    init(
        apiClient: ApiProtocol = ApiClient(),
        locationManager: LocationManager = LocationManager()
    ) {
        self.apiClient = apiClient
        self.locationManager = locationManager
    }

    @MainActor func fetchRestaurants() async throws -> WoltResults {
        guard let coordinate = locationManager.location?.coordinate else {
            throw ApiError(
                statusCode: 400,
                errorCode: "no-location",
                message: "Cannot fetch current location"
            )
        }

        let results: WoltResults = try await apiClient.asyncRequest(
            endpoint: WoltEndpointProvider.getRestaurants(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        )
        return results
    }
}

