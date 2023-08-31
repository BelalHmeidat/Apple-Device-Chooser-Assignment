//
//  Product.swift
//  DeviceChooser
//
//  Created by Belal Hmeidat on 8/24/23.
//

//import Foundation
import UIKit


struct Product {
    private var _name : String
    private var _image : UIImage
    private var _icon : UIImage
    private var _color : UIColor
    
    init(name: String, image: UIImage, icon: UIImage, color: UIColor) {
        self._name = name
        self._image = image
        self._color = color
        self._icon = icon
    }
        var name : String {
            get {
                return self._name
            }
        }
        var image : UIImage {
            get {
                return self._image
            }
        }
        var icon : UIImage {
            get {
                return self._icon
            }
        }
        var color : UIColor {
            get {
                return self._color
            }
        }
}
