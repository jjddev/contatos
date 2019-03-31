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
    private var contato : Contato?
    var contexto: NSPersistentContainer?
    
    init(_ contexto: NSPersistentContainer){
        
        self.contexto = contexto
        self.dao = ContatoDAO(self.contexto!)
        //self.contato = Contato(context: self.contexto!.viewContext)
        
    }
    
    func listAll() -> [Contato] {
        return dao!.listAll()
    }
    
    func findNome(_ nome: String) -> [Contato]{
        return (dao?.findNome(nome))!
    }
    
    func save(_ c: Contato){
        dao!.save(c)
    }
    
    func novoContato() -> Contato {
        self.contato = Contato(context: self.contexto!.viewContext)
        return contato!
    }
    
    func novoTelefone() -> Telefone {
        return Telefone(context: self.contexto!.viewContext)
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
    
    func deleteTelefones(_ c: Contato){
        dao!.deleteTelefones(c)
        do {
            try self.contexto!.viewContext.save()
        } catch {
            print("Erro: \(error)")
        }
        //dao!.delete(c)
    }
    
    func novaFoto() -> Galeria{
        var foto = Galeria(context: (contexto?.viewContext)!)
        contato!.addToAlbum(foto)
        return foto
    }
    
}
