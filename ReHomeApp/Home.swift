//
//  Home.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 30/5/2024.
//

import SwiftUI

struct Home: View {
    // Placeholder data
    let categories = [
        Category(id: "1", name: "Sports", imageName: "sports"),
        Category(id: "2", name: "Cloths", imageName: "clothes"),
        Category(id: "3", name: "Furniture", imageName: "furniture"),
        Category(id: "4", name: "Electronics", imageName: "electronics")
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
                                }
                            )
                            .padding(.horizontal, 10)
                        
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
                    TabView {
                        Text("Home")
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }

                        Text("Add Item")
                            .tabItem {
                                Image(systemName: "plus.circle.fill")
                                Text("Add Item")
                            }

                        Text("Listing")
                            .tabItem {
                                Image(systemName: "list.bullet")
                                Text("Listing")
                            }
                    }
                    .frame(height: 70)
                }
            }
        }

        struct CategoryView: View {
            let imageName: String
            let title: String
            
            var body: some View {
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(Color.gray) // Placeholder for the image
                        .frame(height: 150)
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

        struct Category: Identifiable {
            let id: String
            let name: String
            let imageName: String
        }

#Preview {
    Home()
}
