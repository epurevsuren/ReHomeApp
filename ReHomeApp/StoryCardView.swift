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
    @EnvironmentObject var dataProvider: DataProvider
    
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
                            rejectSubmission(Card[currentCardIndex].id)
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
                        NavigationLink(destination: Destination(profilePicture: Card[currentCardIndex].profilePicture.first ?? "", fullName: Card[currentCardIndex].fullName, submissionId: Card[currentCardIndex].id, itemId: self.id))  {
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
    
    private func rejectSubmission(_ submissionId: Int) {
        // Reject the submission
        dataProvider.rejectSubmission(submissionId, for: self.id)
    }
}
//Define Destination of Heart button
struct Destination: View {
    let profilePicture: String
    let fullName: String
    let submissionId: Int
    let itemId: Int
    @EnvironmentObject var dataProvider: DataProvider
    @State private var isDestination1Active = false
    
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
            
            let myDynamicColor = UIColor(dynamicProvider: { $0.userInterfaceStyle == .dark ? .black : .white })
            
            Button("Rehome") {
                isDestination1Active = true
                acceptSubmission(submissionId)
            }
            .font(Font.custom("SF Pro", size: 17).weight(.semibold))
            .foregroundColor(Color(myDynamicColor))
            .frame(width: 160, height: 40, alignment: .center)
            .background(Color(.darkTerror))
            .cornerRadius(8)
            .shadow(color: Color(red: 0.07, green: 0.05, blue: 0.19), radius: 2, x: 0, y: 4)
            .navigationDestination(isPresented: $isDestination1Active) {
                Destination1(fullName: fullName)
            }
            
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
    
    private func acceptSubmission(_ submissionId: Int) {
        // Accept the submission and delete others
        dataProvider.acceptSubmission(submissionId, for: self.itemId)
    }
}

//Define Destination of ReHome button
struct Destination1: View {
    let fullName: String
    @EnvironmentObject var dataProvider: DataProvider
    @State private var isHomeViewActive = false
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack {
            Spacer()
            Text("Approval message sent for \(fullName)’s Story")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.top)
            //.scaledToFit()
                .frame(width: screenSize.width, height: 75, alignment: .top)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 150, height: 150)
                .background(
                    Image("Done")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                )
            let myDynamicColor = UIColor(dynamicProvider: { $0.userInterfaceStyle == .dark ? .black : .white })
            
            Button("Back to Home") {
                isHomeViewActive = true
            }
            .font(Font.custom("SF Pro", size: 17).weight(.semibold))
            .foregroundColor(Color(myDynamicColor))
            .frame(width: 150, height: 35, alignment: .center)
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
        }
        .navigationBarTitle("Approval")
        .padding()
        
    }
}
