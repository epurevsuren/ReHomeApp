import SwiftUI

struct StoryView: View {
    let listing: Listing
    let userId: Int
    @State private var reasonText = ""
    @Environment(\.presentationMode) var presentationMode

    var onSubmit: (Submission) -> Void
    var onReject: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Write your story here for \(listing.name)?")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                .padding()

            TextEditor(text: $reasonText)
                .padding()
                .frame(width: 360, height: 250)
                .background()
                .cornerRadius(20)
                .shadow(color: .gray.opacity(0.8), radius: 5, x: 0, y: 2)
                .padding()

            HStack(spacing: 20) {
                Button(action: {
                    onReject()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Reject")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                        .overlay(
                          RoundedRectangle(cornerRadius: 8)
                            .inset(by: 1)
                            .stroke(Color(red: 0.03, green: 0.49, blue: 0.55), lineWidth: 2)
                        )
                }

                Button(action: {
                    let submission = Submission(
                        id: UUID().hashValue,
                        listingId: listing.id,
                        ownerId: listing.userId,
                        userId: userId,
                        story: reasonText,
                        date: Date()
                    )
                    print("Submission Details ", submission)
                    onSubmit(submission)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Rehome")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .navigationBarBackButtonHidden(true)
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
    .environmentObject(DataProvider())
}
