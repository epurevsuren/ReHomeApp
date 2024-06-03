//
//  Home.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 30/5/2024.
//

import SwiftUI
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
    CategoryView(imageName: "p1", title: "hello")
}
