//
//  ContatoTableViewController.swift
//  contatos
//
//  Created by PUCPR on 15/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit
import CoreData

class ContatoTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var vBusca: UISearchBar!
    
    var contatos = [Contato]()
    let contexto  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    var contatoViewModel : ContatoViewModel?

    
    override func viewWillAppear(_ animated: Bool) {
        contatoViewModel?.contexto?.viewContext.rollback()
        self.contatos = (contatoViewModel?.listAll())!
        vBusca.text = ""
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vBusca.delegate = self
        self.contatoViewModel = ContatoViewModel(contexto)
        self.contatos = contatoViewModel!.listAll()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contatoCelula", for: indexPath)
        cell.textLabel?.text = contatos[indexPath.row].nome
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contato = contatos[indexPath.row]
            contatoViewModel!.delete(contato)
            contatos = contatoViewModel!.listAll()
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let next = segue.destination as! WebViewController
        
        
        if segue.identifier == "site" {
            
            let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
            let index = self.tableView.indexPathForRow(at:buttonPosition)
  
            let contato = contatos[index!.row]
            
            let next = segue.destination as! WebViewController
            next.site = contato.site

            return
        }
        
        if segue.identifier == "incluir" {
            let next = segue.destination as! FormViewController
            contatoViewModel!.novoContato()
            next.contatoViewModel = contatoViewModel
            
        }
        
        if segue.identifier == "editar" {
            let next = segue.destination as! FormViewController
            let index = tableView.indexPathForSelectedRow!.row
            let contato = contatos[index]
            contatoViewModel!.setContato(contato)
            next.contatoViewModel = contatoViewModel
        }
    }
    
    /*
    @IBAction func exibirSite(_ sender: Any) {
        print("site")
        
        let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!) as! UITableViewCell
        //print(indexPath!.row)
    }
    
    @objc func buttonClicked(_ sender:UIButton){
        
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
        let cell = self.tableView.cellForRow(at: indexPath!) as! UITableViewCell
        print(cell)//print or get item
    }*/
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if vBusca.text != "" {
            contatos = (contatoViewModel?.findNome(searchText))!
        } else {
            contatos = contatoViewModel!.listAll()
        }
        
        tableView.reloadData()
    }
    
}
