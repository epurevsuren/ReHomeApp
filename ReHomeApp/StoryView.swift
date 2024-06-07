import SwiftUI

struct StoryView: View {
    let listing: Listing
    let userId: Int
    @State private var reasonText = ""
    @Environment(\.presentationMode) var presentationMode

    var onSubmit: (Submission) -> Void
    var onReject: () -> Void

    var body: some View {
        VStack {
            Text("Why do you want \(listing.name)?")
                .font(.title)
                .padding()

            TextField("Enter your reason here", text: $reasonText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    onReject()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Reject")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    let submission = Submission(
                        id: UUID().hashValue,
                        listingId: listing.id,
                        ownerId: listing.userId,
                        userId: userId,
                        story: reasonText,
                        date: Date()
                    )
                    onSubmit(submission)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Submit Story")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(false) // Prevent going back
    }
}

#Preview {
    StoryView(
        listing: Listing(
            id: 1,
            userId: 2,
            name: "Sample",
            imageNames: ["sampleImage"],
            category: "Sample",
            user: "Harry",
            userImage: "profilePicture",
            condition: "Used - like new",
            pickupLocation: "Pick-up from Uni library",
            description: "Sample description"
        ),
        userId: 3,
        onSubmit: { _ in },
        onReject: {}
    )
}
