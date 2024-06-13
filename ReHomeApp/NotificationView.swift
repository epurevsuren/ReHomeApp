import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        NavigationStack {
            
            messageHeader()
            
            if dataProvider.submissions.isEmpty {
                noSubmissionsView()
            } else {
                submissionsListView()
            }
        }
        .navigationBarTitle("Notifications")
    }
    
    func messageHeader() -> some View {
        Text("♻️ Repurpose Requests")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
    }
    
    func noSubmissionsView() -> some View {
        VStack {
            Spacer()
            Image("empty")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 250, maxHeight: 250)
                .padding()
            Spacer()
            Text("No submissions right now")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
            Spacer()
        }
    }

    func submissionsListView() -> some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(getUniqueSubmissions().sorted(by: { $0.key < $1.key }), id: \.key) { listingId, count in
                    if let listing = listing(for: listingId) {
                        submissionRow(count: count, listing: listing)
                    }
                }
            }
            .padding(.bottom, 20)
        }
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
    
    func listing(for listingId: Int) -> Listing? {
        return dataProvider.listings.first { $0.id == listingId }
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

struct SubmissionView: View {
    let submission: Submission
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(listing.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(listing.imageNames, id: \.self) { imageName in
                        loadImage(named: imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding(.trailing, 10)
                    }
                }
            }
            
            Text("Category: \(listing.category)")
                .font(.headline)
            
            Text("Condition: \(listing.condition)")
                .font(.headline)
                .foregroundColor(Color(red: 0.89, green: 0.59, blue: 0.48))
            
            Text("Pickup Location: \(listing.pickupLocation)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(listing.description)
                .font(.body)
            
            Divider()
            
            Text("Submission Story")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(submission.story)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Submission Details")
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

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environmentObject(DataProvider())
    }
}
