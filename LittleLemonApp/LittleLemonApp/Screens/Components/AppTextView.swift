//
//  AppTextView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct AppTextView: View {
    let label:String
    var value:Binding<String>
    var iconName:String
    var onTapAction:() -> Void
    init(label: String, value: Binding<String>,iconName:String = "",onTapAction:@escaping () -> Void = {}) {
        self.label = label
        self.value = value
        self.iconName = iconName
        self.onTapAction = onTapAction
    }
    var body: some View {
        HStack{
            if(!iconName.isEmpty){
                Image(systemName: iconName)
            }
            TextField(label, text: value)
                .onChange(of: value.wrappedValue) { newValue in
                onTapAction()
            }
        }
            .padding()
            .background(Color.secondaryWhite)
            .cornerRadius(6)
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
    }
}
