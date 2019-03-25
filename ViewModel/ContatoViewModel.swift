//
//  ContatoViewModel.swift
//  contatos
//
//  Created by PUCPR on 18/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import Foundation
import CoreData

class ContatoViewModel {
    
    private var dao : ContatoDAO?
    private var contato : Contato?
     let contexto: NSPersistentContainer?
    
    init(_ contexto: NSPersistentContainer){
        
        self.contexto = contexto
        self.dao = ContatoDAO(self.contexto!)
        //self.contato = Contato(context: self.contexto!.viewContext)
        
    }
    
    func listAll() -> [Contato] {
        return dao!.listAll()
    }
    
    func save(_ c: Contato){
        dao!.save(c)
    }
    
    func novoContato() -> Contato {
        self.contato = Contato(context: self.contexto!.viewContext)
        return contato!
    }
    
    func delete(_ c: Contato){
        dao!.delete(c)
    }
    
    func setContato(_ contato: Contato){
        self.contato = contato
    }
    
    func getContato() -> Contato {
        return self.contato == nil ? novoContato() : self.contato!
    }
    
}
