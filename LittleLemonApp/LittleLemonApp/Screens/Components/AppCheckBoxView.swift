//
//  AppCheckBox.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {

            configuration.isOn.toggle()

        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")

                configuration.label
            }.foregroundColor(.primaryBlue)
        })
    }
}
