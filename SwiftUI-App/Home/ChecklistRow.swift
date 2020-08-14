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
    var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
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
                Image("forward")
                    .resizable()
                    .frame(width:15,height: 15)
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .padding()
                    .animation(.easeInOut)
            }
            if isExpanded {
                Text(item.description)
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

struct ChecklistRow_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistRow(item: items[0])
    }
}
