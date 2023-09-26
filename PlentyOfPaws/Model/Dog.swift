//
//  Dog.swift
//  PlentyOfPaws
//
//  Created by Alex Tran on 9/23/23.
//

import Foundation

struct Dog: Decodable, Identifiable {
  var id: UUID {
    return UUID()
  }
  var dog_id: Int
  var user_id: Int
  var breed: String
  var name: String
  var age: String
  var energy_level: Int
  var maintenance_level: Int
  var cost: String
  var description: String?
  var images: [DogImage]
  var videos: [DogVideo]
  var created_at: String
  var updated_at: String
}

struct DogImage: Decodable, Identifiable {
  var id: UUID {
    return UUID()
  }
  var image_id: Int
  var dog_id: Int
  var image_url: String
  var created_at:String
  var updated_at:String
}

struct DogVideo: Decodable, Identifiable {
  var id: UUID {
    return UUID()
  }
  var video_id: Int
  var dog_id: Int
  var video_url: String
  var created_at:String
  var updated_at:String
}
