//
//  ItemModel.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

var items : [Item] = [Item(name: "First",deadline: "Today",isCompleted: false),
                      Item(name: "Second",deadline: "Yesterday",isCompleted: false)]

struct Item : Hashable,Codable {
    var name : String
    var deadline : String
    var isCompleted: Bool
}
