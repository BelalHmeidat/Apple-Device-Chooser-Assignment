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
    
//    static var products : [Product] = []
    static var indexes : [Int] = []
    
    let index : Int
    
    init(title: String, icon: UIImage, bgColor: UIColor, index : Int ){
        self.index = index
        super.init(frame: .zero)
        configuration = .tinted()
        configuration?.title = title
        configuration?.image = icon
        configuration?.baseBackgroundColor = bgColor
        configuration?.baseForegroundColor = bgColor
        configuration?.cornerStyle = .small
        translatesAutoresizingMaskIntoConstraints = false
//        self.tintColor = bgColor
//        self.setTitle(title, for: .normal)
        
//        TintedButton.buttons.append(self)
        
    }
    

    
}
