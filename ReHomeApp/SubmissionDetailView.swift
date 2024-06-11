import SwiftUI

struct SubmissionDetailView: View {
    var submission: Submission

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Listing ID: \(submission.listingId)")
                .font(.headline)

            Text("Submitted by User ID: \(submission.userId)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(submission.story)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Submission Details")
    }
}

#Preview {
    SubmissionDetailView(submission: Submission(id: 1, listingId: 1, ownerId: 4, userId: 2, story: "I need this because...", date: Date()))
}

