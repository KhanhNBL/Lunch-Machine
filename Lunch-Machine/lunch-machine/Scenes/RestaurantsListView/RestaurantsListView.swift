import SwiftUI

struct RestaurantsListView: View {
    @StateObject private var repository = RestaurantsRepository()
    @StateObject private var geocodeManager = GeocodeManager()

    @State private var landmarks: [Landmark] = []
    @State private var woltResults: WoltResults?
    @State private var apiErrorMessage: String?

    @State private var isLoading = false

    @State private var visibleVenueCount = 20
    private let pageSize = 20

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    FrontHeaderCTA(
                        hasLocation: repository.locationManager.location != nil,
                        onFindLunch: {
                            Task { await refreshFromRepository() }
                        },
                        onRequestLocation: repository.locationManager.requestAndStartUpdatingLocation
                    )

                    content
                }
                .padding(.top, 12)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { toolbarContent }
        }
    }
}

// MARK: - Subviews
extension RestaurantsListView {
    @ViewBuilder
    private var content: some View {
        if isLoading {
            ProgressView()
                .padding(.top, 8)
        }

        if let error = apiErrorMessage {
            Text(error)
                .foregroundStyle(.red)
                .padding(.horizontal)
        }

        if let results = woltResults {
            let venues = results.venues

            if venues.isEmpty {
                EmptyStateView()
                    .padding(.top, 24)
            } else {
                let limitedVenues = Array(venues.prefix(visibleVenueCount))

                LazyVStack(spacing: 16) {
                    ForEach(limitedVenues, id: \.stableID) { venue in
                        WoltVenueRowView(venue: venue)
                    }

                    if venues.count > visibleVenueCount {
                        Button {
                            visibleVenueCount += pageSize
                        } label: {
                            Text("Show more")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .padding(.top, 8)
                    }
                }
                .padding(.horizontal)
            }

        } else if landmarks.isEmpty {
            EmptyStateView()
                .padding(.top, 24)

        } else {
            LazyVStack(spacing: 16) {
                ForEach(landmarks) { landmark in
                    RestaurantRowView(placemark: landmark)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
    }

    private var toolbarContent: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
                Task { await refreshFromRepository() }
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            .disabled(isLoading)
        }
    }
}

// MARK: - Actions
extension RestaurantsListView {
    private func findLunchNearMe() {
        woltResults = nil
        apiErrorMessage = nil
        Task { await loadNearbyLandmarks() }
    }

    private func loadNearbyLandmarks() async {
        guard let location = repository.locationManager.location else {
            repository.locationManager.requestAndStartUpdatingLocation()
            return
        }
        let results = await geocodeManager.reverseGeocoding(location: location)
        landmarks = results.convert()
    }

    @MainActor
    private func refreshFromRepository() async {
        landmarks = []
        apiErrorMessage = nil

        isLoading = true
        defer { isLoading = false }

        do {
            woltResults = try await repository.fetchRestaurants()
            visibleVenueCount = pageSize
        } catch {
            apiErrorMessage = error.localizedDescription
            woltResults = nil
        }
    }
}

#Preview {
    RestaurantsListView()
}
