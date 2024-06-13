import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var dataProvider: DataProvider
    @Environment(\.presentationMode) var presentationMode

    var user: User {
        dataProvider.currentUser
    }

    var body: some View {
        VStack(spacing: 20) {
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
        .toolbar 
        {

        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
            .environmentObject(DataProvider())
    }
}

