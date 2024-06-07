import SwiftUI

struct SaveView: View {
    let listing: Listing
    var onSave: () -> Void
    var onCancel: () -> Void

    var body: some View {
        VStack {
            Text("Save \(listing.name)?")
                .font(.title)
                .padding()

            HStack {
                Button(action: onCancel) {
                    Text("Cancel")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: onSave) {
                    Text("Save")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Prevent going back
    }
}

#Preview {
    SaveView(listing: Listing(id: 1, userId: 2, name: "Sample", imageNames: ["sampleImage"], category: "Sample", user: "Harry", userImage: "profilePicture", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Sample description"), onSave: {}, onCancel: {})
}
