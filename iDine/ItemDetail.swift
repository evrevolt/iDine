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
            
            Button("Order this") {
                order.addOrder(item: item)
            }
            .font(.headline)
            
            Button("Favorites this") {
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
