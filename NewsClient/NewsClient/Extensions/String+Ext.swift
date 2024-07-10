//
//  String+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation
import UIKit

extension String {
    func localized() -> String {
        if let appLanguage = DefaultManager.getAppLanguage() {
            if appLanguage == 1 {
                let path = Bundle.main.path(forResource: "uk", ofType: "lproj")
                let bundle = Bundle(path: path!)
                return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
            }
        }
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
    }
    
    func textToImage() -> UIImage? {
        let nsString = (self as NSString)
        //let font = UIFont.systemFont(ofSize: 1024) // you can change your font size here
        let font = UIFont.systemFont(ofSize: 17)
        let stringAttributes = [NSAttributedString.Key.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
        UIColor.clear.set() // clear background
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
        let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
        UIGraphicsEndImageContext() //  end image context

        return image ?? UIImage()
    }
}
