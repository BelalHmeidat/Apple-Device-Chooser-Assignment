//
//  ViewController.swift
//  DeviceChooser
//
//  Created by Belal Hmeidat on 8/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    
    @IBOutlet var button: UIButton!
    @IBAction func showSheet(_ sender: UIButton) {
        showMyViewControllerInACustomizedSheet()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setImage(UIImage(systemName: "apple.logo"), for: .normal)
    }
    
    
    
    
    func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = SheetViewController()
        viewControllerToPresent.delegate = self
        viewControllerToPresent.modalPresentationStyle = .pageSheet
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true

        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}


    
extension ViewController: SheetViewControllerDelegate {
    func didSelectOption(image: UIImage, labelText: String) {
        imageView.image = image
        label.text = labelText
    }
}


