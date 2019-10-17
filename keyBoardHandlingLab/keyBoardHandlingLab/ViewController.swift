//
//  ViewController.swift
//  keyBoardHandlingLab
//
//  Created by Sam Roman on 10/17/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var userField: UITextField!
    
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    lazy var tappedScreenRecognizer: UITapGestureRecognizer = {
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureTapped(sender:)))
           
           return tapGesture
       }()

    @objc private func tapGestureTapped(sender: UIView) {
        passField.resignFirstResponder()
        userField.resignFirstResponder()
    }
          
    
    
    
    override func viewDidLoad() {
        userField.delegate = self
        passField.delegate = self
        view.addGestureRecognizer(tappedScreenRecognizer)
        super.viewDidLoad()
        configureScrollView()
        setUpKeyBoardObservers()
        
    }
    
    
    
    
    
    //MARK: NotificationCenter Methods
    
    
    private func setUpKeyBoardObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardAppearing(sender:)), name:   UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDisappearing(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   @objc func handleKeyboardAppearing(sender: Notification) {
        guard let infoDict = sender.userInfo else { return }
        guard let rectValue = infoDict["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
        print("The keyboard is \(rectValue.height) by \(rectValue.width)")
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        scrollView.frame.origin.y = -keyboardSize.height / 2
       }
    }
    
    @objc func handleKeyboardDisappearing(sender: Notification) {
        guard let infoDict = sender.userInfo else { return }
        guard let rectValue = infoDict["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
        print("The keyboard is \(rectValue.height) by \(rectValue.width)")
        scrollView.frame.origin.y = 0
    
    }
    
    
    
    
    
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
 


}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

