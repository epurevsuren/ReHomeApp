import SwiftUI

struct ListingDetailView: View {
    var listing: Listing

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(listing.imageNames, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }

            Text(listing.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(listing.condition)
                .font(.headline)
                .foregroundColor(.orange)

            Text("Pickup Location: \(listing.pickupLocation)")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(listing.description)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle(listing.name)
    }
}

#Preview {
    ListingDetailView(
        listing: Listing(
            id: 1,
            userId: 1,
            name: "Sample Item",
            imageNames: ["cricketbatImage", "cricketballImage"],
            category: "Sample",
            user: "User",
            userImage: "userImage",
            condition: "New",
            pickupLocation: "Location",
            description: "Description"
        )
    )
}
