//
//  AddView.swift
//  ToDo
//
//  Created by admin on 24.08.2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 55, alignment: .center)
                .cornerRadius(20)
                .foregroundColor(Color.orange)
                .padding()
                .overlay(alignment: .center) {
                    TextField("  Type here!", text: $textFieldText)
                        .frame(height: 55, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .padding()
                }
            
            
            Button {
                saveButtonPressed()
            } label: {
                
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(20)
                    .padding()
            }

        }
        .navigationTitle("Add a Task")
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    
    
    func saveButtonPressed(){
        if isTextAppropriate(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
        
    }
    
    func isTextAppropriate() -> Bool {
        if textFieldText.count == 0{
            alertTitle = "Please type something"
            showAlert.toggle()
            return false
        }else if (textFieldText.count < 3){
            alertTitle = "Please enter at least 3 character"
            showAlert.toggle()
            return false
        }else{
            return true
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        
    }
}
