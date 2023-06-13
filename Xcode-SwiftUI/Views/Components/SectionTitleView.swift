//
//  SectionTitleView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI

struct SectionTitleView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7))
            
            Spacer()
            
            Text("See All")
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7, opacity: 0.7))
        }
    }
}

//struct SectionTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionTitleView()
//    }
//}
