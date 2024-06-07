//
//  ReHomeAppApp.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 30/5/2024.
//

import SwiftUI

@main
struct ReHomeAppApp: App {
    var body: some Scene {
        WindowGroup {
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

                Text("Listing")
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Listing")
                    }
            }
        }
    }
}
