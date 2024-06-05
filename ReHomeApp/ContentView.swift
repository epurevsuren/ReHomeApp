//
//  ContentView.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 30/5/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            Text("Add Item")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Item")
                }

            ListingView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Listing")
                }
        }
    }
}

#Preview {
    ContentView()
}
