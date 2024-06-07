import SwiftUI

struct SwipeItemView: View {
    var title: String
    var category: Category
    var onSubmit: (Submission) -> Void

    @State private var listings: [Listing] = [
        Listing(id: 1, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
        Listing(id: 2, userId: 4, name: "Cricket Ball", imageNames: ["cricketballImage","cricketballImage"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
        Listing(id: 3, userId: 7, name: "Cricket Bat", imageNames: ["cricketbatImage"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket bat during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
        Listing(id: 4, userId: 9, name: "Rugby Ball", imageNames: ["rugbyImage"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this rugby ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
        Listing(id: 5, userId: 5, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did")
    ]
    @State private var currentIndex: Int = 0
    @State var selectedListing: Listing
    @State private var showStoryView = false
    @State private var savedListings: [Listing] = []
    @State private var showSaveView = false
    @State private var showAllImagesView = false

    var body: some View {
        VStack {
            Spacer()

            if currentIndex < filteredListings.count {
                SwipeableCardView(listing: filteredListings[currentIndex], onSave: {
                    selectedListing = filteredListings[currentIndex]
                    showSaveView = true
                }, onShowAllImages: {
                    selectedListing = filteredListings[currentIndex]
                    print("### \(selectedListing)")
                    showAllImagesView = true
                })
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

                Button(action: {
                    if currentIndex < filteredListings.count {
                        selectedListing = filteredListings[currentIndex]
                        showStoryView = true
                    }
                }) {
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.green))
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(title)
        .sheet(isPresented: $showStoryView, content: {
                StoryView(listing: selectedListing, userId: 1, onSubmit: { submission in
                    onSubmit(submission)
                    showStoryView = false
                    currentIndex += 1
                }, onReject: {
                    currentIndex += 1
                    selectedListing = filteredListings[currentIndex]
                    showStoryView = false
                })
        })
        .sheet(isPresented: $showSaveView, content: {
                SaveView(listing: selectedListing, onSave: {
                    savedListings.append(selectedListing)
//                    selectedListing = nil
                    showSaveView = false
                }, onCancel: {
//                    selectedListing = nil
                    showSaveView = false
                })
        })
        .sheet(isPresented: $showAllImagesView, content: {
//            if let listing = selectedListing {
//                AllListingView(listing: listing)
//            }
            AllListingView(listing: $selectedListing)
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SavedListingsView(savedListings: $savedListings)) {
                    Text("Saved Listings")
                }
            }
        }
    }

    var filteredListings: [Listing] {
        listings.filter { $0.category == category.name }
    }
}

//struct SwipeableCardView: View {
//    let listing: Listing
//    var onSave: () -> Void
//    var onShowAllImages: () -> Void
//
//    var body: some View {
//        ZStack {
//            VStack(alignment: .leading) {
//                ZStack(alignment: .topLeading) {
//                    Button {
//                        onShowAllImages()
//                    } label: {
//                        Image(listing.imageNames.first!)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 200)
//                            .clipped()
//                            .cornerRadius(10)
//                    }
//                    
//                    LinearGradient(
//                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                    .frame(height: 80)
//                    .cornerRadius(10)
//                    
//                    HStack {
//                        Image(listing.userImage)
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .clipShape(Circle())
//                            .padding(.leading, 10)
//                        Text(listing.user)
//                            .font(.headline)
//                            .foregroundColor(.white)
//                    }
//                    .padding([.top, .trailing], 10)
//                }
//
//                Text(listing.name)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, 10)
//                    .padding(.leading, 10)
//                
//                Text(listing.condition)
//                    .font(.subheadline)
//                    .foregroundColor(.orange)
//                    .padding(.leading, 10)
//
//                Text(listing.pickupLocation)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                    .padding(.leading, 10)
//                
//                Text("\"\(listing.description)\"")
//                    .font(.body)
//                    .padding(10)
//
//                Spacer()
//
//                HStack {
//                    Spacer()
//                    Button(action: onSave) {
//                        Image(systemName: "bookmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .foregroundColor(.blue)
//                            .padding()
//                    }
//                }
//                .padding(.trailing, 10)
//            }
//            .background(Color.white)
//            .cornerRadius(20)
//            .shadow(radius: 5)
//            .padding()
//        }
//    }
//}

//#Preview {
//    NavigationStack {
//        SwipeItemView(title: "Sample", category: Category(id: "1", name: "Sports", imageName: "sportsImage"), ) { submission in
//            print(submission)
//        }
//    }
//}

#Preview {
    SwipeItemView(title: "Sample", category: Category(id: "1", name: "Sports", imageName: "sportsImage"), onSubmit: { submission in
        print(submission)
    }, selectedListing: Listing(id: 1, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"))
}
