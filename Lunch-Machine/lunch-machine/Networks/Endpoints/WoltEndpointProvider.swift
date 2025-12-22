import Foundation

enum WoltEndpointProvider: EndpointProvider {
    case getRestaurants(latitude: Double, longitude: Double)
    
    var baseURL: String {
        return "restaurant-api.wolt.com/v1"
    }
    
    var path: String {
        return "/pages/restaurants"
    }

    var method: RequestMethod {
        switch self {
            case .getRestaurants:
                return .get
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
            case .getRestaurants(let lat, let lon):
                return [
                    .init(name: "lat", value: "\(lat)"),
                    .init(name: "lon", value: "\(lon)"),
                ]
        }
    }

    var body: [String: Any]? {
        return nil
    }

    var mockFile: String? {
        return nil
    }
}
