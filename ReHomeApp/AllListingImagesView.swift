import SwiftUI

struct AllListingView: View {
    var listing: Listing

    var body: some View {
        ScrollView {
            VStack {
                ForEach(listing.imageNames, id: \.self) { imageName in
                    loadImage(named: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400 , height: 400)
                        .clipped()
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
        .navigationTitle("All Images")
    }

    private func loadImage(named imageName: String) -> Image {
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName).path
        if let uiImage = UIImage(contentsOfFile: imagePath) {
            return Image(uiImage: uiImage)
        } else {
            return Image(imageName) // Fallback to assets
        }
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    AllListingView(
        listing: Listing(
            id: 1,
            userId: 2,
            name: "Sample",
            imageNames: ["rugbyImage"],
            category: "Sample",
            user: "Harry",
            userImage: "profilePicture",
            condition: "Used - like new",
            pickupLocation: "Pick-up from Uni library",
            description: "Sample description"
        )
    )
}
