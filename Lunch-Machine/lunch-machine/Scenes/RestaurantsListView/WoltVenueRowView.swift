import SwiftUI

struct WoltVenueRowView: View {
    let venue: WoltResults.Venue

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Text(venue.name ?? "Unknown venue")
                    .font(.headline)

                Spacer()

                if let score = venue.rating?.score {
                    Label(String(format: "%.1f", score), systemImage: "star.fill")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            if let desc = venue.shortDescription, !desc.isEmpty {
                Text(desc)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            HStack(spacing: 12) {
                if let price = venue.deliveryPrice, !price.isEmpty {
                    Label(price, systemImage: "shippingbox")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                if let range = venue.estimateRange, !range.isEmpty {
                    Label(range, systemImage: "clock")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}
