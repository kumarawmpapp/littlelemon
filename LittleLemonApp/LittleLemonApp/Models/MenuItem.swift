//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import Foundation


struct MenuItem: Codable, Hashable, Identifiable {
    let id : Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category:String
} 
