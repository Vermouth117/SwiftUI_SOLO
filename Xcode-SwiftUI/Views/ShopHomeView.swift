//
//  ShopHomeView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI
import FirebaseAuth

struct ShopHomeView: View {
    @AppStorage("uid") var userID: String = ""
    @State private var isShopScreenViewActive = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("img_background")
                    .resizable()
                    .overlay(LinearGradient(colors: [Color.black.opacity(0), Color.black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomLeading))
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    HStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 130, height: 130)
                            .opacity(0.3)
                        Spacer()
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Where Blooms")
                        .font(.system(size: 23))
                        .foregroundColor(Color.white.opacity(0.9))
                        .fontWeight(.semibold)
                    Text("Come to Life.")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Text("Bringing Nature's Beauty to \nYour Doorstep.")
                        .foregroundColor(Color.white.opacity(0.8))
                        .fontWeight(.semibold)
                        .padding(.vertical, 1)
                    
                    Spacer()
                    
                    HStack {
                        HStack {
                            Button {
                                let firebaseAuth = Auth.auth()
                                do {
                                    try firebaseAuth.signOut()
                                    withAnimation {
                                        userID = ""
                                    }
                                } catch let signOutError as NSError {
                                    print("Error signing out: %@", signOutError)
                                }
                            } label: {
                                Image(systemName: "chevron.backward")
                                Text("Sign out")
                                    .fontWeight(.semibold)
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding(.trailing, 5)
                        .background(Color(red: 0.1, green: 0.6, blue: 0.5, opacity: 0.6))
                        .cornerRadius(50)
                        
                        Spacer()
                        
                        HStack {
                            NavigationLink(destination: ShopScreenView(), isActive: $isShopScreenViewActive) {
                                EmptyView()
                            }
                            Button {
                                isShopScreenViewActive = true
                            } label: {
                                Text("Next")
                                    .fontWeight(.semibold)
                                Image(systemName: "chevron.forward")
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color(red: 0.1, green: 0.6, blue: 0.5, opacity: 0.6))
                        .cornerRadius(50)
                    }
                }
                .padding()
            }
        }
    }
}

struct ShopHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ShopHomeView()
    }
}
