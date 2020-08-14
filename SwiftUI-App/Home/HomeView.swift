//
//  HomeView.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

struct HomeView: View {
        
    @State private var showAddView = false
    @State private var selection: Set<Item> = []
    
    var addButton: some View {
        Button(action: {
            self.showAddView.toggle()
        }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add"))
        }
    }
    
    var body: some View {
        NavigationView {
            List(items,id: \.name) { item in
                ChecklistRow(item: item,isExpanded: self.selection.contains(item))
                    .buttonStyle(PlainButtonStyle())
                    .onTapGesture { self.selectDeselect(item: item) }
                    .animation(.easeInOut)
            }
            .navigationBarTitle("Check It")
            .navigationBarItems(trailing: addButton)
            .offset(x: 0, y: 20)
            .sheet(isPresented: $showAddView) {
                AddView(showAddView: self.$showAddView)
            }
        }
        
    }
    
    func selectDeselect(item: Item) {
        if selection.contains(item) {
            selection.remove(item)
        }else{
            selection.insert(item)
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
