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
        VStack(alignment: .leading, spacing: 8) {
            ZStack {}
            .frame(width: 100, height: 100)
            .background(
              Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .clipped()
                .overlay(
                    Circle()
                        .stroke(.regularMaterial, style: StrokeStyle(lineWidth: 5))
                )
            )
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(48)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                  .font(
                    Font.custom("Inter", size: 14)
                      .weight(.medium)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.darkTerror)
                  .frame(width: 100, alignment: .center)
            }
            .padding(0)
            .frame(width: 100, alignment: .topLeading)
            
        }
        .padding(0)
        
    }
}

#Preview {
    UserStoryView(imageName: "Helena", title: "Helena")
}
