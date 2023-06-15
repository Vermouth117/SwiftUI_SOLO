//
//  CartView.swift
//  Xcode-SwiftUI
//
//  Created by Vermouth on 2023/06/15.
//

import SwiftUI
import FirebaseFirestore

struct CartView: View {
    @State private var documents: [DocumentSnapshot] = []
    
    var body: some View {
        VStack {
            Text("Cart")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7))
                .padding(.top, 20)

            Spacer()
            
            ScrollView (.vertical, showsIndicators: false) {
                ForEach(Array(documents.enumerated()), id: \.element.documentID) { index, flower in
                    if let title = flower.data()?["title"] as? String,
                       let price = flower.data()?["price"] as? Int,
                       let image = flower.data()?["image"] as? String,
                       let star = flower.data()?["star"] as? Double {
                        HStack {
                            VStack {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 130)
                                    .cornerRadius(10)
                            }
                            .frame(width: 100, height: 100)
                            
                            VStack (alignment: .leading) {
                                Text(title)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7))
//                                    .padding(.bottom, 20)
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow.opacity(0.9))
                                    Text(String(format: "%.1f", star))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.8, green: 0.6, blue: 0.7, opacity: 0.7))
//                                        .padding(.top, 1)
                                }
//                                .padding(.bottom, 40)
                                
                                HStack {
                                    Text("$\(price)")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.8, green: 0.5, blue: 0.1))
                                    
                                    Spacer()
                                    
                                    Button {
                                        print("push\(documents[index].reference)")
                                        documents[index].reference.delete { error in
                                            if let error = error {
                                                print("Error deleting document: \(error)")
                                            } else {
                                                print("Document successfully deleted.")
                                                fetchDocuments()
                                            }
                                        }
                                    } label: {
                                        Image(systemName: "minus")
                                            .foregroundColor(.white)
                                            .padding(.all, 8)
                                            .padding(.top, 7)
                                            .padding(.bottom, 7)
                                            .background(Color(red: 0.8, green: 0.6, blue: 0.7, opacity: 0.9))
                                            .cornerRadius(100)
                                    }
                                }
                            }
                            .padding(.all, 20)
                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            .padding()
            .padding(.leading, 5)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.03), radius: 15)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
        }
        .onAppear {
            fetchDocuments()
        }
    }
    
    private func fetchDocuments() {
        let db = Firestore.firestore()
        db.collection("cart").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }
            
            self.documents = documents
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
