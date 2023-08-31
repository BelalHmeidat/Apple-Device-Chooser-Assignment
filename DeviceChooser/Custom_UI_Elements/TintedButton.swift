//
//  SheetViewController.swift
//  DeviceChooser
//
//  Created by Belal Hmeidat on 8/7/23.
//



import UIKit
//custom class to make UIButton tinted and is created with an index to be used in setting button actions
class TintedButton: UIButton{
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let index : Int //to identify buttons for actions
    
    init(title: String, icon: UIImage, bgColor: UIColor, index : Int ){
        self.index = index
        super.init(frame: .zero)
        self.frame = CGRect(x: 100, y: 200, width: 200, height: 50) //icon gets broken without this
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 8
        self.setTitleColor(bgColor, for: .normal)
        self.backgroundColor = bgColor.withAlphaComponent(0.1) //same as title color but lighter (adjusted using alpha)
        self.setImage(icon, for: .normal)
        self.tintColor = bgColor //needed to make the icon tinted otherwise it will be default color
        translatesAutoresizingMaskIntoConstraints = false //constraints will be manually set
    }
    

    
}
