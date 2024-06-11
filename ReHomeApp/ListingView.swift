//
//  ListingView.swift
//  ReHomeApp
//
//  Created by Purevsuren Erdene on 4/6/2024.
//

import SwiftUI

struct ListingView: View {
    
    let stories = [
        UserStory(id: 1, firstName: "Helena", profilePicture: "Helena"),
        UserStory(id: 2, firstName: "Varun", profilePicture: "Varun"),
        UserStory(id: 3, firstName: "Carina", profilePicture: "Carina"),
        UserStory(id: 4, firstName: "Charles", profilePicture: "Charles"),
        UserStory(id: 5, firstName: "Wang", profilePicture: "Wang")
    ]
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("Listing", displayMode: .inline)
        }
    }
    
    @ViewBuilder
    private func portraitLayout(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            headerSection()
            
            Divider()
                .frame(height: 3)
                .background(colorScheme == .dark ? Color(red: 0.278, green: 0.278, blue: 0.290) : Color(red: 0.706, green: 0.706, blue: 0.714))
                .padding(.horizontal)
            
            storiesSection()
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
    
    @ViewBuilder
    private func headerSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Headphones")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
            Text("User 1")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.leading)
            
            Group {
                Text("Category")
                    .padding(.top)
                    .font(.title3)
            }
            .padding(.leading)
            
            GeometryReader { geometry in
                HStack(alignment: .center, spacing: 5) {
                    
                    let component1Width = geometry.size.width * 0.35
                    let component2Width = geometry.size.width * 0.65
                    
                    VStack {
                        Image("product1")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(50)
                            .frame(width: component1Width)
                            .padding([.leading, .trailing])
                        
                        HStack {
                            Button("Edit") {
                                
                            }
                            .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                            .controlSize(.regular)
                            .scaledToFit()
                            .padding(.top)
                            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 4)
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    VStack(alignment: .leading, spacing: 14) {
                        ScrollView {
                            Text("An almost new headphone. Bought it in Jan 2024. But now I am gifted a new one. So wanna give this way.")
                                .lineLimit(nil)
                                .padding([.trailing, .top])
                        }
                        .padding([.trailing, .top])
                    }
                    .padding([.trailing, .top])
                    .frame(width: component2Width)
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func storiesSection() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Stories")
                .font(.title)
                .bold()
                .padding([.top, .leading, .bottom])
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(stories) { story in
                        NavigationLink(destination: StoryCardView(id: story.id)) {
                            UserStoryView(imageName: story.profilePicture, title: story.firstName)
                        }
                    }
                }
                .padding(.leading)
            }
            .padding(.horizontal, 0)
            .padding(.bottom, 100)
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
                                NavigationLink(destination: StoryCardView(id: self.stories[storyIndex].id)) {
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
    ListingView()
}
