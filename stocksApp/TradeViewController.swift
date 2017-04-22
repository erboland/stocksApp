//
//  TradeViewController.swift
//  stocks
//
//  Created by Robert Kim on 4/20/17.
//  Copyright © 2017 Octopus. All rights reserved.
//

import UIKit

class TradeViewController: UIViewController, NumbersKeyboardDelegate {

    @IBOutlet weak var numberTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.becomeFirstResponder()
        numberTextField.tintColor = UIColor(hex: StockEnum.mainColor.rawValue)
        
        let keyboardView = NumbersKeyboardView(frame: CGRect(x: 0, y: 0, width: 0, height: UIScreen.main.bounds.height * 0.4))
        keyboardView.delegate = self
        numberTextField.inputView = keyboardView

    }
    
    
    func keyWasTapped(character: String) {
        numberTextField.insertText(character)
    }
    
    func deleteKey(){
        numberTextField.deleteBackward()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
