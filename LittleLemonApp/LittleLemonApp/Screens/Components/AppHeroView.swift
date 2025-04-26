//
//  AppHeroView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

let heroTitle = "Little Lemon"
let heroAddress = "Chicago"
let heroDesc = "We are a family owned Mediterranen restaurant, focused on traditional recipes served with a modern twist"

struct AppHeroView: View{
    let bottomView:AppTextView?
    
    init(bottomView: AppTextView?) {
        self.bottomView = bottomView
    }
    
    var body:some View{
        VStack{
            VStack(alignment: .leading){
                Text(heroTitle).font(.marKaziSubTitle).foregroundStyle(Color.primaryYellow)
                Text(heroAddress).font(.karlaSectionTitle).foregroundColor(Color.secondaryWhite)
                HStack{
                    Text(heroDesc)
                        .font(.karlaParagraph)
                        .foregroundColor(Color.secondaryWhite)
                        .fixedSize(horizontal: false, vertical: true)
                    Image("Hero image").resizable().frame(width: 130,height: 150)
                        .cornerRadius(10)
                }
            }
            bottomView
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10))
        .background(Color.primaryBlue)
    }
}
