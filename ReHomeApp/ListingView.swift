//
//  ListingView.swift
//  ReHomeApp
//
//  Created by Purevsuren Erdene on 4/6/2024.
//

import SwiftUI

struct ListingView: View {
    
    
    let stories = [
            UserStory(id: "1", name: "Lindsay", imageName: "p1"),
            UserStory(id: "2", name: "Monica", imageName: "p1"),
            UserStory(id: "3", name: "Shivam", imageName: "p1"),
            UserStory(id: "4", name: "Archie", imageName: "p1"),
            UserStory(id: "5", name: "Peter", imageName: "p1")
        ]
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Headphones")
                .bold()
                .font(.largeTitle)
                .frame(alignment: .leading)
                .padding(.leading)
            Text("Shivam")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.leading)
            Group {
                Text("Bose QC-45 Noise cancelling")
                    .padding([.top, .bottom])
                    .font(.title3)
            }
            .padding(.leading)
            
            Group {
                GeometryReader { geometry in
                      HStack(spacing: .zero) {
                        let component1Width = geometry.size.width * 0.45
                        let component2Width = geometry.size.width * 0.55
                          
                          Image("product1")
                              .resizable()
                              .scaledToFit()
                              .cornerRadius(15)
                              .clipShape(Circle())
                              .overlay(
                                  Circle()
                                    .stroke(.gray, style: StrokeStyle(lineWidth: 2.27))
                              )
                              .frame(width: component1Width)

                          VStack {
                              ScrollView{
                                  Text("There’s comfort in quiet. You can feel it the minute you put them on. The soft, plush cushions seal you in. You press the button and whoosh — the world fades, the music starts, and it’s love at first listen. That’s the power of our QuietComfort 45 Headphones with signature active noise cancelling technology and premium comfort. Bose QuietComfort 45 Headphones also deliver proprietary acoustic technology for deep, clear audio with adjustable EQ so you can tune your music to your liking. They're wireless headphones with a perfect balance of quiet, comfort, and sound you’ll enjoy all day long.")
                                      .lineLimit(nil)
                              }
                              .padding(.trailing)
                              
                              
                              HStack {
                                  Button("Edit"){
                                      
                                  }
                                  .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                                  .cornerRadius(50)
                                  .foregroundColor(.white)
                                  Button("🗑️"){
                                      
                                  }
                                  .background(Color(red: 0.99, green: 0, blue: 0.36))
                                  .cornerRadius(50)
                                  .foregroundColor(.white)
                              }
                              .buttonStyle(.bordered)
                          }
                          .frame(width: component2Width)
                      }
                    }
            }
            
            Divider()
            
            Group{
                Text("Stories")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .frame(alignment: .leading)
                    .padding(.leading)
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(0..<self.stories.count/3 + (self.stories.count % 3 == 0 ? 0 : 1), id: \.self) { rowIndex in
                            HStack(spacing: 15) {
                                ForEach(0..<3) { columnIndex in
                                    let storyIndex = rowIndex * 3 + columnIndex
                                    if storyIndex < self.stories.count {
                                        UserStoryView(imageName: self.stories[storyIndex].imageName, title: self.stories[storyIndex].name)
                                            .frame(maxWidth: .infinity)
                                    } else {
                                        Spacer().frame(maxWidth: .infinity)
                                    }
                                }
                            }
                        }
                    }
                    .padding([.horizontal, .top])
                }
                Spacer()
            }
        })
        .frame(alignment: .leading)
        
        
    }
}

#Preview {
    ListingView()
}
