//
//  AuthView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI

struct AuthView: View {
    @State private var currentViewShowing: String = "login"   // login or signup

    var body: some View {
        if(currentViewShowing == "login") {
            LoginView(cuurentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignupView(cuurentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
