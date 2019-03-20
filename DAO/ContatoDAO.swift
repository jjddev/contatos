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
    
    private var contexto: NSPersistentContainer?
    
    init(_ contexto: NSPersistentContainer){
        self.contexto = contexto
    }
    
    func find(){
        
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
       
    }
    
    func insert(_ c: Contato){
        do {
            try self.contexto!.viewContext.save()
        } catch {
            print("Erro: \(error)")
        }
    }
    
    func update(_ c: Contato){
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
    
}
