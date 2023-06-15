//
//  RecommendFlowerCardView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/13.
//

import SwiftUI
import Firebase
import FirebaseStorage
import SDWebImageSwiftUI

struct RecommendFlowerCardView: View {
    var title: String
    var price: Int16
    var image: String
    var star: Double
    var dataList: [[String: Any]]
    var index: Int
    
    let storage = Storage.storage().reference()
    let db = Firestore.firestore()
    
    @State private var imageURL: URL?
    
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            if let imageURL = imageURL {
                WebImage(url: imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250)
            } else {
                Text("Loading image...")
                    .frame(width: 250, height: 375)
            }
            
//            Image(image)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 250)
            
            VStack (alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7))
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow.opacity(0.9))
                    Text(String(format: "%.1f",star))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7, opacity: 0.7))
                        .padding(.top, 1)
                }
                
                HStack {
                    Text("$\(price)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.8, green: 0.5, blue: 0.1))
                    
                    Spacer()
                    
                    Button {
                        print("push \(dataList[index])")
                        db.collection("cart").addDocument(data: dataList[index]) { error in
                            if let error = error {
                                print("Error adding document: \(error)")
                            } else {
                                print("Document added successfully")
                                print(userID)
                            }
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color(red: 0.8, green: 0.6, blue: 0.7, opacity: 0.9))
                            .cornerRadius(50)
                    }
                }
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.03), radius: 15)
        .onAppear {
            fetchImageURL()
        }
    }
    
    private func fetchImageURL() {
        let imageRef = storage.child("image/\(image).jpg")
        
        // imageRef.downloadURL { url, error in ... }はFirebase StorageからイメージのダウンロードURLを非同期に取得するためのメソッド
        imageRef.downloadURL { url, error in
            if let error = error {
                print("Failed to get download URL:", error)
            } else if let url = url {
                imageURL = url
            }
        }
        print(dataList)
    }
}

//struct RecommendFlowerCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendFlowerCardView()
//    }
//}
