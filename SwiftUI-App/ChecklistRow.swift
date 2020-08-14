//
//  ChecklistRow.swift
//  SwiftUI-App
//
//  Created by Deniz Gelir on 8/14/20.
//  Copyright © 2020 Deniz. All rights reserved.
//

import SwiftUI

struct ChecklistRow: View {
    
    var item : Item {
        didSet{
            isCompleted = item.isCompleted
        }
    }
    @State var isCompleted = Bool()
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.isCompleted.toggle()
            }) {
                Image(isCompleted ? "checked" : "unchecked")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
            }
            Text(item.name)
                .font(.headline)
            Spacer()
            Text(item.deadline)
                .font(.callout)
                .padding()
        }
        
    }
}

struct ChecklistRow_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistRow(item: items[0])
    }
}
