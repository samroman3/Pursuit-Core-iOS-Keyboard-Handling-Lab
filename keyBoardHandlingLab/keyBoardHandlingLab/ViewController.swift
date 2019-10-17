//
//  ViewController.swift
//  keyBoardHandlingLab
//
//  Created by Sam Roman on 10/17/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    configureScrollView()
    NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardAppearing(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDisappearing(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
    
    //MARK: NotificationCenter Methods
   @objc func handleKeyboardAppearing(sender: Notification) {
        guard let infoDict = sender.userInfo else { return }
        guard let rectValue = infoDict["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
        print("The keyboard is \(rectValue.height) by \(rectValue.width)")
    scrollView.frame.origin.y = -150
    }
    
    @objc func handleKeyboardDisappearing(sender: Notification) {
        guard let infoDict = sender.userInfo else { return }
        guard let rectValue = infoDict["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
        print("The keyboard is \(rectValue.height) by \(rectValue.width)")
    scrollView.frame.origin.y = 150
    }
    
    
    
    
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
 


}

