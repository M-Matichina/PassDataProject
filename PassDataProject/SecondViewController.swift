//
//  SecondViewController.swift
//  PassDataProject
//
//  Created by Мария Матичина on 3/16/20.
//  Copyright © 2020 Мария Матичина. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // пердать данные loginTF на SecondViewController, но в @IBOutlet weak var label: UILabel! мы не можем передать данные, для этого создадим var
    var login: String! // ! гарантирует до того как мы будем использовать var login, у нас уже будет там значение  
    @IBOutlet weak var label: UILabel!
    
    @IBAction func sendPressed(button: UIButton) { // чтобы отработал "undwindSegue", переходим в SecondViewController
        performSegue(withIdentifier: "unwindSegue", sender: nil)
        //self.dismiss(animated: true, completion: nil) // 2 вариант
    }
    
    // получить уведомление
    override func viewDidLoad() { // базовый метод, отрабатывет, когда загружается наш View, View - загрузился и что мы делаем - print(login)
        super.viewDidLoad()
        
        guard let login = login else {return}
        label.text = "Hello, \(login)"
    }
}

