//
//  TableViewController.swift
//  contatos
//
//  Created by juliano on 23/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var nomes = ["fulano","abc","123","teste"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nomes.count
    }

    func registerTableViewCells(){
        let textFieldCell = UINib(nibName: "TelefoneCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "especial")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "especial", for: indexPath) as! TelefoneCell
        
        cell.textField.text = nomes[indexPath.row]
        cell.textField.placeholder = "41 99999-9999"
        cell.textField.tag = indexPath.row
        
        cell.btnAdd.tag = indexPath.row
        cell.btnRemove.tag = indexPath.row
        
        cell.btnAdd.addTarget(self, action: #selector(addRow), for: .touchUpInside)
        cell.btnRemove.addTarget(self, action: #selector(removeRow), for: .touchUpInside)
        
        //print(cell.subviews)
        
        //txt[0].text = nomes[indexPath.row]
        
        
        //cell.textLabel?.text = nomes[indexPath.row]
        
        return cell
    }
    
    @objc func addRow(_ sender: AnyObject){
        nomes.append("")
        tableView.reloadData()
    }
    
    @objc func removeRow(_ sender: AnyObject){
        let index = (sender as! UIButton).tag
        if index > 0 {
            nomes.remove(at: index)
            tableView.reloadData()
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
