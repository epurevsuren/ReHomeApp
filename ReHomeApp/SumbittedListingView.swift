import SwiftUI

struct SubmittedListingsView: View {
    @EnvironmentObject var dataProvider: DataProvider
    @State var submissions: [Submission]

    var body: some View {
        NavigationStack {
            List(submissions) { submission in
                if let listing = dataProvider.listings.first(where: { $0.id == submission.listingId }) {
                    NavigationLink(destination: SubmissionDetailView(submission: submission, listing: listing)) {
                        Text("Submission for \(listing.name) by User ID: \(submission.userId)")
                    }
                } else {
                    Text("Submission for unknown listing ID: \(submission.listingId) by User ID: \(submission.userId)")
                }
            }
            .navigationTitle("Submitted Stories")
        }
    }
}

#Preview {
    SubmittedListingsView(submissions: [
        Submission(id: 1, listingId: 1, ownerId: 2, userId: 2, story: "I need this because...", date: Date())
    ])
    .environmentObject(DataProvider())
}

//struct SubmissionDetailView: View {
//    @EnvironmentObject var dataProvider: DataProvider
//    var submission: Submission
//    var listing: Listing
//
//    var body: some View {
//        VStack {
//            if let user = dataProvider.users.first(where: { $0.id == submission.userId }) {
//                Image(user.profileImageName)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                Text(user.userName)
//                    .font(.title)
//                Text(submission.story)
//                    .font(.body)
//                    .padding()
//            }
//            HStack {
//                Button(action: {
//                    acceptSubmission(submission)
//                }) {
//                    Text("Accept")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                Button(action: {
//                    rejectSubmission(submission)
//                }) {
//                    Text("Reject")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Submission Detail")
//    }
//
//    private func acceptSubmission(_ submission: Submission) {
//        // Accept the submission and delete others
//        dataProvider.acceptSubmission(submission, for: listing.id)
//    }
//
//    private func rejectSubmission(_ submission: Submission) {
//        // Reject the submission
//        dataProvider.rejectSubmission(submission.id, for: listing.id)
//    }
//}
