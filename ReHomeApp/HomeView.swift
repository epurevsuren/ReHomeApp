//
//  HomeView.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 3/6/2024.
//

import SwiftUI

struct HomeView: View {
    // Placeholder data
    let categories = [
<<<<<<< HEAD
        Category(id: "1", name: "Sports", imageName: "sportsImage"),
        Category(id: "2", name: "Clothes", imageName: "clothesImage"),
        Category(id: "3", name: "Furniture", imageName: "furnitureImage"),
        Category(id: "4", name: "Electronics", imageName: "electronicsImage"),
        Category(id: "5", name: "Decorations", imageName: "homedecorImage"),
        Category(id: "6", name: "Books", imageName: "booksImage"),
        Category(id: "7", name: "Shoes", imageName: "shoesImage"),
        Category(id: "8", name: "Accessories", imageName: "accessoriesImage")
    ]
    
    @State private var searchText = ""
    @State private var savedListings: [Listing] = []
    @State private var submissions: [Submission] = []

    var body: some View {
        NavigationStack {
            VStack {
                // Profile and Notification
                HStack {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image("p1")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.leading)
                    }
                    
                    Spacer()
                    
                    Text("Rehome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: SubmittedListingsView(submissions: submissions)) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                        Image(systemName: "bell.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .padding(.trailing)
                }
                .padding()
                
                // Search Bar
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if !searchText.isEmpty {
                                    Button(action: {
                                        searchText = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        )
                        .padding(.horizontal, 10)
                }
                .padding()
                
                // Category Sections
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredCategories) { category in
                            NavigationLink {
                                SwipeItemView(title: category.name, category: category, onSubmit: { submission in
                                    submissions.append(submission)
                                }, selectedListing: Listing(id: 1, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"))
                                .navigationTitle(category.name)
                            } label: {
                                CategoryView(imageName: category.imageName, title: category.name)
                            }
=======
        Category(id: "1", name: "Sports", imageName: "sports"),
        Category(id: "2", name: "Cloths", imageName: "clothes"),
        Category(id: "3", name: "Furniture", imageName: "furniture"),
        Category(id: "4", name: "Electronics", imageName: "electronics"),
        Category(id: "5", name: "Decorations", imageName: "decrations")
    ]
    var body: some View {
        VStack {
            // Profile and Notification
            HStack {
                Image("profile_picture")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                Text("Rehome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.trailing)
            }
            .padding()
            
            // Search Bar
            HStack {
                TextField("Search", text: .constant(""))
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if !("").isEmpty {
                                Button(action: {
                                    // Clear the search text
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
>>>>>>> parent of 38a92b4 (Merge pull request #5 from ShivamArora99/Shivam_ReHome)
                        }
                    )
                    .padding(.horizontal, 10)
                
<<<<<<< HEAD
                Spacer() // Tab Bar Placeholder
            }
        }
    }

    var filteredCategories: [Category] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
=======
                Image(systemName: "mic.fill")
                    .padding(.horizontal)
            }
            .padding()
            
            // Category Sections
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(categories) { category in
                        CategoryView(imageName: category.imageName, title: category.name)
                    }
                }
                .padding(.horizontal)
            }
            
            // Tab Bar
            Spacer()
            
>>>>>>> parent of 38a92b4 (Merge pull request #5 from ShivamArora99/Shivam_ReHome)
        }
    }
}

<<<<<<< HEAD
struct Category: Identifiable {
    let id: String
    let name: String
    let imageName: String
}

struct CategoryView: View {
    let imageName: String
    let title: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(height: 150)
            .cornerRadius(10)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
        }
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
=======
>>>>>>> parent of 38a92b4 (Merge pull request #5 from ShivamArora99/Shivam_ReHome)

#Preview {
    HomeView()
}

