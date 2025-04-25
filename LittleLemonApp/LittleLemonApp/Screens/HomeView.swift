//
//  HomeView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var isMenuScreen:Bool = true
    
    var body: some View {
        Section{
            if isMenuScreen{
                MenuView()
            }
            else{
                UserProfile(backAction:{
                    isMenuScreen = true
                })
            }
        }.navigationBarTitleDisplayMode(.inline)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
            //.background(Color.secondaryWhite)
            .toolbar {
                if !isMenuScreen
                {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isMenuScreen = true
                        } label: {
                            Image(systemName: "arrow.backward.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.primaryBlue)
                        }

                    }
                }
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isMenuScreen = false
                    } label: {
                        Image("Profile").resizable().frame(width: 50,height: 50)
                    }

                }
            }.navigationBarBackButtonHidden(true)
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
