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
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var itemName: String = ""
    @State private var deadline: String = ""
    @State private var detail: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Write your activity", text: $itemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Write your deadline", text: $deadline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Write your description", text: $detail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .navigationBarTitle("Add Activity",displayMode: .inline)
                    .navigationBarItems(trailing: Button(action: {
                        self.addItem(name: self.itemName,
                                     detail: self.detail,
                                     deadline: self.deadline)
                        self.showAddView = false
                    }, label: {
                        Text("Done").bold()
                    }))
                Spacer()
            }
        }
    }
    
    private func addItem (name: String,detail: String,deadline:String) {
        let newItem = Item(context: managedObjectContext)
        newItem.name = name
        newItem.detail = detail
        newItem.deadline = deadline
        newItem.isCompleted = false
        saveContext()
    }
    
    func saveContext() {
         do {
           try managedObjectContext.save()
         } catch {
           print("Error saving managed object context: \(error)")
         }
       }
    
}

struct AddView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            PreviewWrapper()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
    
    struct PreviewWrapper: View {
        @State(initialValue: false) var showAddView: Bool
        var body: some View {
            AddView(showAddView: $showAddView)
        }
    }
    
}
