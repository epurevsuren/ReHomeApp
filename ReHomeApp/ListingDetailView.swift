import SwiftUI

struct ListingDetailView: View {
    let listing: Listing

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(listing.imageNames, id: \.self) { imageName in
                        if let uiImage = loadImage(named: imageName) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)
                        } else {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .overlay(Text("No Image").foregroundColor(.white).font(.caption))
                        }
                    }
                }
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

    private func loadImage(named imageName: String) -> UIImage? {
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName).path
        return UIImage(contentsOfFile: imagePath)
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    ListingDetailView(
        listing: Listing(
            id: 1,
            userId: 2,
            name: "Sample Item",
            imageNames: ["soccerBall", "cricketballImage"],
            category: "Sports",
            user: "Harry",
            userImage: "p1",
            condition: "Used - like new",
            pickupLocation: "Pick-up from Uni library",
            description: "Sample description"
        )
    )
}
