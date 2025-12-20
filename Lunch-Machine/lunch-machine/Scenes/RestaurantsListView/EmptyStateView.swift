import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "fork.knife.circle")
                .font(.largeTitle)
                .foregroundColor(.secondary)

            Text("No restaurants yet")
                .font(.headline)

            Text("Tap the button above to find lunch nearby")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 60)
        .padding(.horizontal)
    }
}
