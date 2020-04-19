//
//  ViewController.swift
//  gerar senha
//
//  Created by Frederyk Antunnes on 14/03/20.
//  Copyright © 2020 Frederyk Antunnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let passwordsViewController = segue.destination as! ViewControllerPassword
        
        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        
        
        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
        
    }
    
    @IBAction func checkIsEnabled(_ sender: UISwitch) {
        if swNumbers.isOn || swCaptitalLetters.isOn  || swLetters.isOn || swSpecialCharacters.isOn {
            button.isEnabled = true
            button.alpha = 1
        }else{
         button.isEnabled = false
            button.alpha = 0.3
        }
    }

}

