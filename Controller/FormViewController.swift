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
        let contato = contatoViewModel?.getContato()
        vNome.text = contato?.nome
    }
    

    @IBAction func salvar(_ sender: Any) {
        let c = contatoViewModel!.getContato()
        c.nome = vNome.text!
        contatoViewModel!.save(c)
        self.navigationController?.popViewController(animated: true)
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
