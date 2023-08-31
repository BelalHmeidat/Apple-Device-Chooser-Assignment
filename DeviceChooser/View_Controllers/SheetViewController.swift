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
        Product(name: "Macbook", image: UIImage(named: "Macbook.jpg")!, icon: UIImage(systemName: "laptopcomputer")!, color: UIColor(named: "macColor")!)
    ]
    
    weak var delegate: SheetViewControllerDelegate?
    
    private let buttonsStack : UIStackView = {
        var buttonsStack = UIStackView()
        buttonsStack.spacing = 40
        buttonsStack.axis = .vertical
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        return buttonsStack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createAllButtons(products: products)
    }
    
    //creating a button instance for each product, specify layout, and and binding it to an action
    private func createAllButtons(products : [Product]){
        for (i, product) in products.enumerated(){
            let bt = createButton(product: product, index: i) //creating an instance of TintedButton object for each product
            layoutButton(button: bt)
            bt.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside) //setting up button actions
            buttonsStack.addArrangedSubview(bt)
        }
        
        view.addSubview(buttonsStack)
        layoutButtonStack()
    }
    
    private func layoutButtonStack(){
        NSLayoutConstraint.activate([
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ]
        )
    }
    
    // creating an instance of TintedButton object
    private func createButton(product: Product, index: Int) -> UIButton{
        let button = TintedButton(title: product.name, icon: product.icon, bgColor: product.color, index: index)
        return button
    }
    //set the constraints for button in the stackview
    private func layoutButton(button : UIButton){
        
        NSLayoutConstraint.activate([
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


