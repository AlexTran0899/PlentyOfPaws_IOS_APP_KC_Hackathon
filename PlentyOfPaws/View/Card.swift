//
//  Card.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/23/23.
//

import SwiftUI
import Combine

struct Card: View {
  var dog: Dog
  var body: some View {
    GeometryReader {geo in
      VStack(alignment:.center){
        if dog.images.isEmpty {
          Image("notfound")
            .scaledToFill()
            .frame(width: geo.size.width - 40)
            .cornerRadius(10)
            .shadow(radius: 10)
        } else {
          AsyncImage(
            url: URL(string: dog.images[0].image_url),
            content: { image in
              image.resizable()
                .scaledToFill()
                .frame(width: geo.size.width - 40)
                .cornerRadius(10)
                .shadow(radius: 10)
            },
            placeholder: {
              ProgressView()
            }
          )
        }
        ZStack {
          HStack {
            VStack(alignment: .leading) {
              HStack{
                VStack(alignment: .leading){
                  Text(dog.name)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                  Text(dog.breed)
                    .font(.system(size: 20, weight: .regular, design: .rounded))
                }
                Spacer()
                HStack(alignment: .top){
                  VStack{
                    Text(dog.age)
                      .font(.system(size: 68, weight: .bold, design: .rounded))
                  }
                  VStack{
                    Text(" y.o.")
                      .font(.system(size: 16, weight: .bold, design: .rounded))
                      .padding(.top, 10)
                  }
                }
              }
            }
            .padding(.top, 40)
            .padding(.bottom, 70)
            Spacer()
          }
        }
      }.padding(20)
      
    }
  }
}

