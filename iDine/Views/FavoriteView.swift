//
//  FavoriteView.swift
//  iDine
//
//  Created by Prabhdeep Singh on 18/01/21.
//  Copyright © 2021 Phoenix. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        List{
            Section(header: Text("Favorite Items")) {
                ForEach(favorites.favItems) { item in
                    ItemRow(item: item)
                }
            }
        }
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static let favourites = Favorites()
    static var previews: some View {
        FavoriteView().environmentObject(favourites)
    }
}
