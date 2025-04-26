//
//  DishDetailView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct DishDetailView: View {
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight:300, maxHeight:300)
                            .foregroundColor(.secondaryBlack)
                    }
                )
                Text("$ \(dish.price ?? "")")
                    .fontWeight(.heavy)
                    .font(.karlaLeadText)
                    .foregroundColor(.primaryBlue)
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                Text("\(dish.desc ?? "")")
                    .lineLimit(2)
                    .fontWeight(.light)
                    .font(.karlaParagraph)
                    .foregroundColor(.primaryBlue)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(dish.title ?? "")")
                            .font(.karlaLeadText)
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    }
                }
        }
    }
}

