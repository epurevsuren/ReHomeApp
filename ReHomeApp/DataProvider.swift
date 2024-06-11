import Foundation
import SwiftUI

class DataProvider: ObservableObject {
    @Published var listings: [Listing] = []
    @Published var myListings: [Listing] = []
    @Published var categories: [Category] = []
    @Published var users: [User] = []
    @Published var submissions: [Submission] = []
    @Published var currentUser: User

    init() {
        self.currentUser = User(
            id: 1,
            userName: "Shivam Arora",
            email: "shivam@example.com",
            bio: "iOS Developer and Swift Enthusiast.",
            profileImageName: "p1"
        )
        loadDummyData()
    }

    private func loadDummyData() {
        // Dummy Users
        users = [
            User(id: 1, userName: "Harry", email: "harry@example.com", bio: "Student MDSI", profileImageName: "p1"),
            User(id: 2, userName: "Shivam", email: "shivam@example.com", bio: "Student MDSI", profileImageName: "p1"),
            User(id: 3, userName: "Riyan", email: "riyan@example.com", bio: "Student MIT", profileImageName: "p1")
        ]

        // Dummy Categories
        categories = [
            Category(id: "1", name: "Sports", imageName: "sportsImage"),
            Category(id: "2", name: "Clothes", imageName: "clothesImage"),
            Category(id: "3", name: "Furniture", imageName: "furnitureImage"),
            Category(id: "4", name: "Electronics", imageName: "electronicsImage"),
            Category(id: "5", name: "Decorations", imageName: "homedecorImage"),
            Category(id: "6", name: "Books", imageName: "booksImage"),
            Category(id: "7", name: "Shoes", imageName: "shoesImage"),
            Category(id: "8", name: "Accessories", imageName: "accessoriesImage")
        ]

        // Dummy Listings
        listings = [
            Listing(id: 1, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 2, userId: 1, name: "Cricket Ball", imageNames: ["cricketballImage"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 3, userId: 1, name: "Cricket Bat", imageNames: ["cricketbatImage"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket bat during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 4, userId: 1, name: "Rugby Ball", imageNames: ["rugbyImage"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this rugby ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 5, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Harry", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did")
        ]
        
        // Dummy Submissions
        submissions = []
    }
    
    func addSubmission(_ submission: Submission) {
        submissions.append(submission)
    }
    
    func updateListing(_ updatedListing: Listing) {
        if let index = listings.firstIndex(where: { $0.id == updatedListing.id }) {
            listings[index] = updatedListing
        }
    }
    
    func addItem(_ item: Listing) {
        listings.append(item)
        myListings.append(item)
    }
}

struct Listing: Identifiable {
    var id: Int
    var userId: Int
    var name: String
    var imageNames: [String]
    var category: String
    var user: String
    var userImage: String
    var condition: String
    var pickupLocation: String
    var description: String
}

struct User: Identifiable {
    var id: Int
    var userName: String
    var email: String
    var bio: String
    var profileImageName: String
}

struct Category: Identifiable, Hashable {
    var id: String
    var name: String
    var imageName: String
}

struct Submission: Identifiable {
    var id: Int
    var listingId: Int
    var ownerId: Int
    var userId: Int
    var story: String
    var date: Date
}

