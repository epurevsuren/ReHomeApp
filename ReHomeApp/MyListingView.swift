import SwiftUI

struct MyListingsView: View {
    @EnvironmentObject var dataProvider: DataProvider

    var body: some View {
        NavigationStack {
            List(dataProvider.myListings) { listing in
                let count = dataProvider.getUserStoryCount(id: listing.id)
                if(count>0)
                {
                    NavigationLink(destination: RepurposeItemView(itemId: listing.id)) {
                        ListingRowView(listing: listing, count: count)
                    }
                }
                else
                {
                    NavigationLink(destination:  ListingDetailView(listing: listing)) {
                        ListingRowView(listing: listing, count: count)
                    }
                }
                
            }
            .navigationTitle("My Listings")
        }
    }
}

struct ListingRowView: View {
    let listing: Listing
    let count: Int

    var body: some View {
        HStack {
            if let firstImageName = listing.imageNames.first {
                loadImage(named: firstImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(48)
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
                
                Text(listing.category)
                    .font(.subheadline)
                
                if(count>0)
                {
                    Text("\(count) stories for you to review")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                }
            }
            .padding(.leading, 8)
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
