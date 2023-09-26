//
//  DetailRow.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/24/23.
//

import SwiftUI

struct DetailRow: View {
  var key: String
  var value: String
    var body: some View {
      HStack {
        Text(key + ":")
            .font(.system(size: 20, weight: .bold, design: .rounded))
          .bold()
        Spacer()
        Text(value)
          .font(.system(size: 20, design: .rounded))
      }.padding(.bottom,10)
    }
}

#Preview {
  DetailRow(key: "Breed", value: "German shepard")
}
