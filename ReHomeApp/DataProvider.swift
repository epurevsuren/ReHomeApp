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
            email: "sarora.off@gmail.com",
            bio: "iOS Developer and Swift Enthusiast.",
            profileImageName: "p1"
        )
        loadDummyData()
    }

    private func loadDummyData() {
        // Dummy Users
        users = [
            User(id: 1, userName: "Shivam Arora", email: "sarora.off@gmail.com", bio: "iOS Developer and Swift Enthusiast.", profileImageName: "p1"),
            User(id: 2, userName: "Archie Osborne", email: "archieosborne1234@gmail.com", bio: "iOS Developer and Swift Enthusiast.", profileImageName: "p1"),
            User(id: 3, userName: "Monica Bharadhidasan", email: "josephmonica25@gmail.com", bio: "iOS Developer and Swift Enthusiast.", profileImageName: "p1"),
            User(id: 4, userName: "Purevsuren Erdene", email: "purevsuren.er@gmail.com", bio: "iOS Developer and Swift Enthusiast.", profileImageName: "p1"),
            User(id: 5, userName: "Lindsey Nguyen", email: "cchii0712@gmail.com", bio: "iOS Developer and Swift Enthusiast.", profileImageName: "p1"),
            User(id: 6, userName: "Helena Hills", email: "helena.hills@student.uts.edu.au", bio: "I'm a new Marketing student at UTS.", profileImageName: "Helena"),
            User(id: 7, userName: "Varun Bhatia", email: "varun.bhatia@student.uts.edu.au", bio: "I just commenced my first semester at UTS for my Marketing degree.", profileImageName: "Varun"),
            User(id: 8, userName: "Carina Morente", email: "carina.morente@student.uts.edu.au", bio: "I just commenced my first semester at UTS for my Marketing degree.", profileImageName: "Carina"),
            User(id: 9, userName: "Charles Brown", email: "charles.brown@student.uts.edu.au", bio: "I'm studying for a Master of IT at UTS", profileImageName: "Charles"),
            User(id: 10, userName: "Wang Lee", email: "wang.lee@student.uts.edu.au", bio: "I'm a new college student at UTS.", profileImageName: "Wang"),
            User(id: 11, userName: "Harry", email: "harry@.mdsi.edu", bio: "Student MDSI", profileImageName: "p1"),
            User(id: 12, userName: "Riyan", email: "riyan@mit.edu", bio: "Student MIT", profileImageName: "p1")
        ]

        // Dummy Categories
        categories = [
            Category(id: "1", name: "Sports", imageName: "sportsImage"),
            Category(id: "2", name: "Electronics", imageName: "electronicsImage"),
            Category(id: "3", name: "Clothes", imageName: "clothesImage"),
            Category(id: "4", name: "Books", imageName: "booksImage"),
            Category(id: "5", name: "Shoes", imageName: "shoesImage"),
            Category(id: "6", name: "Furniture", imageName: "furnitureImage"),
            Category(id: "7", name: "Decorations", imageName: "homedecorImage"),
            Category(id: "8", name: "Accessories", imageName: "accesoriesImage")
        ]

        // Dummy Listings
        listings = [
            Listing(id: 1, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: "Shivam", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 2, userId: 4, name: "Cricket Ball", imageNames: ["cricketballImage","cricketballImage"], category: "Sports", user: "Purevsuren", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 3, userId: 7, name: "Cricket Bat", imageNames: ["cricketbatImage"], category: "Sports", user: "Varun", userImage: "Varun", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket bat during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 4, userId: 9, name: "Rugby Ball", imageNames: ["rugbyImage"], category: "Sports", user: "Charles", userImage: "Charles", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this rugby ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 5, userId: 5, name: "Headphones", imageNames: ["product1"], category: "Electronics", user: "Lindsey", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "An almost new headphone. Bought it in Jan 2024. But now I am gifted a new one. So wanna give this way."),
            Listing(id: 6, userId: 3, name: "Smart Watch", imageNames: ["smartWatch"], category: "Electronics", user: "Monica", userImage: "p1", condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "An almost new smart watch. Bought it in May 2023. But now I am gifted a new one. So wanna give this way.")
        ]
        
        // Dummy Submissions
        submissions = [
            Submission(id: 1, listingId: 5, ownerId: 4, userId: 6, story: "I'm a new Marketing student at UTS and came across your headphone listing. The color and features are exactly what I'm looking for! As I embark on my academic journey, having a reliable pair of headphones is essential for my coursework and study sessions. Could we discuss the possibility of me acquiring them from you?", date: Date()),
            Submission(id: 2, listingId: 5, ownerId: 4, userId: 7, story: "I just commenced my first semester at UTS and need a headphone for my Marketing degree. Will be appreciate if I can receive it from someone. Really like the color and function of your headphone.", date: Date()),
            Submission(id: 3, listingId: 5, ownerId: 4, userId: 8, story: "I just commenced my first semester at UTS and need a headphone for my Marketing degree. Will be appreciate if I can receive it from someone. Really like the color and function of your headphone.", date: Date()),
            Submission(id: 4, listingId: 1, ownerId: 4, userId: 2, story: "I need this because...", date: Date()),
            Submission(id: 5, listingId: 5, ownerId: 4, userId: 9, story: "I need this because...", date: Date()),
            Submission(id: 6, listingId: 5, ownerId: 4, userId: 10, story: "I need this because...", date: Date())
        ]
    }
    
    // MARK: - Submission (UserStory) CRUD Operations
    
    func addSubmission(_ submission: Submission) {
        submissions.append(submission)
    }
    
    func readSubmission(id: Int) -> Submission? {
        return submissions.first { $0.id == id }
    }
    
    func updateSubmission(updatedSubmission: Submission) {
        if let index = submissions.firstIndex(where: { $0.id == updatedSubmission.id }) {
            submissions[index] = updatedSubmission
        }
    }
    
    func deleteSubmission(id: Int) {
        submissions.removeAll { $0.id == id }
    }
    
    // MARK: - Listing CRUD Operations
    
    func updateListing(_ updatedListing: Listing) {
        if let index = listings.firstIndex(where: { $0.id == updatedListing.id }) {
            listings[index] = updatedListing
        }
    }
    
    func addItem(_ item: Listing) {
        listings.append(item)
        myListings.append(item)
    }
    
    func readListing(id: Int) -> Listing? {
        return listings.first { $0.id == id }
    }
    
    func deleteListing(id: Int) {
        listings.removeAll { $0.id == id }
    }
    
    // MARK: - User CRUD Operations
        
        func createUser(user: User) {
            users.append(user)
        }
        
        func readUser(id: Int) -> User? {
            return users.first { $0.id == id }
        }
        
        func updateUser(updatedUser: User) {
            if let index = users.firstIndex(where: { $0.id == updatedUser.id }) {
                users[index] = updatedUser
            }
        }
        
        func deleteUser(id: Int) {
            users.removeAll { $0.id == id }
        }
    
    // MARK: - Saved Listings Operations
    
    func saveListing(listing: Listing) {
        if !myListings.contains(where: { $0.id == listing.id }) {
            myListings.append(listing)
        }
    }
    
    func removeSavedListing(id: Int) {
        myListings.removeAll { $0.id == id }
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

