//
//  ContentView.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/23/23.
//

import SwiftUI

struct LaunchView: View {
  @EnvironmentObject var model: ContentModel
  @State private var currSelectedDog = 0
  @State var isDetailViewShowing = false
  
  var body: some View {
    VStack{
      TabView(selection: $currSelectedDog) {
        ForEach(0..<model.dogs.count, id: \.self) { index in
          Card(dog: model.dogs[index]).onTapGesture(perform: {
            isDetailViewShowing.toggle()
          })
        }
      }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }.fullScreenCover(isPresented: $isDetailViewShowing) {
      MoreDogInfo(dog: model.dogs[currSelectedDog], isDetailViewShowing: $isDetailViewShowing)
    }
  }
}

//#Preview {
//    LaunchView()
//}
