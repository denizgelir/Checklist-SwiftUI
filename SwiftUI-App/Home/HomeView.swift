//
//  HomeView.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.name, ascending: true)
        ]
    ) var items: FetchedResults<Item>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showAddView = false
    @State private var selection: Set<Item> = []
    
    var addButton: some View {
        Button(action: {
            self.showAddView = true
        }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add"))
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items,id: \.self) { item in
                    ChecklistRow(item: item,isExpanded: self.selection.contains(item))
                        .buttonStyle(PlainButtonStyle())
                        .onTapGesture { self.selectDeselect(item: item) }
                        .animation(.easeInOut)
                }
                .onDelete(perform: deleteRow)
            }
            .navigationBarTitle("Check That")
            .navigationBarItems(trailing: addButton)
            .offset(x: 0, y: 20)
            .sheet(isPresented: $showAddView) {
                AddView(showAddView: self.$showAddView)
                    .environment(\.managedObjectContext, self.managedObjectContext)
            }
        }
        
    }
    
    private func selectDeselect(item: Item) {
        if selection.contains(item) {
            selection.remove(item)
        }else{
            selection.insert(item)
        }
    }
    
    private func deleteRow(at indexSet: IndexSet) {
          indexSet.forEach { index in
          let item = self.items[index]
          self.managedObjectContext.delete(item)
        }
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            HomeView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
