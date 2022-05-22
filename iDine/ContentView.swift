//
//  ContentView.swift
//  iDine
//
//  Created by Геннадий Ведерников on 21.05.2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        
        NavigationView {
            
        List {
            ForEach(menu) { selection in
                Section(header: Text(selection.name)) {
                ForEach(selection.items) { item in
                    NavigationLink(destination: ItemDetail(item: item)) {
                    ItemRow(item: item)
                    }
                }
                }
            }
            
        }.navigationTitle("Menu")
        .listStyle(.grouped)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
