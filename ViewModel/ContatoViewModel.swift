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
    private var contexto: NSPersistentContainer?
    
    init(_ contexto: NSPersistentContainer){
        
        self.contexto = contexto
        self.dao = ContatoDAO(self.contexto!)
        
    }
    
    func listAll() -> [Contato] {
        return dao!.listAll()
    }
    
    func save(_ c: Contato){
        dao!.insert(c)
    }
    
    func novoContato() -> Contato {
        return Contato(context: self.contexto!.viewContext)
    }
    
    func delete(_ c: Contato){
        dao!.delete(c)
    }
    
    func setContato(_ contato: Contato){
        self.contato = contato
    }
    
    func getContato() -> Contato{
        return self.contato!
    }
    
}
