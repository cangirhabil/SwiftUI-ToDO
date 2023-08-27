//
//  ItemModel.swift
//  ToDo
//
//  Created by admin on 25.08.2023.
//

import Foundation

struct ItemModel: Identifiable , Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString ,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateComplation() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
