import SwiftUI

struct NotificationView: View {
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        VStack(spacing: 0) {
            statusHeader()
            
            messageHeader()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(dataProvider.submissions, id: \.id) { submission in
                        if let listing = listing(for: submission.listingId) {
                            submissionRow(submission: submission, listing: listing)
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
    }

    func statusHeader() -> some View {
        HStack {
            Text("9:41")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 20)
            
            Spacer()
            
            Image("Levels")
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 20)
                .padding(.trailing, 20)
        }
        .frame(height: 80)
    }
    
    func messageHeader() -> some View {
        Text("Your Submissions")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.19))
            .padding(.leading, 20)
            .padding(.top, 20)
    }
    
    func submissionRow(submission: Submission, listing: Listing) -> some View {
        VStack {
            HStack {
                Image(listing.imageNames.first ?? "placeholderImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 83, height: 81)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text(listing.name)
                        .font(.headline)
                        .foregroundColor(Color(red: 0.07, green: 0.05, blue: 0.19))
                    
                    Text(listing.category)
                        .font(.subheadline)
                        .foregroundColor(Color(red: 0.19, green: 0.18, blue: 0.3))
                    
                    Text("New submission: \(submission.story)")
                        .font(.caption)
                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                }
                .padding(.leading, 8)
                
                Spacer()
                
                NavigationLink(destination: SubmissionView(submission: submission, listing: listing)) {
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
    
    func listing(for listingId: Int) -> Listing? {
        return dataProvider.listings.first { $0.id == listingId }
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
                        Image(imageName)
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
                .foregroundColor(.orange)
            
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
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .environmentObject(DataProvider())
    }
}
