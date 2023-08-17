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

class Product {
    var name : String
    var image : UIImage
    var icon : UIImage
    var color : UIColor
    
    init(name: String, image: UIImage, icon: UIImage, color: UIColor) {
        self.name = name
        self.image = image
        self.icon = icon
        self.color = color
    }
    
    
}


class SheetViewController: UIViewController {
    
    
    
    
    var iPhone = Product(name: "iPhone", image: UIImage(named: "iPhone.jpg")!, icon: UIImage(systemName: "iphone")!, color: UIColor(named: "iPhoneColor")!)
    var iPad = Product(name: "iPad", image: UIImage(named: "iPad.jpeg")!, icon: UIImage(systemName: "ipad.gen1")!, color: UIColor(named: "iPadColor")!)
    var macbook = Product(name: "Macbook", image: UIImage(named: "Macbook.jpg")!, icon: UIImage(systemName: "laptopcomputer")!, color: UIColor(named: "MacColor")!)
    
//    enum Product {
//        case iPhone
//        case iPad
//        case macbook
//
//        var name: String {
//            switch self {
//            case .iPhone:
//                return "iPhone"
//            case .iPad:
//                return "iPad"
//            case .macbook:
//                return "Macbook"
//            }
//        }
//        var image : UIImage{
//            switch self{
//            case .iPhone :
//                return UIImage(named: "iPhone.jpg")!
//            case .iPad :
//                return UIImage(named: "iPad.jpeg")!
//            case .macbook :
//                return UIImage(named: "Macbook.jpg")!
//            }
//        }
//        var icon : UIImage {
//            switch self {
//            case .iPhone :
//                return UIImage(systemName: "iphone")!
//            case .iPad :
//                return UIImage(systemName: "ipad.gen1")!
//            case .macbook:
//                return UIImage(systemName: "laptopcomputer")!
//            }
//
//        }
//        var color : UIColor {
//            switch self{
//            case .iPhone :
//                return UIColor(named: "iPhoneColor")!
//
//            case .iPad :
//                return UIColor(named: "iPadColor")!
//            case .macbook :
//                return UIColor(named: "MacColor")!
//            }
//        }
//
//        var action : Selector{
//            switch self {
//            case .iPhone :
//                return #selector(iphoneButtonAction)
//
//            case .iPad :
//                return #selector(ipadButtonAction)
//            case .macbook :
//                return #selector(macButtonAction)
//            }
//        }
//
//    var products : [Product] = [.iPhone, .iPad, .macbook]
    var products : [Product] = []
    
    
    weak var delegate: SheetViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let iPhone = Product(name: "iPhone", image: UIImage(named: "iPhone.jpg")!, icon: UIImage(systemName: "iphone")!, color: UIColor(named: "iPhoneColor")!)
        let iPad = Product(name: "iPad", image: UIImage(named: "iPad.jpeg")!, icon: UIImage(systemName: "ipad.gen1")!, color: UIColor(named: "iPadColor")!)
        let macbook = Product(name: "Macbook", image: UIImage(named: "Macbook.jpg")!, icon: UIImage(systemName: "laptopcomputer")!, color: UIColor(named: "MacColor")!)
        products = [iPhone, iPad, macbook]
        view.backgroundColor = .white
        createAllButtons()
        
    }
    
    func createAllButtons(){
        var i = 1
        for product in products{
            let bt = makeButton(product: product, index: i)
            view.addSubview(bt)
            layoutButton(button: bt, space: CGFloat(100 * i))
            bt.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            i+=1
        }
    }
    
    func makeButton(product: Product, index: Int) -> UIButton{
        let button = TintedButton(title: product.name, icon: product.icon, bgColor: product.color, index: index)
        
        
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
    
    
    @objc func buttonClicked(_ sender: TintedButton){
        switch sender.index {
        case 1:
            delegate?.didSelectOption(image:iPhone.image, labelText: iPhone.name)
        case 2:
            delegate?.didSelectOption(image: iPad.image, labelText: iPad.name)
        case 3:
            delegate?.didSelectOption(image: macbook.image, labelText: macbook.name)
        default:
            break
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}


