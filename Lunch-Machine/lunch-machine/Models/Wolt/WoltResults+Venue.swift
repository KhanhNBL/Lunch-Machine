import Foundation

import Foundation

extension WoltResults {
    var venues: [Venue] {
        let all = (sections ?? [])
            .flatMap { $0.items ?? [] }
            .compactMap { $0.venue }

        var seen = Set<String>()
        return all.filter { venue in
            guard let id = venue.id else { return true }
            return seen.insert(id).inserted
        }
    }
}
