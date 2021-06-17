//
//  ContentView.swift
//  Project-7-iExpense-SwiftUI
//
//  Created by Baris Karalar on 17.06.2021.
//

import SwiftUI

class User {
    var firstName = "Baris"
    var lastName = "Karalar"
}

struct ContentView: View {
    
    @State private var user = User()
    
    var body: some View {
        
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
        }
        

    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
