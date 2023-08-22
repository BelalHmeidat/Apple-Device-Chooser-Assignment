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

class SheetViewController: UIViewController {

    private var iPhone = Product(name: "iPhone", image: UIImage(named: "iPhone.jpg")!, icon: UIImage(systemName: "iphone")!, color: UIColor(named: "iPhoneColor")!)
    private var iPad = Product(name: "iPad", image: UIImage(named: "iPad.jpeg")!, icon: UIImage(systemName: "ipad.gen1")!, color: UIColor(named: "iPadColor")!)
    private var macbook = Product(name: "Macbook", image: UIImage(named: "Macbook.jpg")!, icon: UIImage(systemName: "laptopcomputer")!, color: UIColor(named: "MacColor")!)
    
    private var products : [Product] = []

    
    
    weak var delegate: SheetViewControllerDelegate?
    
    
    override func viewDidLoad() {
        products = [iPhone, iPad, macbook]
        super.viewDidLoad()
        view.backgroundColor = .white
        createAllButtons(products: products)
        
    }
    
    //creating a button instance for each product, specify layout, and and binding it to an action
    private func createAllButtons(products : [Product]){
        for (i, product) in products.enumerated(){
            let bt = createButton(product: product, index: i) //creating an instance of TintedButton object for each product
            view.addSubview(bt)
            layoutButton(button: bt, space: CGFloat(100 * (i + 1))) //added 1 because i starts at 0
            bt.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside) //setting up button actions
        }
    }
    // creating an instance of TintedButton object
    private func createButton(product: Product, index: Int) -> UIButton{
        let button = TintedButton(title: product.name, icon: product.icon, bgColor: product.color, index: index)
        return button
    }
    
    //set the constraints for a button
    private func layoutButton(button : UIButton, space: CGFloat){
        let btWidth = 250
        let btHeight = 50
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(space)),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: CGFloat(btWidth)),
            button.heightAnchor.constraint(equalToConstant: CGFloat(btHeight))
        ])
    }
    
    // the action performed by the button
    // it passes the button label and the button icon to the delegate, the main view controller
    @objc private func buttonClicked(_ sender: TintedButton){
        let index = sender.index
        delegate?.didSelectOption(image:products[index].image, labelText: products[index].name)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}


