//
//  ItemDetail.swift
//  iDine
//
//  Created by Геннадий Ведерников on 21.05.2022.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem
    @EnvironmentObject var order: Order
    @State private var alertFavoritesAction = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .background(.black)
                    .padding(4)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            
            Button("Add to Favorites this") {
                if order.itemsFavorites.contains(item) {
                    alertFavoritesAction = true
                } else {
                    order.addFavorites(item: item)
                }
            }
            .font(.headline)
            .alert(isPresented: $alertFavoritesAction) {
                Alert(title: Text("Данный элемент уже добавлен в избранное"))
            }
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            
            Button("Order this") {
                order.addOrder(item: item)
            }
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
