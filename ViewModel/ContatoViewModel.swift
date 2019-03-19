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
    
    var dao : ContatoDAO?
    var contato : Contato?
    
    
    init(_ contexto: NSPersistentContainer){
        dao = ContatoDAO(contexto)
    }
    
    func listAll() -> [Contato] {
        return dao!.listAll()
    }
    
    func save(){
        dao!.save(<#Contato#>)
    }
    
}
