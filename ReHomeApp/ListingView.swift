//
//  ListingView.swift
//  ReHomeApp
//
//  Created by Purevsuren Erdene on 4/6/2024.
//

import SwiftUI

struct ListingView: View {
    
    let stories = [
        UserStory(id: 1, firstName: "Helena", profilePicture: "Helena"),
        UserStory(id: 2, firstName: "Varun", profilePicture: "Varun"),
        UserStory(id: 3, firstName: "Carina", profilePicture: "Carina"),
        UserStory(id: 4, firstName: "Charles", profilePicture: "Charles"),
        UserStory(id: 5, firstName: "Wang", profilePicture: "Wang")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, content: {
                GeometryReader { geometry in VStack (alignment: .leading, spacing: 0) {
                    
                    VStack(alignment: .leading, spacing: 0){
                        Text("Headphones")
                            .bold()
                            .font(.largeTitle)
                            .frame(alignment: .leading)
                            .padding(.leading)
                        Text("User 1")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        
                        Group {
                            Text("Category")
                                .padding(.top)
                                .font(.title3)
                        }
                        .padding(.leading)
                        
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
                                    .frame(alignment: .center)
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
                    .frame(height: geometry.size.height / 2)
                    
                    Divider().frame(height: 3).background(Color.black).padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Stories")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .frame(alignment: .leading)
                            .padding([.top, .leading])
                    }
                    .padding(0)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyVStack(alignment: .leading, spacing: 19) {
                                LazyHStack(alignment: .top, spacing: 12) {
                                    ForEach(stories) {story in
                                        NavigationLink(destination: StoryView(id: story.id)){
                                            UserStoryView(imageName: story.profilePicture, title: story.firstName)
                                        }
                                    }
                                }
                                .padding(.leading)
                            }
                            .padding(.horizontal, 0)
                            .padding(.bottom, 150)
                        }
                    }
                    .frame(height: geometry.size.height / 2)
                }
                    
                }
            })
            .frame(alignment: .leading)
        }
        
    }
}

#Preview {
    ListingView()
}
