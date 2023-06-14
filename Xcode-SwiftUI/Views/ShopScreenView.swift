//
//  ShopScreenView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI

struct ShopScreenView: View {
    @FetchRequest(entity: Flower.entity(), sortDescriptors: [])
    var flowers: FetchedResults<Flower>
    
    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.95, blue: 0.95)
                .ignoresSafeArea()
            VStack {
                HeaderView()
                CategoriesView()
                SectionTitleView(title: "Recommended")
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                        ForEach(flowers) { flower in
                            if let title = flower.title, !title.isEmpty {
                                RecommendFlowerCardView(title: flower.title!, price: flower.price, image: flower.image!, star: flower.star)
                            }
                        }
//                        RecommendFlowerCardView(title: "Pink Roses", price: 150, image: "img_flower_one", star: 4.8)
//                        RecommendFlowerCardView(title: "White Lilies", price: 120, image: "img_flower_two", star: 4.0)
//                        RecommendFlowerCardView(title: "White Tulips", price: 130, image: "img_flower_three", star: 4.3)
                    }
                }
            }
            .padding()
        }
    }
}

struct ShopScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ShopScreenView()
    }
}
