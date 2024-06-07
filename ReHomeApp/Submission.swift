import Foundation

struct Submission: Identifiable {
    let id: Int
    let listingId: Int
    let ownerId: Int
    let userId: Int
    let story: String
    let date: Date
}

