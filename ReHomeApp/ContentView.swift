//
//  ContentView.swift
//  ReHomeApp
//
//  Created by Shivam Arora on 4/6/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Add Item")
                .tabItem {
                    Label("Add Item", systemImage: "plus.circle.fill")
                }
            
            Text("Listing")
                .tabItem {
                    Label("Listing", systemImage: "list.bullet")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
