//
//  CategoriesView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI

var tabs = ["All", "Indoor", "Outdoor", "Garden"]

struct CategoriesView: View {
    @State var selectedTab = tabs[0]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        Text(tab)
                            .fontWeight(.medium)
                            .foregroundColor(selectedTab == tab ? .white : .gray)
                            .padding()
                            .padding(.horizontal)
                            .background(ZStack {
                                if (selectedTab == tab) {
                                    Color(red: 0.8, green: 0.6, blue: 0.7, opacity: 0.9)
                                }
                            })
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.15), radius: 5)
                    }
                }
            }
            .padding(.bottom, 24)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
