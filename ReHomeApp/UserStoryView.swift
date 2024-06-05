//
//  UserStoryView.swift
//  ReHomeApp
//
//  Created by Purevsuren Erdene on 4/6/2024.
//

import SwiftUI

struct UserStoryView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image("p1")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(
                    Circle()
                        .stroke(.yellow, style: StrokeStyle(lineWidth: 5))
                )
            
            Text(title)
                .font(.footnote)
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding()
                .scaledToFit()
        }
    }
}

#Preview {
    UserStoryView(imageName: "p1", title: "hello")
}
