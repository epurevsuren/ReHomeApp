//
//  ListingView.swift
//  ReHomeApp
//
//  Created by Purevsuren Erdene on 4/6/2024.
//

import SwiftUI

struct RepurposeItemView: View {
    @EnvironmentObject var dataProvider: DataProvider
    let itemId: Int
    @State private var dataFetched = false
    
    @State private var stories: [UserStory] = []
    @State private var cards: [UserData] = []
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0) {
                    if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                        // Portrait mode layout
                        portraitLayout(geometry: geometry)
                    } else {
                        // Landscape mode layout
                        landscapeLayout(geometry: geometry)
                    }
                }
            }
            .navigationBarTitle("♻️ Repurpose item", displayMode: .inline)
            .onAppear{
                if !dataFetched {
                    fetchData()
                    dataFetched = true
                }
            }
        }
    }
    
    @ViewBuilder
    private func portraitLayout(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            headerSection()
                .frame(height: geometry.size.height * 0.45)
            
            Divider()
                .frame(height: 3)
                .background(colorScheme == .dark ? Color(red: 0.278, green: 0.278, blue: 0.290) : Color(red: 0.706, green: 0.706, blue: 0.714))
                .padding(.horizontal)
            
            storiesSection()
                .frame(height: geometry.size.height * 0.55)
        }
    }
    
    @ViewBuilder
    private func landscapeLayout(geometry: GeometryProxy) -> some View {
        HStack(alignment: .top, spacing: 0) {
            headerSection()
                .frame(width: geometry.size.width * 0.5)
            
            Divider()
                .frame(width: 3)
                .background(colorScheme == .dark ? Color(red: 0.278, green: 0.278, blue: 0.290) : Color(red: 0.706, green: 0.706, blue: 0.714))
                .padding(.vertical)
            
            storiesGridSection(geometry: geometry)
                .frame(width: geometry.size.width * 0.5)
        }
    }
    
    private func fetchData() {
        for submission in dataProvider.submissions {
            if let _ = listing(for: submission.listingId) {
                if submission.listingId == itemId {
                    if let user = dataProvider.readUser(id: submission.userId) {
                        let fullNameArr = user.userName.components(separatedBy: " ")
                        let firstName = fullNameArr[0]
                        addNewStory(id: submission.id, firstName: firstName, profilePicture: user.profileImageName)
                        addUserData(submissionId: submission.id, fullName: user.userName, profilePicture: user.profileImageName, email: user.email, story: submission.story)
                    }
                }
            }
        }
    }
    
    private func addNewStory(id: Int, firstName: String, profilePicture: String) {
        let newStory = UserStory(id: id, firstName: firstName, profilePicture: profilePicture)
        stories.append(newStory)
    }
    
    private func addUserData(submissionId: Int, fullName: String, profilePicture: String, email: String, story: String) {
        let newData = UserData(id: submissionId, fullName: fullName, profilePicture: [profilePicture], email: email, stories: story)
        cards.append(newData)
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
    
    @ViewBuilder
    private func headerSection() -> some View {
        let currentListing = dataProvider.readListing(id: itemId)
        VStack(alignment: .leading, spacing: 0) {
            Text(currentListing!.name)
                .bold()
                .font(.title)
                .padding(.leading)
            Text(currentListing!.condition)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.leading)
            
            Group {
                Text(currentListing!.pickupLocation)
                    .padding(.top)
                    .font(.subheadline)
            }
            .padding(.leading)
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 5) {
                    
                    let component1Width = geometry.size.width * 0.40
                    let component2Width = geometry.size.width * 0.60
                    
                    VStack {
                        if let firstImageName = currentListing!.imageNames.first {
                            loadImage(named: firstImageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                                .frame(width: component1Width)
                                .padding([.leading])
                        } else {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                                .overlay(Text("No Image").foregroundColor(.white).font(.caption))
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 14) {
                        ScrollView {
                            Text(currentListing!.description)
                                .lineLimit(nil)
                                .padding(.top, 35)
                                .padding(.leading, 5)
                        }
                        .padding([.trailing])
                    }
                    .padding([.trailing, .top])
                    .frame(width: component2Width)
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    func listing(for listingId: Int) -> Listing? {
        return dataProvider.listings.first { $0.id == listingId }
    }
    
    @ViewBuilder
    private func storiesSection() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Stories 🌱")
                .font(.title)
                .bold()
                .padding([.top, .leading, .bottom])
                .padding(.bottom, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(stories) { story in
                        NavigationLink(destination: StoryCardView(id: story.id, cards: cards)) {
                            UserStoryView(imageName: story.profilePicture, title: story.firstName)
                        }
                    }
                }
                .padding(.leading)
            }
            .padding(.horizontal, 0)
        }
        .padding(0)
    }
    
    @ViewBuilder
    private func storiesGridSection(geometry: GeometryProxy) -> some View {
        let maxStoryCount = 3
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(0..<self.stories.count / maxStoryCount + (self.stories.count % maxStoryCount == 0 ? 0 : 1), id: \.self) { rowIndex in
                    HStack(spacing: 15) {
                        ForEach(0..<maxStoryCount) { columnIndex in
                            let storyIndex = rowIndex * maxStoryCount + columnIndex
                            if storyIndex < self.stories.count {
                                NavigationLink(destination: StoryCardView(id: self.stories[storyIndex].id, cards: cards)) {
                                    UserStoryView(imageName: self.stories[storyIndex].profilePicture, title: self.stories[storyIndex].firstName)
                                        .frame(maxWidth: .infinity)
                                }
                            } else {
                                Spacer().frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
            .padding([.horizontal, .top])
        }
    }
}
#Preview {
    RepurposeItemView(itemId: 5)
        .environmentObject(DataProvider())
}
