//
//  MainView.swift
//  iDine
//
//  Created by Геннадий Ведерников on 22.05.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Меню", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Заказ", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order())
    }
}
