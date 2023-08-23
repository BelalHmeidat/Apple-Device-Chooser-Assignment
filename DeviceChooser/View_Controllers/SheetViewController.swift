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

struct ButtonsSize{
    static let buttonWidth = 250
    static let buttonHeight = 50
}



class SheetViewController: UIViewController {
    
    private var products : [Product] = [
        Product(name: "iPhone", image: UIImage(named: "iPhone.jpg")!, icon: UIImage(systemName: "iphone")!, color: UIColor(named: "iPhoneColor")!),
        Product(name: "iPad", image: UIImage(named: "iPad.jpeg")!, icon: UIImage(systemName: "ipad.gen1")!, color: UIColor(named: "iPadColor")!),
        Product(name: "Macbook", image: UIImage(named: "Macbook.jpg")!, icon: UIImage(systemName: "laptopcomputer")!, color: UIColor(named: "MacColor")!)
    ]

    
    
    weak var delegate: SheetViewControllerDelegate?
    
    
    override func viewDidLoad() {
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
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(space)),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: CGFloat(ButtonsSize.buttonWidth)),
            button.heightAnchor.constraint(equalToConstant: CGFloat(ButtonsSize.buttonHeight))
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


