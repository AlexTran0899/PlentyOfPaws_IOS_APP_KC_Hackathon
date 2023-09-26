//
//  CloseButton.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/23/23.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
      Image(systemName: "xmark")
              .font(.system(size: 48, weight: .bold))
              .foregroundColor(.white)
              .padding(.all, 5)
              .background(Color.black.opacity(1))
              .clipShape(Circle())
              .accessibility(label:Text("Close"))
              .accessibility(hint:Text("Tap to close the screen"))
              .accessibility(addTraits: .isButton)
              .accessibility(removeTraits: .isImage)
    }
}

#Preview {
    CloseButton()
}
