import SwiftUI

struct FrontHeaderCTA: View {
    let hasLocation: Bool
    let onFindLunch: () -> Void
    let onRequestLocation: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text("Lunch Machine")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Find nearby places for lunch")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button(action: onFindLunch) {
                Label("Find a place for lunch", systemImage: "fork.knife")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            if !hasLocation {
                Button("Enable location") {
                    onRequestLocation()
                }
                .font(.footnote)
                .foregroundStyle(.tint)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding(.horizontal)
        .animation(.easeInOut, value: hasLocation)
    }
}
