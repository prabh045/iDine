//
//  Favorites.swift
//  iDine
//
//  Created by Prabhdeep Singh on 18/01/21.
//  Copyright © 2021 Phoenix. All rights reserved.
//

import Foundation

class Favorites: ObservableObject {
    @Published var favItems: [MenuItem] = []
}
