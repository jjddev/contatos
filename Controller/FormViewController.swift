//
//  FormViewController.swift
//  contatos
//
//  Created by PUCPR on 18/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var vNome: UITextField!
    
    var contatoViewModel : ContatoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func salvar(_ sender: Any) {
        let c = contatoViewModel!.novoContato()
        c.nome = vNome.text!
        contatoViewModel!.save(c)
        
        print("salvou")
        
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
