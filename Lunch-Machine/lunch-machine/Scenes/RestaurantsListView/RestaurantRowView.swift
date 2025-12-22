import CoreLocation
import OSLog
import SwiftUI

struct RestaurantRowView: View {
    var placemark: Landmark

    var body: some View {
        HStack {
            Text(placemark.name ?? "")
            Divider()
            Text(placemark.thoroughfare ?? "")
        }.padding()
    }
}

#Preview {
    RestaurantRowView(
        placemark: Landmark(
            id: UUID(),
            name: "Address name",
            thoroughfare: "Address throughfare"
        )
    )
}
