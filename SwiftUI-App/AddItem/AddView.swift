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
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Write your activity", text: $itemName)
                    .padding()
                TextField("Write your deadline", text: $expireDate)
                    .padding()
                TextField("Write your description", text: $description)
                    .padding()
                    .navigationBarTitle("Add Activity",displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        let item = Item(name: self.itemName, deadline: self.expireDate, isCompleted: false, description: self.description)
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
