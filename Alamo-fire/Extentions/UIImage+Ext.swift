//
//  UIImage+Ext.swift
//  Alamo-fire
//
//  Created by Abhilash k George on 23/05/22.
//

import Foundation
import UIKit


extension UIImage {
    
    enum AssetImages: String {
        case home = "home"
        case favorite = "favorite"
        case qr = "qr"
        case alarm = "alarm"
        case profile = "face"
        case headset = "headset"
    }
    
    var isPortrait:  Bool    { size.height > size.width }
    var isLandscape: Bool    { size.width > size.height }
    var breadth:     CGFloat { min(size.width, size.height) }
    var breadthSize: CGSize  { .init(width: breadth, height: breadth) }
    var breadthRect: CGRect  { .init(origin: .zero, size: breadthSize) }
    var circleMasked: UIImage? {
        guard let cgImage = cgImage?
                .cropping(to: .init(origin: .init(x: isLandscape ? ((size.width-size.height)/2).rounded(.down) : 0,
                                                  y: isPortrait  ? ((size.height-size.width)/2).rounded(.down) : 0),
                                    size: breadthSize)) else { return nil }
        let format = imageRendererFormat
        format.opaque = false
        return UIGraphicsImageRenderer(size: breadthSize, format: format).image { _ in
            UIBezierPath(ovalIn: breadthRect).addClip()
            UIImage(cgImage: cgImage, scale: format.scale, orientation: imageOrientation)
                .draw(in: .init(origin: .zero, size: breadthSize))
        }
    }
   
    public func image(withTintColor color: UIColor) -> UIImage{
           UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
           let context: CGContext = UIGraphicsGetCurrentContext()!
           context.translateBy(x: 0, y: self.size.height)
           context.scaleBy(x: 1.0, y: -1.0)
           context.setBlendMode(CGBlendMode.normal)
           let rect: CGRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
           context.clip(to: rect, mask: self.cgImage!)
           color.setFill()
           context.fill(rect)
           let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           return newImage
       }
    
}
