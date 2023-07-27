//
//  Model.swift
//  HomeSet
//
//  Created by una ivan on 18/07/23.
//

import Foundation

struct Component: Codable, Identifiable  {
    let id: Int
    let componentname: String
    let componenttype: String
    let componenticon: String
    let componentstatus: Bool
//    let datapoints: Int
}


struct Room: Codable, Identifiable {
    let id: Int
    let roomname: String
    let icon: String
    let components: [Component]
}


struct Root: Codable {
    let room: [Room]
}

