//
//  ContentView.swift
//  Project-7-iExpense-SwiftUI
//
//  Created by Baris Karalar on 17.06.2021.
//

import SwiftUI


//Deleting items using onDelete()

struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                    
                    //Or
                    //                .onDelete(perform: { indexSet in
                    //                    numbers.remove(atOffsets: indexSet)
                    //                })
                }
                
                //That would also work, but here’s our first quirk: the onDelete() modifier only exists on ForEach, so if we want users to delete items from a list we must put the items inside a ForEach.
                //            List(numbers, id: \.self) {
                //               Text("\($0)")
                //            }
                
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
            }
            .navigationBarItems(leading: EditButton())
        }
        
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

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
