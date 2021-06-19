//
//  ContentView.swift
//  Project-7-iExpense-SwiftUI
//
//  Created by Baris Karalar on 17.06.2021.
//

import SwiftUI


//Building a list we can delete from
//Working with Identifiable items in SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String    
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
        
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing: Button(action: {
//                let expense = ExpenseItem(name: "Milk", type: "Personal", amount: 3)
//                expenses.items.append(expense)
                showingAddExpense = true
            }, label: {
                
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
        
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}

////Archiving Swift objects with Codable
//
//struct User: Codable {
//   var firstName: String
//   var lastName: String
//}
//
//struct ContentView: View {
//
//    @State private var user = User(firstName: "baris", lastName: "karalar")
//
//    var body: some View {
//
//        VStack {
//            TextField("asdfasd \(user.firstName)", text: $user.firstName)
//            TextField("Last name:", text: $user.lastName)
//
//            Button("Save user") {
//
//                let encoder = JSONEncoder()
//
//                if let data = try? encoder.encode(user) {
//                    UserDefaults.standard.set(data, forKey: "UserData")
//                }
//
//            }
//
//            Button("Show user") {
//                if let userData = UserDefaults.standard.data(forKey: "UserData") {
//                    let decoder = JSONDecoder()
//
//                    if let user = try? decoder.decode(User.self, from: userData) {
//                        print(user.firstName)
//                        print(user.lastName)
//                    }
//                }
//
//
//
//            }
//        }
//
//
//
//
//    }
//
//
//}

////Storing user settings with UserDefaults
//
//struct ContentView: View {
//
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//
//        VStack {
//            Button("Tap count \(tapCount)") {
//                tapCount += 1
//                UserDefaults.standard.set(tapCount, forKey: "Tap")
//            }
//            Text("\(tapCount)")
//        }
//
//
//
//
//    }
//
//
//}

////Deleting items using onDelete()
//
//struct ContentView: View {
//
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }
//                    .onDelete(perform: removeRows)
//
//                    //Or
//                    //                .onDelete(perform: { indexSet in
//                    //                    numbers.remove(atOffsets: indexSet)
//                    //                })
//                }
//
//                //That would also work, but here’s our first quirk: the onDelete() modifier only exists on ForEach, so if we want users to delete items from a list we must put the items inside a ForEach.
//                //            List(numbers, id: \.self) {
//                //               Text("\($0)")
//                //            }
//
//                Button("Add number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//
//            }
//            .navigationBarItems(leading: EditButton())
//        }
//
//
//    }
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//
//}

////Showing and hiding views
//
//struct SecondView: View {
//
//    var name: String
//    @Environment(\.presentationMode) var presentatiionMode
//
//    var body: some View {
//        Text("Second view \(name)")
//
//        Button("Dismiss") {
//            self.presentatiionMode.wrappedValue.dismiss()
//        }
//    }
//}
//
//struct ContentView: View {
//
//    @State private var showingSheet = false
//
//    var body: some View {
//
//        Button("Show sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet, content: {
//            SecondView(name: "Barisss")
//        })
//
//
//
//    }
//}

////Sharing SwiftUI state with @ObservedObject
//
//class User: ObservableObject {
//    @Published var firstName = "Baris"
//    @Published var lastName = "Karalar"
//}
//
//struct ContentView: View {
//
//    @ObservedObject var user = User()
//
//    var body: some View {
//
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//
//        }
//
//
//
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
