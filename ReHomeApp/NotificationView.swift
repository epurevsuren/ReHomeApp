import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        VStack {
            messageHeader()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(dataProvider.submissions, id: \.id) { submission in
                                            if let currentListing = getListing(for: submission.listingId) {
                                                submissionRow(count: submission.listingId, listing: currentListing)
                                            }
                                        }
                }
                .padding(.bottom, 20)
            }
        }
    }

    func getListing(for listingId: Int) -> Listing? {
            return dataProvider.listings.first { $0.id == listingId }
        }
    
    func messageHeader() -> some View {
        Text("♻️ Repurpose Requests")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.19))
            .padding(.leading, 20)
            .padding(.bottom, 20)
    }
    
    func submissionRow(count: Int, listing: Listing) -> some View {
        VStack {
            HStack {
                Image(listing.imageNames.first ?? "placeholderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
                    .cornerRadius(48)
                
                VStack(alignment: .leading) {
                    Text(listing.name)
                        .font(.headline)
                        .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.19))
                    
                    Text(listing.category)
                        .font(.subheadline)
                        .foregroundColor(Color(red: 0.19, green: 0.18, blue: 0.3))
                    
                    Text("\(count) stories for you to review")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                }
                .padding(.leading, 8)
                
                Spacer()
                
                NavigationLink(destination: RepurposeItemView(itemId: listing.id)) {
                    Image(systemName: "chevron.right")
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 20)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environmentObject(DataProvider())
    }
}
