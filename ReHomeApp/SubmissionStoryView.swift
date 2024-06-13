import SwiftUI

struct SubmissionStoryView: View {
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        NavigationStack {
            
            messageHeader()
            
            if dataProvider.userStories.isEmpty {
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
                loadImage(named: listing.imageNames.first ?? "placeholderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 83, height: 81)
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
        
        for submission in dataProvider.userStories {
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


struct SubmissionStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubmissionStoryView()
            .environmentObject(DataProvider())
    }
}
