//
//  AddView.swift
//  Project-7-iExpense-SwiftUI
//
//  Created by Baris Karalar on 19.06.2021.
//

import SwiftUI

//Sharing an observed object with a new view

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Business", "Personal"]
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingAlert = false
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
//                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save", action: {
                if let amount = Int(amount) {
                    let item = ExpenseItem(name: name, type: type, amount: Int(amount))
                    expenses.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    showingAlert = true
                }
               
            }))
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Not a number"), message: Text("Please enter a number"), dismissButton: .default(Text("Okay")))
            })
        }
        
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
