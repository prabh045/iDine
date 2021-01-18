//
//  AppView.swift
//  iDine
//
//  Created by Prabhdeep Singh on 17/01/21.
//  Copyright © 2021 Phoenix. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
