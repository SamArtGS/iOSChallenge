//
//  Constraints.swift
//  TangoChallenge
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-05-28.
//

import UIKit

// MARK: UIColors from Coolors
/// These colors where gotten from coolors.co for a great user experience app.
/// I'm not an expert but some pages are: https://coolors.co/ccdbdc-9ad1d4-80ced7-007ea7-003249


extension UIColor{
    
    //MARK: PALLETE
    
    static let accent               = UIColor(named: "AccentColor"          )!
    static let accentSoft           = UIColor(named: "AccentColorSoft"      )!
    static let complementAccent     = UIColor(named: "AntiAcentColor"       )!
    static let bluePen              = UIColor(named: "BluePen"              )!
    static let emerald              = UIColor(named: "Emerald"              )!
    static let goldLemon            = UIColor(named: "GoldLemon"            )!
    static let magnolia             = UIColor(named: "Magnolia"             )!
    static let maximumRed           = UIColor(named: "MaximumRed"           )!
    static let orangeYellowCrayola  = UIColor(named: "OrangeYellowCrayola"  )!
    static let rioViolet            = UIColor(named: "RioViolet"            )!
    static let usafaBlue            = UIColor(named: "UsafaBlue"            )!
    
    
    // MARK: Convenience inits
    
    // HEX initializer
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    // Integers initializer
    convenience init(Red: Int, Green: Int, Blue: Int, Alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(Red/255),
                  green: CGFloat(Red/255),
                  blue: CGFloat(Red/255),
                  alpha: Alpha)
    }
}


