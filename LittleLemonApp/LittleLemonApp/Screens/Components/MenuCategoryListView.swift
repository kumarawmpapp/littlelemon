//
//  MenuCategoryListView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct MenuCategoryItem:View {
    let title:String
    let isSelected:Bool
    
    init(title: String,isSelected:Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
    var body: some View{
        Text(title)
            .bold()
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(isSelected ? Color.primaryBlue : Color.secondaryWhite)
            .cornerRadius(30)
            .foregroundColor(isSelected ? Color.secondaryWhite : Color.primaryBlue)
    }
}
