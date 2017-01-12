//
//  UIColorLmyExtension.swift
//  limuyun
//
//  Created by limuyun on 2016/12/20.
//  Copyright © 2016年 biiway. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// RGB颜色
    ///
    /// - Parameters:
    ///   - r: red  0-255
    ///   - g: green 0-255
    ///   - b: blue 0-255
    /// - Returns: UIColor
    class func RGB (_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return self.RGBA(r, g, b, 1)
    }
    
    class func RGBA (_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat) -> UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    /// 16进制颜色字符串转换成RGB颜色
    ///
    /// - Parameter colorStr: String? ,16进制颜色值:(例"9B30FF" 或 "#9B30FF")
    /// - Returns: UIColor
    class func color_fromHexColorString(_ colorStr:String?) -> UIColor {
        return self.color_fromHexColorString(colorStr, alpha: 1)
    }
    class func color_fromHexColorString(_ colorStr:String?, alpha: CGFloat) -> UIColor {
        
        if let color_str = colorStr {
            var color = UIColor.red
            var cStr : String = color_str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
            
            if cStr.hasPrefix("#") {
                let index = cStr.index(after: cStr.startIndex)
                cStr = cStr.substring(from: index)
            }
            if cStr.characters.count != 6 {
                return UIColor.black
            }
            
            let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
            let rStr = cStr.substring(with: rRange)
            
            let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
            let gStr = cStr.substring(with: gRange)
            
            let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
            let bStr = cStr.substring(from: bIndex)
            
            var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
            Scanner(string: rStr).scanHexInt32(&r)
            Scanner(string: gStr).scanHexInt32(&g)
            Scanner(string: bStr).scanHexInt32(&b)
            
            color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
            
            return color
        }
        return UIColor.black
    }
    
}
