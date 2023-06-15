//
//  HeaderView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI

struct HeaderView: View {
    @State private var isCartViewPresented = false
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Exclusive Flowers")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("for your hobby")
                    .font(.title)
            }
            .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7))
            
            Spacer()
            
            Button {
                isCartViewPresented = true
            } label: {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .opacity(0.8)
            }
            .sheet(isPresented: $isCartViewPresented) {
                CartView()
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
