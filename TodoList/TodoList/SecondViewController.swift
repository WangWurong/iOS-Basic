//
//  SecondViewController.swift
//  TodoList
//
//  Created by 大兔子殿下 on 1/5/19.
//  Copyright © 2019 大兔子殿下. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var itemTextField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        // store the permanent value
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]
        
        // add or create a new array
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemTextField.text!)
        } else {
            items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        
        // reset the text field
        itemTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

