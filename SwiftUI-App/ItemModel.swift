//
//  ItemModel.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

var items : [Item] = [Item(name: "First", expireDate: "Today"),
                      Item(name: "Second", expireDate: "Yesterday")]

struct Item : Hashable,Codable {
    var name : String
    var expireDate : String
}
