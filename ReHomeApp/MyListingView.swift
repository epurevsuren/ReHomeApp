import SwiftUI

struct MyListingsView: View {
    @EnvironmentObject var dataProvider: DataProvider

    var body: some View {
        NavigationStack {
            List(dataProvider.myListings) { listing in
                NavigationLink(destination: ListingDetailView(listing: listing)) {
                    ListingRowView(listing: listing)
                }
            }
            .navigationTitle("My Listings")
        }
    }
}

struct ListingRowView: View {
    let listing: Listing

    var body: some View {
        HStack {
            if let firstImageName = listing.imageNames.first {
                loadImage(named: firstImageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
                    .overlay(Text("No Image").foregroundColor(.white).font(.caption))
            }
            VStack(alignment: .leading) {
                Text(listing.name)
                    .font(.headline)
                Text(listing.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 5)
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
