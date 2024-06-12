import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        NavigationStack {
            messageHeader()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(getUniqueSubmissions().sorted(by: { $0.key < $1.key }), id: \.key) { listingId, count in
                        if let listing = getListing(for: listingId) {
                            submissionRow(count: count, listing: listing)
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarTitle("Notifications")
    }
    
    func getUniqueSubmissions() -> [Int: Int] {
            var listingSubmissionCounts = [Int: Set<Int>]()
            
        for submission in dataProvider.submissions {
                if listingSubmissionCounts[submission.listingId] != nil {
                    listingSubmissionCounts[submission.listingId]?.insert(submission.userId)
                } else {
                    listingSubmissionCounts[submission.listingId] = [submission.userId]
                }
            }
            
            return listingSubmissionCounts.mapValues { $0.count }
        }
    
    func getListing(for listingId: Int) -> Listing? {
        return dataProvider.listings.first { $0.id == listingId }
    }
    
    func messageHeader() -> some View {
        Text("♻️ Repurpose Requests")
            .font(.title2)
            .fontWeight(.semibold)
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
                    
                    Text(listing.category)
                        .font(.subheadline)
                    
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
