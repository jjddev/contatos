//
//  FormViewController.swift
//  contatos
//
//  Created by PUCPR on 18/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var vNome: UITextField!
    @IBOutlet weak var vSite: UITextField!
    @IBOutlet weak var vTableTelefones: UITableView!
    
    var contatoViewModel : ContatoViewModel?
    var contato: Contato!
    var telefones = [Telefone]()

    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCells()
        vTableTelefones.dataSource = self
        vTableTelefones.delegate = self
        
        
        contato = contatoViewModel!.getContato()
        
        if telefones.count == 0 {
            telefones.append(contatoViewModel!.novoTelefone())
        }else{
            for item in contato!.telefones!.allObjects as! [Telefone] {
                telefones.append(item)
            }
        }
        
        print("did: \(telefones[0].numero)")

        vNome.text = contato.nome
        vSite.text = contato.site
    }

    func registerTableViewCells(){
        let textFieldCell = UINib(nibName: "TelefoneCell", bundle: nil)
        vTableTelefones.register(textFieldCell, forCellReuseIdentifier: "cell")
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return telefones.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TelefoneCell
        
        //cell.textField.text = telefones[indexPath.row]
        
        
        //print(contato.telefones!.count)
        
        print("criando celula \(telefones[indexPath.row].numero)")
       
        cell.textField.text = telefones[indexPath.row].numero

        
        cell.textField.placeholder = "41 99999-9999"
        cell.textField.tag = indexPath.row
        
        cell.btnAdd.tag = indexPath.row
        cell.btnRemove.tag = indexPath.row
        
        cell.btnAdd.addTarget(self, action: #selector(addRow), for: .touchUpInside)
        cell.btnRemove.addTarget(self, action: #selector(removeRow), for: .touchUpInside)
        
        return cell
    }
    
    @objc func addRow(_ sender: AnyObject){
        telefones.append(contatoViewModel!.novoTelefone())
        //telefones.append("")
        vTableTelefones.reloadData()
    }
    
    @objc func removeRow(_ sender: AnyObject){
        let index = (sender as! UIButton).tag
        if index > 0 {
            telefones.remove(at: index)
            vTableTelefones.reloadData()
        }
    }


    @IBAction func salvar(_ sender: Any) {
        contato!.nome = vNome.text!
        contato!.site = vSite.text!
        
        print(contato.telefones!.count)
        
        //let t = contatoViewModel?.novoTelefone()
        //t!.numero = "especial"
        
        
        let cells = vTableTelefones.visibleCells as! [TelefoneCell]
        var i = 0
        for t in cells {
            telefones[i].numero = "aqui"
            contato.addToTelefones(telefones[i])
            print("telefone: \(telefones[i].numero)")
            
            i += 1
        }
        
        contatoViewModel!.save(contato!)
        print(contato.telefones!.count)
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
