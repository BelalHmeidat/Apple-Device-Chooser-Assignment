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
    enum Product {
        case iPhone
        case iPad
      case macbook
        
        var name: String {
            switch self {
            case .iPhone:
                return "iPhone"
            case .iPad:
                return "iPad"
            case .macbook:
                return "Macbook"
            }
        }
        var image : UIImage{
            switch self{
            case .iPhone :
                return UIImage(named: "iPhone.jpg")!
            case .iPad :
                return UIImage(named: "iPad.jpeg")!
            case .macbook :
                return UIImage(named: "Macbook.jpg")!
            }
        }
        var icon : UIImage {
            switch self {
            case .iPhone :
                return UIImage(systemName: "iphone")!
            case .iPad :
                return UIImage(systemName: "ipad.gen1")!
            case .macbook:
                return UIImage(systemName: "laptopcomputer")!
            }
        
        }
        
        var color : UIColor {
            switch self{
            case .iPhone :
                 return UIColor(named: "iPhoneColor")!
                
            case .iPad :
                return UIColor(named: "iPadColor")!
            case .macbook :
                return UIColor(named: "MacColor")!
            }
        }
        
        var action : Selector{
            switch self {
            case .iPhone :
                return #selector(iphoneButtonAction)
                
            case .iPad :
                return #selector(ipadButtonAction)
            case .macbook :
                return #selector(macButtonAction)
            }
        }
      
    }
    var products : [Product] = [.iPhone, .iPad, .macbook]
    
    
    weak var delegate: SheetViewControllerDelegate?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createAllButtons()

    }
    
    func createAllButtons(){
        var i = 1
        for product in products{
            let bt = makeButton(product: product)
            view.addSubview(bt)
            layoutButton(button: bt, space: CGFloat(100 * i))
            bt.addTarget(self, action: product.action, for: .touchUpInside)
            i+=1
        }
    }

    func makeButton(product: Product) -> UIButton{
//        let button = UIButton()
//        button.configuration = .tinted()
//        button.configuration?.title = product.name
//        button.configuration?.baseBackgroundColor = product.color
//        button.configuration?.baseForegroundColor = product.color
//        button.configuration?.image = product.icon
//        button.configuration?.cornerStyle = .small
//        button.translatesAutoresizingMaskIntoConstraints = false
        let button = TintedButton(title: product.name, icon: product.icon, bgColor: product.color)

        
        return button
    }
    
    
    func layoutButton(button : UIButton, space: CGFloat){
        let btWidth = 250
        let btHeight = 50
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(space)),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: CGFloat(btWidth)),
            button.heightAnchor.constraint(equalToConstant: CGFloat(btHeight))
        ])
    }
    
    

    @objc func iphoneButtonAction(_ sender: UIButton){
        delegate?.didSelectOption(image: Product.iPhone.image, labelText: Product.iPhone.name)
        dismiss(animated: true, completion: nil)
    
    }
    
    @objc func ipadButtonAction(_ sender: UIButton){
        delegate?.didSelectOption(image: Product.iPad.image, labelText: Product.iPad.name)
        dismiss(animated: true, completion: nil)
    

    }
    
    @objc func macButtonAction(_ sender: UIButton){
        delegate?.didSelectOption(image: Product.macbook.image, labelText: Product.macbook.name)
        dismiss(animated: true, completion: nil)
    

    }
    
    
// Doesn't work
//     @objc func buttonFunction(image : UIImage, text: String, _ sender : UIButton){
//        delegate?.didSelectOption(image: image, labelText: text)
//        dismiss(animated: true, completion: nil)
//    }
}

    
