//
//  ListingView.swift
//  ReHomeApp
//
//  Created by Purevsuren Erdene on 4/6/2024.
//

import SwiftUI

struct ListingView: View {
    
    let maxStoryCount = 3
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
                Text("Noise cancelling")
                    .padding(.top)
                    .font(.title3)
            }
            .padding(.leading)
            
            Group {
                GeometryReader { geometry in
                      HStack(alignment: .center, spacing: 5) {
                        let component1Width = geometry.size.width * 0.35
                        let component2Width = geometry.size.width * 0.65
                          
                          VStack {
                              Image("product1")
                                  .resizable()
                                  .scaledToFit()
                                  .cornerRadius(50)
                                  .frame(width: component1Width)
                                  .padding([.leading, .trailing])
                              
                              HStack {
                                  Button("Edit"){
                                      
                                  }
                                  .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                                  .cornerRadius(8)
                                  .foregroundColor(.white)
                                  .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                  .controlSize(.regular)
                                  .scaledToFit()
                                  .padding(.top)
                                  .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 4)
                              }
                              .buttonStyle(.bordered)
                          }
                          
                          VStack(alignment: .leading, spacing: 14) {
                              ScrollView{
                                  Text("An almost new headphone. Bought it in Jan 2024. But now I am gifted a new one. So wanna give this way.")
                                      .lineLimit(nil)
                                      .padding([.trailing, .top])
                              }
                              .padding([.trailing, .top])
                              
                              
                              
                          }
                          .padding([.trailing, .top])
                          .frame(width: component2Width)
                      }
                    }
            }
            
            Divider().frame(height: 3).background(Color.black).padding(.horizontal)
            
            Group{
                Text("Stories")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .frame(alignment: .leading)
                    .padding(.leading)
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(0..<self.stories.count/maxStoryCount + (self.stories.count % maxStoryCount == 0 ? 0 : 1), id: \.self) { rowIndex in
                            HStack(spacing: 15) {
                                ForEach(0..<maxStoryCount) { columnIndex in
                                    let storyIndex = rowIndex * maxStoryCount + columnIndex
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
