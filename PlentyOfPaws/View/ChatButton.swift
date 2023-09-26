//
//  ChatButton.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/24/23.
//

import SwiftUI

struct ChatButton: View {
    var body: some View {
      Image(systemName: "message.circle")
        .font(.system(size: 48, weight: .bold))
              .foregroundColor(.blue)
              .padding(.all, 5)
              .background(Color.white.opacity(1))
              .clipShape(Circle())
              .accessibility(label:Text("Chat"))
              .accessibility(hint:Text("Tap to start Chating"))
              .accessibility(addTraits: .isButton)
              .accessibility(removeTraits: .isImage)
    }
}

#Preview {
  ChatButton()
}
