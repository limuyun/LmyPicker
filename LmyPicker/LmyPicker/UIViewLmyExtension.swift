//
//  UIViewLmyExtension.swift
//  limuyun
//
//  Created by limuyun on 2016/12/19.
//  Copyright © 2016年 biiway. All rights reserved.
//

import UIKit

public extension UIView {
    
    var x : CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y : CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var width : CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height : CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var origin : CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
}
public extension UIView {
    
    var top : CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    var left : CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }
    
    var bottom : CGFloat {
        get {
            return self.y + self.height
        }
        set {
            self.y = newValue - self.height
        }
    }
    
    var right : CGFloat {
        get {
            return self.x + self.width
        }
        set {
            self.x = newValue - self.width
        }
    }
    
    var centerX : CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY : CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    /// 获取响应链上的UIViewController
    ///
    /// - Returns: UIViewController?
    func viewController_lmy() -> UIViewController?{
        var responder:UIResponder? = self.next
        while responder != nil {
            if (responder?.isKind(of: UIViewController.self)) == true {
                let con = responder as? UIViewController
                return con
            }else {
                responder = responder?.next
            }
        }
        return nil
    }
}

public extension UIScreen {

    public class var width : CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    public class var height : CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    
}
