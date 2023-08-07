//
//  SheetViewController.swift
//  DeviceChooser
//
//  Created by Belal Hmeidat on 8/7/23.
//

import UIKit


protocol SheetViewControllerDelegate: AnyObject {
    func didSelectOption(image: UIImage, labelText: String)
}

class SheetViewController: UIViewController {
    var buttonCount = 0 // used to place the first button placed in the center of the view. Reset are placed relative to the button before
    weak var delegate: SheetViewControllerDelegate?
    
    var iphoneButton = TintedButton(title: "  iPhone", icon: "iphone", bgColor: .systemBlue)
    var ipadButton = TintedButton(title: "  iPad", icon: "ipad.gen1", bgColor: .systemTeal)
    var macButton = TintedButton(title: "  Macbook", icon: "laptopcomputer", bgColor: .systemIndigo)
    
    let distanceBetweenButtons = 30
    let btWidth = 250
    let btHeight = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(iphoneButton)
        layoutButton(button: iphoneButton)
        addFuncToButton(button: iphoneButton, action: #selector(iphoneButtonAction))
    
        view.addSubview(ipadButton)
        layoutButton(button: ipadButton)
        addFuncToButton(button: ipadButton, action: #selector(ipadButtonAction))
        
        view.addSubview(macButton)
        layoutButton(button: macButton)
        addFuncToButton(button: macButton, action: #selector(macButtonAction))

        
        
        
    
    }

    func makeButton(name : String, color : UIColor) -> UIButton{
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(name, for: .normal)
        button.backgroundColor = color

        
        return button
    }
    
    func layoutButton(button : UIButton){
        
        if buttonCount == 0{
            
            NSLayoutConstraint.activate([
                            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                            button.widthAnchor.constraint(equalToConstant: CGFloat(btWidth)),
                            button.heightAnchor.constraint(equalToConstant: CGFloat(btHeight))
            ])
        }
        else {
            let topAnchorElement : AnyObject = TintedButton.buttons[buttonCount-1]
            NSLayoutConstraint.activate([
                
                button.topAnchor.constraint(equalTo: (topAnchorElement.bottomAnchor) as NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat(distanceBetweenButtons)),                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.widthAnchor.constraint(equalToConstant: CGFloat(btWidth)),
                button.heightAnchor.constraint(equalToConstant: CGFloat(btHeight))
            ])
            
        }
        buttonCount += 1
    }
    
    func addFuncToButton(button: UIButton, action: Selector){
        button.addTarget(self, action: action, for: .touchUpInside)

    }


    @objc func iphoneButtonAction(_ sender: UIButton){
        guard let image = UIImage(named: "iphonex_front_back_glass_big.jpg.large.jpg") else {return}
        delegate?.didSelectOption(image: image, labelText: "iPhone")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func ipadButtonAction(_ sender: UIButton){
        guard let image = UIImage(named: "g4SGRalYN2leGXDf.medium.jpg") else {return}
        delegate?.didSelectOption(image: image, labelText: "iPad")
        dismiss(animated: true, completion: nil)
    }
    
    @objc func macButtonAction(_ sender: UIButton){
        guard let image = UIImage(named: "macbook-2048px-9765.jpg") else {return}
        delegate?.didSelectOption(image: image, labelText: "Macbook")
        dismiss(animated: true, completion: nil)
    }

    
}
