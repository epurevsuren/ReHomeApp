import SwiftUI

struct ProfileView: View {
    @State private var user: User = User(
        id: 1,
        userName: "Shivam Arora",
        email: "shivam@example.com",
        bio: "iOS Developer and Swift Enthusiast.",
        profileImageName: "p1"
    )
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("Back")
                            .foregroundColor(.blue)
                    }
                }
                Spacer()
            }
            .padding(.leading)

            Image(user.profileImageName) // Profile image
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.top, 20)

            Text(user.userName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(user.bio)
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
