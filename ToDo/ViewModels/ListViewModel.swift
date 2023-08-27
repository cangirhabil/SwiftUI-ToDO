//
//  ListViewModel.swift
//  ToDo
//
//  Created by admin on 25.08.2023.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveData()
        }
    }
    
    let itemKey = "items_list"
    init(){
        getItems()
    }
    
    func getItems(){
        
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = savedItems
        
    }
    
    
    func moveItem(indexSet: IndexSet, to: Int){
        items.move(fromOffsets: indexSet, toOffset: to)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
        }
    }
    
    func saveData(){
        if let encodendData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodendData, forKey: itemKey)
        }
    }
    
}
