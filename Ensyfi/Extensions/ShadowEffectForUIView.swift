//
//  ShadowEffectForUIView.swift
//  Constituent
//
//  Created by Happy Sanz Tech on 15/06/20.
//  Copyright © 2020 HappySanzTech. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
extension UIView {
     // Shadow
     @IBInspectable var shadow: Bool {
          get {
               return layer.shadowOpacity > 0.0
          }
          set {
               if newValue == true {
                    self.addShadow()
               }
          }
     }

     fileprivate func addShadow(shadowColor: CGColor = UIColor.black.cgColor, shadowOffset: CGSize = CGSize(width: 3.0, height: 3.0), shadowOpacity: Float = 0.35, shadowRadius: CGFloat = 5.0) {
          let layer = self.layer
          layer.masksToBounds = false

          layer.shadowColor = shadowColor
          layer.shadowOffset = shadowOffset
          layer.shadowRadius = shadowRadius
          layer.shadowOpacity = shadowOpacity
          layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath

          let backgroundColor = self.backgroundColor?.cgColor
          self.backgroundColor = nil
          layer.backgroundColor =  backgroundColor
     }


     // Corner radius
     @IBInspectable var circle: Bool {
          get {
               return layer.cornerRadius == self.bounds.width*0.5
          }
          set {
               if newValue == true {
                    self.cornerRadius = self.bounds.width*0.5
               }
          }
     }

     @IBInspectable var cornerRadius: CGFloat {
          get {
               return self.layer.cornerRadius
          }

          set {
               self.layer.cornerRadius = newValue
          }
     }


     // Borders
     // Border width
     @IBInspectable
     public var borderWidth: CGFloat {
          set {
               layer.borderWidth = newValue
          }

          get {
               return layer.borderWidth
          }
     }

     // Border color
     @IBInspectable
     public var borderColor: UIColor? {
          set {
               layer.borderColor = newValue?.cgColor
          }

          get {
               if let borderColor = layer.borderColor {
                    return UIColor(cgColor: borderColor)
               }
               return nil
          }
     }
}

extension UIView {
    
    func dropShadow() {
        // drop shadow
//        layer.shadowColor = UIColor.darkGray.cgColor
//        layer.shadowOpacity = 0.6
//        layer.shadowRadius = 2.0
//        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 5.0

        // Set masksToBounds to false, otherwise the shadow
        // will be clipped and will not appear outside of
        // the view’s frame
        layer.masksToBounds = false
    }
}
