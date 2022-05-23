//
//  MainView.swift
//  iDine
//
//  Created by Геннадий Ведерников on 22.05.2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            FavoritesView()
                .tabItem {
                    Label("Избранное", systemImage: "star.fill")
                }
                .tag(1)
            ContentView()
                .tabItem {
                    Label("Меню", systemImage: "list.dash")
                }
                .tag(2)
            OrderView()
                .badge(order.itemsOrder.count).animation(.easeInOut, value: 1)
                .tabItem {
                    Label("Заказ", systemImage: "square.and.pencil")
                }
                .tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
