//
//  FavoritesView.swift
//  iDine
//
//  Created by Геннадий Ведерников on 23.05.2022.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.itemsFavorites) { item in
                        HStack {
                            Image(item.thumbnailImage)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.gray, lineWidth: 2))
                            Text(item.name)
                                .font(.headline)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteFavoriteItems)
                }
            }
            .navigationTitle("Favorites")
            .listStyle(.insetGrouped)
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteFavoriteItems(at offsets: IndexSet) {
        order.itemsFavorites.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(Order())
    }
}
