//
//  ViewControllerPassword.swift
//  gerar senha
//
//  Created by Frederyk Antunnes on 14/03/20.
//  Copyright © 2020 Frederyk Antunnes. All rights reserved.
//

import UIKit

class ViewControllerPassword: UIViewController {

    var numberOfCharacters: Int = 10 // default se usuario nao enviar
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialLetters: useSpecialCharacters)
        
        gerar()
        
    }
    
    
    @IBAction func gerarSenha(_ sender: Any) {
         gerar()
                
    }
    

    
    func gerar(){
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        
                           tvPasswords.text = "" // limpa a view
                    // Do any additional setup after loading the view.
            let passwords = passwordGenerator.generate(total: numberOfPasswords)
                    for password in passwords {
                         tvPasswords.text.append(password + "\n\n")
                    }
           
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
