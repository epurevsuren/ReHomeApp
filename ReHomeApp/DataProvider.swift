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
            id: 5,
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
<<<<<<< HEAD
            User(id: 1, userName: "Harry", email: "harry@example.com", bio: "Student MDSI", profileImageName: "p1"),
            User(id: 2, userName: "Shivam", email: "shivam@example.com", bio: "Student MDSI", profileImageName: "p1"),
            User(id: 3, userName: "Riyan", email: "riyan@example.com", bio: "Student MIT", profileImageName: "p1"),
            User(id: 5, userName: "Riyan", email: "riyan@example.com", bio: "Student MIT", profileImageName: "p1")
            // Add more dummy users here
=======
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
>>>>>>> ShivamNew
        ]
        
        // Dummy Categories
        categories = [
            Category(id: "1", name: "Sports", imageName: "sportsImage"),
<<<<<<< HEAD
            Category(id: "2", name: "Clothes", imageName: "clothesImage"),
            Category(id: "3", name: "Furniture", imageName: "furnitureImage"),
            Category(id: "4", name: "Electronics", imageName: "electronicsImage"),
            Category(id: "5", name: "Decorations", imageName: "homedecorImage"),
            Category(id: "6", name: "Books", imageName: "booksImage"),
            Category(id: "7", name: "Shoes", imageName: "shoesImage"),
=======
            Category(id: "2", name: "Electronics", imageName: "electronicsImage"),
            Category(id: "3", name: "Clothes", imageName: "clothesImage"),
            Category(id: "4", name: "Books", imageName: "booksImage"),
            Category(id: "5", name: "Shoes", imageName: "shoesImage"),
            Category(id: "6", name: "Furniture", imageName: "furnitureImage"),
            Category(id: "7", name: "Decorations", imageName: "homedecorImage"),
>>>>>>> ShivamNew
            Category(id: "8", name: "Accessories", imageName: "accesoriesImage")
        ]
        
        // Dummy Listings
        let userNames = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hank", "Ivy", "Jack"]
        let userImages = ["p1", "p2", "p3", "p4", "p5"]
        
        listings = [
<<<<<<< HEAD
            Listing(id: 1, userId: 1, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: userNames[0], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 2, userId: 2, name: "Cricket Ball", imageNames: ["cricketballImage"], category: "Sports", user: userNames[1], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 3, userId: 3, name: "Cricket Bat", imageNames: ["cricketbatImage"], category: "Sports", user: userNames[2], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this cricket bat during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 4, userId: 4, name: "Rugby Ball", imageNames: ["rugbyImage"], category: "Sports", user: userNames[3], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this rugby ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 5, userId: 5, name: "Soccer Ball", imageNames: ["soccerBall"], category: "Sports", user: userNames[4], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used this soccer ball during my high school games, and it holds many cherished memories. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            
            Listing(id: 6, userId: 6, name: "T-Shirt", imageNames: ["T-ShirtImage"], category: "Clothes", user: userNames[5], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I Bought this T-shirt but it doesn't fit me well anymore. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 7, userId: 7, name: "Black hoodie", imageNames: ["blackHoodieImage"], category: "Clothes", user: userNames[6], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Good warm hoodie that I wore lots last winter. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 8, userId: 8, name: "Leather Jacket", imageNames: ["leatherJacketImage"], category: "Clothes", user: userNames[7], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Old leather jacket that I don't wear anymore. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 9, userId: 9, name: "Winter scarf", imageNames: ["winterScarfImage"], category: "Clothes", user: userNames[8], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Scarf that I wore lots in Europe in winter. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            Listing(id: 10, userId: 10, name: "Jeans", imageNames: ["jeansImage"], category: "Clothes", user: userNames[9], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I no longer wear these jeans very often. Now, I'm selling it to pass it on to someone who will appreciate it as much as I did"),
            
            Listing(id: 11, userId: 1, name: "Desk", imageNames: ["deskImage"], category: "Furniture", user: userNames[0], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Recently upgraded to a larger desk for more workspace. This one is still sturdy and in good condition."),
            Listing(id: 12, userId: 2, name: "Bookshelf", imageNames: ["bookshelfImage"], category: "Furniture", user: userNames[1], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Moving out and can't take the bookshelf with me. It's been a reliable organizer for my books and knick-knacks."),
            Listing(id: 13, userId: 3, name: "Futon couch", imageNames: ["futonImage"], category: "Furniture", user: userNames[2], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Originally used for guests, but I'm downsizing and won't have the space for it anymore. Comfortable for sitting or sleeping."),
            Listing(id: 14, userId: 4, name: "Coffee table", imageNames: ["coffeeTableImage"], category: "Furniture", user: userNames[3], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Found a new coffee table that better fits my living room decor. This one is still in great shape and looking for a new home."),
            Listing(id: 15, userId: 5, name: "Dining chair set", imageNames: ["diningChairsImage"], category: "Furniture", user: userNames[4], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Redecorating the dining area and these chairs no longer match the new style. They're solid and comfortable, though."),
            
            Listing(id: 16, userId: 6, name: "Laptop", imageNames: ["laptopImage"], category: "Electronics", user: userNames[5], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Upgraded to a newer model for better performance. This laptop is still functional and could be useful for basic tasks."),
            Listing(id: 17, userId: 7, name: "Smartphone", imageNames: ["smartphoneImage"], category: "Electronics", user: userNames[6], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Got a new phone through a carrier upgrade. This one is unlocked and ready for a new SIM card."),
            Listing(id: 18, userId: 8, name: "Bluetooth speaker", imageNames: ["bluetoothSpeakerImage"], category: "Electronics", user: userNames[7], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Received a new speaker as a gift, so I'm passing along this one. It's portable and has good sound quality."),
            Listing(id: 19, userId: 9, name: "TV", imageNames: ["TVImage"], category: "Electronics", user: userNames[8], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Bought a larger TV for the living room and don't need this one anymore. It's a few years old but still works perfectly."),
            Listing(id: 20, userId: 10, name: "Gaming console", imageNames: ["gamingConsoleImage"], category: "Electronics", user: userNames[9], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "Graduating soon and won't have as much time for gaming. Console is in great condition with controllers and games included."),
            
            Listing(id: 21, userId: 1, name: "Decorative throw pillow", imageNames: ["decorativeThrowPillowImage"], category: "Decorations", user: userNames[0], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I'm redecorating my room and no longer need this throw pillow. It's still in great condition and would add a cozy touch to any space."),
            Listing(id: 22, userId: 2, name: "Wall art print", imageNames: ["wallArtPrintImage"], category: "Decorations", user: userNames[1], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I've changed my room's theme and this wall art print no longer matches. It's a beautiful piece and deserves a new home where it can be appreciated."),
            Listing(id: 23, userId: 3, name: "Fairy lights", imageNames: ["fairyLightsImage"], category: "Decorations", user: userNames[2], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I used these fairy lights for a party, but now they're just sitting in a drawer. They still work perfectly and would be great for adding ambiance to any occasion."),
            Listing(id: 24, userId: 4, name: "Ceramic vase", imageNames: ["ceramicVaseImage"], category: "Decorations", user: userNames[3], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "This ceramic vase was a gift, but it doesn't fit my style. It's a lovely piece and I hope someone else can enjoy displaying flowers in it."),
            Listing(id: 25, userId: 5, name: "Decorative candles", imageNames: ["decorativeCandlesImage"], category: "Decorations", user: userNames[4], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I received these decorative candles as a present, but I never use them. They're still in their packaging and would make a nice addition to someone's home decor."),
            
            Listing(id: 26, userId: 6, name: "Fiction Novel: 'The Great Gatsby'", imageNames: ["theGreatGatsbyImage"], category: "Books", user: userNames[5], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I've finished reading 'The Great Gatsby' and would like to pass it on to someone else who can enjoy this classic tale as much as I did."),
            Listing(id: 27, userId: 7, name: "Textbook: 'Introduction to Psychology'", imageNames: ["introductionToPsychologyImage"], category: "Books", user: userNames[6], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I've completed my psychology course and no longer need this textbook. It's in excellent condition and would be helpful for someone else studying the subject."),
            Listing(id: 28, userId: 8, name: "Cookbook: 'The Joy of Cooking'", imageNames: ["joyOfCookingImage"], category: "Books", user: userNames[7], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I received two copies of 'The Joy of Cooking' as gifts, so I'm giving away the extra one. It's a comprehensive cookbook with delicious recipes for every occasion."),
            Listing(id: 29, userId: 9, name: "Self-Help Book: 'The Power of Habit'", imageNames: ["powerOfHabitImage"], category: "Books", user: userNames[8], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I found 'The Power of Habit' really insightful, but now that I've finished it, I'd like to pass it on to someone else who wants to improve their habits."),
            Listing(id: 30, userId: 10, name: "Graphic Novel: 'Watchmen'", imageNames: ["watchmenImage"], category: "Books", user: userNames[9], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I'm making space on my bookshelf and decided to give away my copy of 'Watchmen.' It's a classic graphic novel that deserves to be read by someone new."),
            
            Listing(id: 31, userId: 1, name: "Adidas Superstars", imageNames: ["adidasSuperstarsImage"], category: "Shoes", user: userNames[0], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I bought these Adidas Superstar sneakers online, but they're a bit too small for me. They're brand new and have never been worn outside"),
            Listing(id: 32, userId: 2, name: "Leather Chelsea boots", imageNames: ["leatherChelseaBootsImage"], category: "Shoes", user: userNames[1], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I've outgrown these leather Chelsea boots and they're still in good condition. They're stylish and comfortable, perfect for everyday wear."),
            Listing(id: 33, userId: 3, name: "Black ballet flats", imageNames: ["blackBalletFlatsImage"], category: "Shoes", user: userNames[2], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I wore these black ballet flats a few times, but they're not my style anymore. They're still in great shape and would be perfect for someone else."),
            Listing(id: 34, userId: 4, name: "Birkenstock Arizonas", imageNames: ["birkenstockArizonaImage"], category: "Shoes", user: userNames[3], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I got these Birkenstock Arizona sandals as a gift, but they're not my size. They're comfortable and high-quality, great for casual summer days."),
            Listing(id: 35, userId: 5, name: "Red Stilettos", imageNames: ["redStilettoImage"], category: "Shoes", user: userNames[4], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I bought these red stiletto heels for a special occasion, but I never wore them again. They're in excellent condition and would add a pop of color to any outfit."),
            
            Listing(id: 36, userId: 6, name: "Watch", imageNames: ["watchImage"], category: "Accessories", user: userNames[5], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I received this Timex Weekender watch as a birthday gift, but I already have a watch. It's stylish and versatile, perfect for everyday wear."),
            Listing(id: 37, userId: 7, name: "Sunglasses", imageNames: ["sunglassesImage"], category: "Accessories", user: userNames[6], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I bought these Ray-Ban Wayfarer sunglasses on impulse, but they don't suit my face shape. They're classic and iconic, great for sunny days."),
            Listing(id: 38, userId: 8, name: "Backpack", imageNames: ["backpackImage"], category: "Accessories", user: userNames[7], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I'm switching to a smaller backpack and no longer need my Herschel Little America. It's spacious, durable, and has served me well on many adventures."),
            Listing(id: 39, userId: 9, name: "Wallet", imageNames: ["walletImage"], category: "Accessories", user: userNames[8], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I upgraded to a minimalist wallet and am giving away my old leather bi-fold wallet. It's in good condition and has plenty of card slots and compartments."),
            Listing(id: 40, userId: 10, name: "Cashmere Scarf", imageNames: ["cashmereScarfImage"], category: "Accessories", user: userNames[9], userImage: userImages.randomElement()!, condition: "Used - like new", pickupLocation: "Pick-up from Uni library", description: "I received this cashmere winter scarf as a gift, but I already have one similar. It's soft, warm, and would make a luxurious addition to someone's winter wardrobe.")
        ]
    }

    func addSubmission(_ submission: Submission, to listingId: Int) {
        if listings.firstIndex(where: { $0.id == listingId }) != nil {
            submissions.append(submission)
        }
    }

    func acceptSubmission(_ submission: Submission, for listingId: Int) {
        if listings.firstIndex(where: { $0.id == listingId }) != nil {
            submissions.removeAll { $0.listingId == listingId && $0.id != submission.id }
        }
    }

    func rejectSubmission(_ submissionId: Int, for listingId: Int) {
        submissions.removeAll { $0.id == submissionId }
    }

=======
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
    
>>>>>>> ShivamNew
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
