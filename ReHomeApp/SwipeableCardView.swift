//import SwiftUI
//struct SwipeableCardView: View {
//    let listing: Listing
//    var onSave: () -> Void
//    var onShowAllImages: () -> Void
//
//    var body: some View {
//        ZStack {
//            VStack(alignment: .leading) {
//                ZStack(alignment: .topLeading) {
//                    Button {
//                        onShowAllImages()
//                    } label: {
//                        Image(listing.imageNames.first!)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 200)
//                            .clipped()
//                            .cornerRadius(10)
//                    }
//                    
//                    LinearGradient(
//                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                    .frame(height: 80)
//                    .cornerRadius(10)
//                    
//                    HStack {
//                        Image(listing.userImage)
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .clipShape(Circle())
//                            .padding(.leading, 10)
//                        Text(listing.user)
//                            .font(.headline)
//                            .foregroundColor(.white)
//                    }
//                    .padding([.top, .trailing], 10)
//                }
//
//                Text(listing.name)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, 10)
//                    .padding(.leading, 10)
//                
//                Text(listing.condition)
//                    .font(.subheadline)
//                    .foregroundColor(.orange)
//                    .padding(.leading, 10)
//
//                Text(listing.pickupLocation)
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                    .padding(.leading, 10)
//                
//                Text("\"\(listing.description)\"")
//                    .font(.body)
//                    .padding(10)
//
//                Spacer()
//
//                HStack {
//                    Spacer()
//                    Button(action: onSave) {
//                        Image(systemName: "bookmark.circle.fill")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                            .foregroundColor(.blue)
//                            .padding()
//                    }
//                }
//                .padding(.trailing, 10)
//            }
//            .background(Color.white)
//            .cornerRadius(20)
//            .shadow(radius: 5)
//            .padding()
//        }
//    }
//}
