//
//  SheetViewController.swift
//  DeviceChooser
//
//  Created by Belal Hmeidat on 8/7/23.
//



import UIKit

class TintedButton: UIButton{
// not neccessary?
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        configure()
//    }
//
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let index : Int
    
    init(title: String, icon: UIImage, bgColor: UIColor, index : Int ){
        self.index = index
        super.init(frame: .zero)
        self.tintColor = bgColor
        self.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 8

//        configuration = .tinted()
//        configuration?.title = title
//        configuration?.image = icon
//        configuration?.baseBackgroundColor = bgColor
//        configuration?.baseForegroundColor = bgColor
//        configuration?.cornerStyle = .small
        translatesAutoresizingMaskIntoConstraints = false
        
//        TintedButton.buttons.append(self)
        
    }
    

    
}
