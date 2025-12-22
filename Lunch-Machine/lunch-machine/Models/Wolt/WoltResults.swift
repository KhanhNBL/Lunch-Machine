import Foundation

// MARK: - WoltResults

struct WoltResults: Codable, Hashable {
    let created: DateTimestamp?
    let expiresInSeconds: Int?
    let filtering: WoltResultsFiltering?
    let name: String?
    let pageTitle: String?
    let sections: [Section]?
    let showLargeTitle: Bool?
    let showMap: Bool?
    let sorting: WoltResultsSorting?
    let trackID: String?

    // MARK: - DateTimestamp

    struct DateTimestamp: Codable, Hashable {
        let date: Int?
    }

    // MARK: - WoltResultsFiltering

    struct WoltResultsFiltering: Codable, Hashable {
        let filters: [SortableElement]
    }

    // MARK: - SortableElement

    struct SortableElement: Codable, Hashable {
        let id: String
        let name: String
        let type: String
        let values: [Cuisine]
    }

    // MARK: - Cuisine

    struct Cuisine: Codable, Hashable {
        let id: String?
        let name: String?
    }

    // MARK: - Section

    struct Section: Codable, Hashable {
        let contentID: String?
        let endOfSection: EndOfSection?
        let hideDeliveryInfo: Bool?
        let items: [Item]?
        let link: EndOfSectionLink?
        let name: String?
        let template: String?
        let title: String?
    }

    // MARK: - EndOfSection

    struct EndOfSection: Codable, Hashable {
        let link: EndOfSectionLink?
        let type: String?
    }

    // MARK: - EndOfSectionLink

    struct EndOfSectionLink: Codable, Hashable {
        let target: String?
        let targetSort: TargetSort?
        let targetTitle: String?
        let title: String?
        let type: String?
    }

    enum TargetSort: String, Codable, Hashable {
        case deliversTo = "delivers-to"
    }

    // MARK: - Item

    struct Item: Codable, Hashable {
        let contentID: String?
        let description: String?
        let image: Image?
        let link: ItemLink?
        let quantity: Int?
        let quantityStr: String?
        let template: ItemTemplate?
        let title: String?
        let trackID: String?
        let filtering: ItemFiltering?
        let sorting: ItemSorting?
        let telemetryVenueBadges: [TelemetryVenueBadge]?
        let venue: Venue?
    }

    // MARK: - ItemFiltering

    struct ItemFiltering: Codable, Hashable {
        let filters: [PurpleFilter]?
    }

    // MARK: - PurpleFilter

    struct PurpleFilter: Codable, Hashable {
        let id: PurpleID?
        let values: [String]
    }

    enum PurpleID: String, Codable, Hashable {
        case priceRange = "price-range"
        case primary
        case woltPlus = "wolt-plus"
    }

    // MARK: - Image

    struct Image: Codable, Hashable {
        let blurhash: String
        let url: String
    }

    // MARK: - ItemLink

    struct ItemLink: Codable, Hashable {
        let target: String?
        let targetSort: TargetSort?
        let targetTitle: String?
        let title: String?
        let type: String?
        let selectedDeliveryMethod: String?
        let venueMainimageBlurhash: String?
    }

    // MARK: - ItemSorting

    struct ItemSorting: Codable, Hashable {
        let sortables: [Sortable]

        enum CodingKeys: String, CodingKey {
            case sortables
        }
    }

    //
    // Hashable or Equatable:
    // The compiler will not be able to synthesize the implementation of Hashable or Equatable
    // for types that require the use of JSONAny, nor will the implementation of Hashable be
    // synthesized for types that have collections (such as arrays or dictionaries).

    // MARK: - Sortable

    struct Sortable: Codable, Hashable {
        let id: SortableID?
        let value: Int?

        enum CodingKeys: String, CodingKey {
            case id
            case value
        }
    }

    enum SortableID: String, Codable, Hashable {
        case deliveryEstimate = "delivery-estimate"
        case deliveryPrice = "delivery-price"
        case distance
        case preparationEstimate = "preparation-estimate"
        case rating
    }

    enum TelemetryVenueBadge: String, Codable, Hashable {
        case manuallyCurated = "manually_curated"
        case new
        case promotions
    }

    enum ItemTemplate: String, Codable, Hashable {
        case squareTitleBottom = "square-title-bottom"
        case venueLarge = "venue-large"
    }

    // MARK: - Venue

    struct Venue: Codable, Hashable {
        let address: String?
        let badges: [Badge]
        let city: String?
        let country: String?
        let currency: String?
        let delivers: Bool?
        let deliveryPrice: String?
        let deliveryPriceHighlight: Bool?
        let deliveryPriceInt: Int?
        let estimate: Int?
        let estimateBox: EstimateBox?
        let estimateRange: String?
        let franchise: String?
        let icon: String?
        let id: String?
        let location: [Double]?
        let name: String?
        let online: Bool?
        let priceRange: Int?
        let productLine: String?
        let rating: Rating?
        let shortDescription: String?
        let showWoltPlus: Bool?
        let slug: String?
        let tags: [String]?
    }

    // MARK: - Badge

    struct Badge: Codable, Hashable {
        let text: String?
        let variant: String?
    }

    // MARK: - EstimateBox

    struct EstimateBox: Codable, Hashable {
        let subtitle: String?
        let template: String?
        let title: String?
    }

    // MARK: - Rating

    struct Rating: Codable, Hashable {
        let rating: Int?
        let score: Double?
    }

    // MARK: - WoltResultsSorting

    struct WoltResultsSorting: Codable, Hashable {
        let sortables: [Sortable]?
    }
}
