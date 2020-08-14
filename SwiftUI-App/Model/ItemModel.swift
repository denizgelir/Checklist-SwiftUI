//
//  ItemModel.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

var items : [Item] = [Item(name: "First",
                           deadline: "Today",
                           isCompleted: false,
                           description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      Item(name: "Second",
                           deadline: "Yesterday",
                           isCompleted: false,
                           description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.")]

struct Item : Hashable,Codable,Identifiable {
    var id = UUID().uuidString
    var name : String
    var deadline : String
    var isCompleted: Bool
    var description: String
}
