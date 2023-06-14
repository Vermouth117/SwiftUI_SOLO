//
//  ContentView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/12.
//

import SwiftUI
import FirebaseAuth
import CoreData

struct ContentView: View {
    @AppStorage("uid") var userID: String = ""

    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: Flower.entity(), sortDescriptors: [])
    var flowers: FetchedResults<Flower>
    
    @State var title = ""
    @State var star = ""
    @State var price = ""
    @State var image = ""
    
    var body: some View {
//        List {
//            ForEach(flowers) { flower in
//                if((flower.title?.isEmpty) == false) {
//                    HStack {
//                        if(flower.checked) {
//                            Text("☑︎")
//                        } else {
//                            Text("◽︎")
//                        }
//                        Button {
//                            flower.checked.toggle()
//                        } label: {
//                            Text(flower.title!)
//                        }
//                    }
//                }
//            }
//            TextField("Flower Title", text: $title)
//                .onSubmit {
//                    addFlower()
//                }
//            TextField("Flower Star", text: $star)
//                .onSubmit {
//                    addFlower()
//                }
//            TextField("Flower Price", text: $price)
//                .onSubmit {
//                    addFlower()
//                }
//            TextField("Flower Image", text: $image)
//                .onSubmit {
//                    addFlower()
//                }
//            Button(action: deleteflower) {
//                Text("DELETE")
//            }
//        }
        
        if userID == "" {
            AuthView()
        } else {
            ShopHomeView()
        }
    }
    
    func addFlower() {
        let newFlower = Flower(context: viewContext)
        newFlower.title = title
        newFlower.star = Double(star)!
        newFlower.price = Int16(price)!
        newFlower.image = image
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブ失敗")
        }
        title = ""
        star = ""
        price = ""
        image = ""
    }
    
    func deleteflower() {
        for flower in flowers {
            if(flower.checked) {
                viewContext.delete(flower)
            }
        }
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブ失敗")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
