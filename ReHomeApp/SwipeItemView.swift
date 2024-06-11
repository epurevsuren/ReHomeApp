import SwiftUI

struct SwipeItemView: View {
    var title: String
    var category: Category
    var onSubmit: (Submission) -> Void
    
    @EnvironmentObject var dataProvider: DataProvider
    @State private var currentIndex = 0

    var body: some View {
        VStack {
            Spacer()

            if currentIndex < filteredListings.count {
                SwipeableCardView(listing: filteredListings[currentIndex], user: user(for: filteredListings[currentIndex].userId))
                    .padding()
            } else {
                Text("No more items")
                    .font(.headline)
            }

            Spacer()

            HStack {
                Button(action: {
                    withAnimation {
                        if currentIndex < filteredListings.count {
                            currentIndex += 1
                        }
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.red))
                        .shadow(radius: 5)
                }
                .padding(.horizontal)

                if currentIndex < filteredListings.count {
                    NavigationLink(destination: StoryView(listing: filteredListings[currentIndex], userId: 1, onSubmit: { submission in
                        dataProvider.addSubmission(submission)
                        onSubmit(submission)
                        currentIndex += 1
                    }, onReject: {
                        currentIndex += 1
                    })) {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.green))
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()

            Spacer()
        }
        .navigationTitle(title)
    }

    var filteredListings: [Listing] {
        dataProvider.listings.filter { $0.category == category.name }
    }

    func user(for userId: Int) -> User? {
        return dataProvider.users.first { $0.id == userId }
    }
}

struct SwipeableCardView: View {
    let listing: Listing
    let user: User?

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    NavigationLink(destination: AllListingView(listing: listing)) {
                        if let firstImageName = listing.imageNames.first {
                            loadImage(named: firstImageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)
                        } else {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 200)
                                .cornerRadius(10)
                                .overlay(Text("No Image Available").foregroundColor(.white))
                        }
                    }
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 80)
                    .cornerRadius(10)
                    
                    if let user = user {
                        HStack {
                            Image(user.profileImageName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .padding(.leading, 10)
                            Text(user.userName)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding([.top, .trailing], 10)
                    }
                }

                Text(listing.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                
                Text(listing.condition)
                    .font(.subheadline)
                    .foregroundColor(.orange)
                    .padding(.leading, 10)

                Text(listing.pickupLocation)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.leading, 10)
                
                Text("\"\(listing.description)\"")
                    .font(.body)
                    .padding(10)

                Spacer()
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
        }
    }
    
    private func loadImage(named imageName: String) -> Image {
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName).path
        if let uiImage = UIImage(contentsOfFile: imagePath) {
            return Image(uiImage: uiImage)
        } else {
            return Image(imageName) // Fallback to assets
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    NavigationStack {
        SwipeItemView(title: "Sample", category: Category(id: "1", name: "Sports", imageName: "sportsImage")) { submission in
            print(submission)
        }
        .environmentObject(DataProvider())
    }
}
