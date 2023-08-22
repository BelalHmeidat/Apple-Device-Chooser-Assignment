//
//  ViewController.swift
//  DeviceChooser
//
//  Created by Belal Hmeidat on 8/6/23.
//

import UIKit


// the main view contoller with a changing image, label, and fixed products button
class MainViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    //show the products sheet when the button is clicked
    @IBAction func showSheet(_ sender: UIButton) {
        showMyViewControllerInACustomizedSheet()
    }
    //view desgined in storyboard
    override func viewDidLoad() {
        super.viewDidLoad()
        // giving an icon to the button
        button.setImage(UIImage(systemName: "apple.logo"), for: .normal)
    }
    
    
    
    // creating a sheetview that will have the products buttons and presenting it
    func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = SheetViewController()
        viewControllerToPresent.delegate = self //binding the delegate of the sheet controller to this
        viewControllerToPresent.modalPresentationStyle = .pageSheet // setting the style of the view to sheet
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium(), .large()] //adding the medium detent so he sheet can be shown half way in the screen and can be expanded
            sheet.prefersGrabberVisible = true // indicator to helo expand the sheet

        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}

//extension for the delegate
extension MainViewController: SheetViewControllerDelegate {
    func didSelectOption(image: UIImage, labelText: String) {
        imageView.image = image
        label.text = labelText
    }
}


