import SwiftUI

extension Color{
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    //Primary Colors
    static let primaryBlue = Color(hex: 0xF495E57)
    static let primaryYellow = Color(hex: 0xFF4CE14)
    
    //Secondary Colors
    static let secondaryDarkOrange = Color(hex: 0xFEE9972)
    static let secondaryLightOrange = Color(hex: 0xFFBDABB)
    static let secondaryWhite = Color(hex: 0xFEDEFEE)
    static let secondaryBlack = Color(hex: 0xF333333)
}
