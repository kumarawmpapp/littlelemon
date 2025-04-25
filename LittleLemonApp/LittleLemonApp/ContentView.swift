//
//  ContentView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Marzaki Title").font(.marKaziTitle)
            Text("Marzaki Sub Title").font(.marKaziSubTitle)
            Spacer()
            Text("Karla Lead Text").font(.karlaLeadText)
            Text("Karla Section Title").font(.karlaSectionTitle)
            Text("Karal Section Category").font(.karlaSectionCategory)
            Text("Karla Card Title").font(.karlaCardTitle)
            Text("Karla Paragraph").font(.karlaParagraph)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
