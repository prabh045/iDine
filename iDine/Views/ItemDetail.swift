//
//  ItemDetail.swift
//  iDine
//
//  Created by Prabhdeep Singh on 16/01/21.
//  Copyright © 2021 Phoenix. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    //similar to implicitly unwrapped optionals
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorites
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Credits: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Add to Orders") {
                self.order.add(item: self.item)
            }
            .font(.headline)
            .padding(10)
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(7)
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing: Image(systemName: "heart.fill").onTapGesture {
            print("\(self.item.name) added to favs")
            self.favorite.favItems.append(self.item)
        })
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let favorite = Favorites()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
                .environmentObject(favorite)
        }
    }
}
