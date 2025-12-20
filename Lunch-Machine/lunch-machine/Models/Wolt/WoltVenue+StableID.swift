import Foundation

extension WoltResults.Venue {
    var stableID: String {
        if let id, !id.isEmpty { return id }
        if let slug, !slug.isEmpty { return slug }
        return "\(name ?? "venue")-\(address ?? "")"
    }
}
