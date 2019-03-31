//
//  ContatoDAO.swift
//  contatos
//
//  Created by PUCPR on 15/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import Foundation
import CoreData

class ContatoDAO {
    
    var contexto: NSPersistentContainer?
    
    init(_ contexto: NSPersistentContainer){
        self.contexto = contexto
    }
    
    func findNome(_ nome: String) -> [Contato] {
        let req: NSFetchRequest<Contato> = Contato.fetchRequest()
        req.predicate = NSPredicate(format: "nome contains[c] %@", nome)
        
        do{
            return try contexto!.viewContext.fetch(req)
        } catch {
            print("erro: \(error)")
        }
        
        return [Contato]()
    }
    
    func listAll() -> [Contato]{
        let req: NSFetchRequest<Contato> = Contato.fetchRequest()
      
        do{
            return  try self.contexto!.viewContext.fetch(req)
        } catch {
            print("erro: \(error)")
            return [Contato]()
        }
    }
    
    func save(_ c: Contato){
        do {
            try self.contexto!.viewContext.save()
        } catch {
            print("Erro: \(error)")
        }
    }
    
    func delete(_ c: Contato){
        self.contexto!.viewContext.delete(c)
        
        do {
            try self.contexto!.viewContext.save()
        } catch {
            print("Erro: \(error)")
        }
        
    }
    
    
    func deleteTelefones(_ c: Contato){
        do {
            for item in c.telefones!.allObjects as! [Telefone] {
                self.contexto!.viewContext.delete(item)
            }

            try  self.contexto!.viewContext.save()
        } catch {
            print("Erro: \(error)")
        }
    }
}
