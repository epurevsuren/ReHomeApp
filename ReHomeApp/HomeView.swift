import SwiftUI

struct HomeView: View {
    // Placeholder data
    let categories = [
        Category(id: "1", name: "Sports", imageName: "sportsImage"),
        Category(id: "2", name: "Clothes", imageName: "clothesImage"),
        Category(id: "3", name: "Furniture", imageName: "furnitureImage"),
        Category(id: "4", name: "Electronics", imageName: "electronicsImage"),
        Category(id: "5", name: "Decorations", imageName: "homedecorImage"),
        Category(id: "6", name: "Books", imageName: "booksImage"),
        Category(id: "7", name: "Shoes", imageName: "shoesImage"),
        Category(id: "8", name: "Accesories", imageName: "accesoriesImage")
    ]
    
    @State private var searchText = ""
    
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
                    
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
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
                                SwipeItemView(title: category.name)
                                    .navigationTitle(category.name)
                            } label: {
                                CategoryView(imageName: category.imageName, title: category.name)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Tab Bar
                Spacer()
            }
        }
    }
    
    var filteredCategories: [Category] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

#Preview {
    HomeView()
}
