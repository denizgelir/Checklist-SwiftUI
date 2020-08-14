//
//  AddView.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @Binding var showAddView : Bool
    @State private var itemName: String = ""
    @State private var expireDate: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Write your activity", text: $itemName)
                    .padding()
                TextField("Write your deadline", text: $expireDate)
                    .padding()
                    .navigationBarTitle("Add Activity",displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        let item = Item(name: self.itemName, expireDate: self.expireDate)
                        items.append(item)
                        self.showAddView = false
                    }, label: {
                        Text("Done").bold()
                    }))
                Spacer()
            }
        }
    }
}
