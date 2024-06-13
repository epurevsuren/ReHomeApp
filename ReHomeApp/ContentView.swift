import SwiftUI

struct ContentView: View {
    init() {
        // Set the tab bar background color to a darker teal
        UITabBar.appearance().backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0) // Darker teal color
        
        // Set the unselected item tint color to a lighter color
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightText
        
        // Set the selected item tint color to white
        UITabBar.appearance().tintColor = UIColor.white
    }

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
