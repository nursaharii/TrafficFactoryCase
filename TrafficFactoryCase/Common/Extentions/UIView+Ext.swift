//
//  UIView+Ext.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var bottomRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
            clipsToBounds = newValue > 0
            
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var topRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    func addShadow() {
        layer.shadowColor = UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 0.15).cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
        layer.shadowRadius = cornerRadius
        layer.masksToBounds = false
    }
}

