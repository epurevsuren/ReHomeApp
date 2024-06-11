import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            AddItemView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Item")
                }
            
            MyListingsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("My Listings")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataProvider())
}
