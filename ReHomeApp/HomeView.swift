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
            
        }
    }
}


#Preview {
    HomeView()
}
