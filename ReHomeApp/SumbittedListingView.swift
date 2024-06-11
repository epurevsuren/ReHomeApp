import SwiftUI

struct SubmittedListingsView: View {
    @State  var submissions: [Submission]

    var body: some View {
        NavigationStack {
            List(submissions) { submission in
                NavigationLink(destination: SubmissionDetailView(submission: submission)) {
                    Text("Submission for Listing ID: \(submission.listingId) by User ID: \(submission.userId)")
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
}

