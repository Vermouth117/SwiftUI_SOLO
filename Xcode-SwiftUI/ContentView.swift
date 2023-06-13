//
//  ContentView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/12.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        if userID == "" {
            AuthView()
        } else {
            ShopHomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
