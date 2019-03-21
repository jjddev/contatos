//
//  ContatoTableViewController.swift
//  contatos
//
//  Created by PUCPR on 15/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit
import CoreData

class ContatoTableViewController: UITableViewController {

    var contatos = [Contato]()
    var contexto  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    var contatoViewModel : ContatoViewModel?

    
    override func viewWillAppear(_ animated: Bool) {
        contatos = (contatoViewModel?.listAll())!
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contatoViewModel = ContatoViewModel(self.contexto)
        self.contatos = contatoViewModel!.listAll()
        
        //Contato(context: <#T##NSManagedObjectContext#>)
        
        
        //let contexto  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        /*
        let c1 = (Contato(context: contexto)).nome = "Juliano"
        let c2 = (Contato(context: contexto)).nome = "Alberto"
        let c3 = (Contato(context: contexto)).nome = "Maria"
        
        do {
            try contexto.save()
        } catch {
            print("Erro: \(error)")
        }
        */
        
        
        /*
        let req: NSFetchRequest<Contato> = Contato.fetchRequest()
        
        
        do{
            contatos = try contexto.fetch(req)
        } catch {
            print("erro: \(error)")
        }
        */
        
        /*
        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let p = Pessoa(context: contexto)
        
        let p1 = Pessoa(context: contexto)
        p1.nome = "teste"
        
        
        p.nome = "Decker"
        
        do{
            try contexto.save()
        } catch {
            print("Erro: \(error)")
        }
        
        
        var pessoas: [Pessoa] = []
        let req: NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
        req.predicate = NSPredicate(format: "nome like 'De*'")
        
        
        
        do{
            pessoas = try contexto.fetch(req)
        } catch {
            print("erro: \(error)")
        }
 
 */
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
            return
        }
        
        
        let next = segue.destination as! FormViewController
        next.contatoViewModel = contatoViewModel
        
        if segue.identifier == "editar"{
            let index = tableView.indexPathForSelectedRow!.row
            let contato = contatos[index]
            contatoViewModel?.setContato(contato)
        }
    }
    
    @IBAction func exibirSite(_ sender: Any) {
        
        print("site")
    }
    
    @IBAction func exibirGaleria(_ sender: Any) {
        print("galeria")
    }
}
