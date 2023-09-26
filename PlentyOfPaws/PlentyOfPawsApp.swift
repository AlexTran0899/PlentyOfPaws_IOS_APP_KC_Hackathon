//
//  PlentyOfPawsApp.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/23/23.
//

import SwiftUI

@main
struct PlentyOfPawsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
            .environmentObject(ContentModel())
        }
    }
}
