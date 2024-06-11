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
            if let firstImageName = listing.imageNames.first, let uiImage = loadImage(named: firstImageName) {
                Image(uiImage: uiImage)
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
    MyListingsView()
        .environmentObject(DataProvider())
}
