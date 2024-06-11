import SwiftUI

struct AllListingView: View {
     var listing: Listing

    var body: some View {
        ScrollView {
            VStack {
                ForEach(listing.imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
        .navigationTitle("All Images")
        .onAppear{
            print("bagga \(listing)")
        }
    }
}

#Preview {
    AllListingView(
        listing: (Listing(
            id: 1,
            userId: 2,
            name: "Sample",
            imageNames: ["sampleImage"],
            category: "Sample",
            user: "Harry",
            userImage: "profilePicture",
            condition: "Used - like new",
            pickupLocation: "Pick-up from Uni library",
            description: "Sample description"
        )
    )
        )
}
