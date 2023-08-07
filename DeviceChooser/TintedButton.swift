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
    
    static var buttons : [UIButton] = []
    
    init(title: String, icon: String, bgColor: UIColor ){
        super.init(frame: .zero)
        configuration = .tinted()
        configuration?.title = title
        configuration?.image = UIImage(systemName: icon)
        configuration?.baseBackgroundColor = bgColor
        configuration?.baseForegroundColor = bgColor
        configuration?.cornerStyle = .small
        translatesAutoresizingMaskIntoConstraints = false
        TintedButton.buttons.append(self)
    }
    
}
