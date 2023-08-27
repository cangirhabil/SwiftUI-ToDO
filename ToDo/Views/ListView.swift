//
//  ListView.swift
//  ToDo
//
//  Created by admin on 24.08.2023.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if(!listViewModel.items.isEmpty){
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                
            }else{
                NavigationLink("Add Item", destination: AddView())
            }
            
        }
        .navigationTitle("To Do List")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink("Add", destination: AddView() )
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        
    }
}
