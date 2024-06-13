import SwiftUI

struct MyListingDetailView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var listing: Listing

    var body: some View {
        VStack {
            List(submissions(for: listing.id)) { submission in
                NavigationLink(destination: SubmissionDetailView(submission: submission, listing: listing)) {
                    SubmissionRowView(submission: submission)
                }
            }
            .navigationTitle(listing.name)
        }
    }

    private func submissions(for listingId: Int) -> [Submission] {
        dataProvider.submissions.filter { $0.listingId == listingId }
    }
}

struct SubmissionRowView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var submission: Submission

    var body: some View {
        VStack {
            HStack {
                if let user = dataProvider.users.first(where: { $0.id == submission.userId }) {
                    Image(user.profileImageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(user.userName)
                            .font(.headline)
                        Text(submission.story)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct SubmissionDetailView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var submission: Submission
    var listing: Listing

    var body: some View {
        VStack {
            if let user = dataProvider.users.first(where: { $0.id == submission.userId }) {
                Image(user.profileImageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text(user.userName)
                    .font(.title)
                Text(submission.story)
                    .font(.body)
                    .padding()
            }
            HStack {
                Button(action: {
                    acceptSubmission(submission)
                }) {
                    Text("Accept")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    rejectSubmission(submission)
                }) {
                    Text("Reject")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Submission Detail")
    }

    private func acceptSubmission(_ submission: Submission) {
        // Accept the submission and delete others
        dataProvider.acceptSubmission(submission, for: listing.id)
    }

    private func rejectSubmission(_ submission: Submission) {
        // Reject the submission
        dataProvider.rejectSubmission(submission.id, for: listing.id)
    }
}
