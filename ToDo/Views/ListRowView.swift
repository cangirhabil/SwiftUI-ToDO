//
//  ListRowView.swift
//  ToDo
//
//  Created by admin on 24.08.2023.
//

import SwiftUI


struct ListRowView: View {

    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "test", isCompleted: true)
    static var previews: some View {
        ListRowView(item: item1)
    }
}
