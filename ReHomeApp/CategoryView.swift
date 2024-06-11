
import SwiftUI
        struct CategoryView: View {
            let imageName: String
            let title: String
            
            var body: some View {
                ZStack(alignment: .bottomLeading) {
                    
                    Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 150)
                                    .clipped()
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                   startPoint: .bottom,
                                   endPoint: .top)
                        .frame(height: 150)
                        .cornerRadius(10)
                    Text(title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()


                }
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }


#Preview {
    CategoryView(imageName: "homedecorImage", title: "HomeDecor")
}
