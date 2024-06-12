//
//  StoryView.swift
//  ReHomeApp
//
//  Created by Lindsey Nguyen on 4/6/2024.
//

import SwiftUI

// Define the data model
struct UserData: Identifiable{
    let id: Int
    let fullName: String
    let profilePicture: [String]
    let email: String
    let stories: String
}

//Define StoryView
struct StoryCardView: View {
    let id: Int
    @State private var currentCardIndex = 0
    @State private var Card: [UserData]
    
    init(id: Int, cards: [UserData]) {
        self.id = id
        self.Card = cards
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    let screenSize: CGRect = UIScreen.main.bounds
                    ZStack{
                        VStack{
                            if let profilePicture = Card[currentCardIndex].profilePicture.first {
                                Image(profilePicture)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .clipShape(Circle())
                                    .padding(.top, 25)
                                Text(Card[currentCardIndex].fullName)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(Card[currentCardIndex].email)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.89, green: 0.59, blue: 0.48))
                                    .padding(5)
                                Text(Card[currentCardIndex].stories)
                                    .fontWeight(.regular)
                                    .padding()
                                    .padding(.leading, 5)
                                    .padding(.bottom, 15)
                                    .frame(width: .infinity, alignment:.topLeading)
                            }
                        }
                    }
                    .frame(width: screenSize.width*0.86, height: .infinity)
                    .background(Color(.secondarySystemBackground))
                    //.background(Color(red: 0.97, green: 20, blue: 1))
                    .cornerRadius(50)
                    .shadow(color: Color(.tertiaryLabel), radius: 2, x: 0, y: 4)
                    HStack{
                        Button(action: {
                            
                            if(1 < Card.count)
                            {
                                Card.remove(at: currentCardIndex)
                                currentCardIndex = (currentCardIndex + 1) % Card.count
                            } else {
                            }
                            
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .foregroundColor(.white)
                                .frame(width: 89.13918, height: 89.13918)
                                .background(Circle().fill(Color(red: 0.07, green: 0.05, blue: 0.19)).shadow(color: .gray, radius: 5))
                                .padding(.trailing, 30)
                        }
                        NavigationLink(destination: Destination(profilePicture: Card[currentCardIndex].profilePicture.first ?? "", fullName: Card[currentCardIndex].fullName))  {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .foregroundColor(.white)
                                .frame(width: 89.13918, height: 89.13918)
                                .background(Circle().fill(Color(red: 0.07, green: 0.05, blue: 0.19)).shadow(color: .gray, radius: 5))
                                .padding(10)
                        }
                        .navigationViewStyle(StackNavigationViewStyle())
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                }
            }
            
        }
        .navigationBarTitle("User Story")
        .onAppear{
            for(idx, element) in Card.enumerated() {
                if(element.id == id)
                {
                    //print("Index: ",idx)
                    currentCardIndex = idx
                    break
                }
            }
        }
    }
}
//Define Destination of Heart button
struct Destination: View {
    let profilePicture: String
    let fullName: String
    
    var body: some View {
        NavigationStack {
            Spacer()
            if let profileImage = UIImage(named: profilePicture) {
                Image(uiImage: profileImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 121, height: 122)
                    .clipShape(Circle())
            }
            Text(fullName)
                .font(Font.custom("Inter", size: 24)
                    .weight(.medium))
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
            NavigationLink(destination: Destination1(fullName: fullName)) {
                
                let myDynamicColor = UIColor(dynamicProvider: { $0.userInterfaceStyle == .dark ? .black : .white })
                
                Text("Rehome")
                    .font(Font.custom("SF Pro", size: 17).weight(.semibold))
                    .foregroundColor(Color(myDynamicColor))
                    .frame(width: 160, height: 40, alignment: .center)
                    .background(Color(.darkTerror))
                    .cornerRadius(8)
                    .shadow(color: Color(red: 0.07, green: 0.05, blue: 0.19), radius: 2, x: 0, y: 4)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .padding(5)
            Button("Chat") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .font(Font.custom("SF Pro", size: 17).weight(.semibold))
            .foregroundColor(Color(.label))
            .frame(width: 160, height: 40, alignment: .center)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).inset(by: 1).stroke(Color(.darkTerror), lineWidth: 2))
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationBarTitle("Confirm")
        .padding()
        
    }
}

//Define Destination of ReHome button
struct Destination1: View {
    let fullName: String
    @EnvironmentObject var dataProvider: DataProvider
    @State private var isHomeViewActive = false
    
    var body: some View {
        NavigationStack {
            Spacer()
            Spacer()
            Text("Approval message sent for \(fullName)’s Story")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(width: 335, height: 75, alignment: .top)
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 253, height: 253)
                .background(
                    Image("Done")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            Spacer()
            let myDynamicColor = UIColor(dynamicProvider: { $0.userInterfaceStyle == .dark ? .black : .white })
            
            Button("Back to Home") {
                isHomeViewActive = true
            }
            .font(Font.custom("SF Pro", size: 17).weight(.semibold))
            .foregroundColor(Color(myDynamicColor))
            .frame(width: 160, height: 40, alignment: .center)
            .background(Color(.darkTerror))
            .cornerRadius(8)
            .shadow(color: Color(red: 0.07, green: 0.05, blue: 0.19), radius: 2, x: 0, y: 4)
            .padding(5)
            .navigationDestination(isPresented: $isHomeViewActive) {
                HomeView()
                    .environmentObject(dataProvider)
            }
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationBarTitle("Approval")
        .padding()
        
    }
}

//Define Preview
#Preview {
    StoryCardView(id: 1, cards: [
        UserData(id: 1, fullName: "Helena Hills", profilePicture: ["Helena"], email: "helena.hills@student.uts.edu.au", stories: "“I'm a new Marketing student at UTS and came across your headphone listing. The color and features are exactly what I'm looking for! As I embark on my academic journey, having a reliable pair of headphones is essential for my coursework and study sessions. Could we discuss the possibility of me acquiring them from you?“"),
        UserData(id: 2, fullName: "Varun Bhatia", profilePicture: ["Varun"], email: "varun.bhatia@student.uts.edu.au", stories: "I just commenced my first semester at UTS and need a headphone for my Marketing degree. Will be appreciate if I can receive it from someone. Really like the color and function of your headphone.“"),
        UserData(id: 3, fullName: "Carina Morente", profilePicture: ["Carina"], email: "carina.morente@student.uts.edu.au", stories: "I just commenced my first semester at UTS and need a headphone for my Marketing degree. Will be appreciate if I can receive it from someone. Really like the color and function of your headphone.“"),
        UserData(id: 5, fullName: "Charles Brown", profilePicture: ["Charles"], email: "charles.brown@student.uts.edu.au", stories: "I need this because..."),
        UserData(id: 6, fullName: "Wang Lee", profilePicture: ["Wang"], email: "wang.lee@student.uts.edu.au", stories: "I need this because...")
    ])
}
