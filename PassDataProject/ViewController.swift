//
//  ViewController.swift
//  PassDataProject
//
//  Created by Мария Матичина on 3/13/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Пердать данные loginTF на SecondViewController, но в @IBOutlet weak var label: UILabel! мы не можем передать данные, для этого создадим var
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passowrdTF: UITextField!
    @IBOutlet weak var returnLabel: UILabel!
    
    // Здесь осуществляем переход
    @IBAction func sendPressed(button: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    //  Unwind Segue
    @IBAction func unwindToMainSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else {return} // чтобы отработал "undwindSegue", переходим в SecondViewController
        guard let svc = segue.source as? SecondViewController else {return}
        self.returnLabel.text = svc.label.text
        
        /*
         open var identifier: String? { get }
         open var source: UIViewController { get }  - для передачи данных со 2 экрана на 1
         open var destination: UIViewController { get } - для передачи данных с 1 экрана на 2
         */   
    }
    
    // Здесь готовим переход
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // когда касаемся экрана клавиатура должна уйти
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else {return} //  для обращения ко 2 View
        dvc.login = loginTF.text // хотим поместить в dvc.login, то что хранится в loginTF
        
    }
}
