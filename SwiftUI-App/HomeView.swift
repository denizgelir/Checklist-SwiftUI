//
//  HomeView.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/13/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var showAddView = false
    
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
                HStack {
                    Text(item.name)
                        .font(.headline)
                    Spacer()
                    Text(item.expireDate)
                        .font(.callout)
                }
            }
            .navigationBarTitle("Check It")
            .navigationBarItems(trailing: addButton)
            .offset(x: 0, y: 20)
            .sheet(isPresented: $showAddView) {
                AddView(showAddView: self.$showAddView)
            }
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
