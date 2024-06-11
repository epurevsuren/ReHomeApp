import SwiftUI

struct SavedListingsView: View {
    @Binding var savedListings: [Listing]
    
    var body: some View {
        NavigationStack {
            List(savedListings) { listing in
                NavigationLink(destination: ListingDetailView(listing: listing)) {
                    Text(listing.name)
                }
            }
            .navigationTitle("Saved Listings")
        }
    }
}

#Preview {
    SavedListingsView(
        savedListings: Binding.constant([
            Listing(
                id: 1,
                userId: 2,
                name: "Sample Item",
                imageNames: ["sampleImage"],
                category: "Sample",
                user: "User",
                userImage: "userImage",
                condition: "New",
                pickupLocation: "Location",
                description: "Description"
            )
        ]
                                       )
    )
}
