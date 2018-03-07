//
//  CoreDataPokemon.swift
//  PokemonGo
//
//  Created by Helder Rocha on 02/03/18.
//  Copyright © 2018 Helder Rocha. All rights reserved.
//

import UIKit
import CoreData
class CoreDAtaPokemon {
    //recuperar contect
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context!
    }
    
    func recuperarPokemonCapturados(capturado: Bool) -> [Pokemon] {
        let context = self.getContext()
        let requisicao = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        requisicao.predicate = NSPredicate(format: "capturado = %@" ,capturado as CVarArg )
        
        do {
            let pokemon = try context.fetch(requisicao) as [Pokemon]
            return pokemon
        }catch{}
        
        return []
    }
    
    //add todos os pokemons
    func adicionarTodosPokemons() {
        let context = self.getContext()
        
        self.criarPokemon(nome: "Mew", nomeImagem: "mew", capturado: false )
        self.criarPokemon(nome: "Meowth", nomeImagem: "meowth", capturado: false)
        self.criarPokemon(nome: "Pikachu", nomeImagem: "pikachu-2", capturado: true )
        self.criarPokemon(nome: "Squirtle", nomeImagem: "squirtle", capturado: false  )
        self.criarPokemon(nome: "Charmander", nomeImagem: "charmander", capturado: false  )
        self.criarPokemon(nome: "Caterpie", nomeImagem: "caterpie", capturado: false  )
        self.criarPokemon(nome: "Bullbasaur", nomeImagem: "bullbasaur", capturado: false  )
        self.criarPokemon(nome: "Bellsprout", nomeImagem: "bellsprout", capturado: false  )
        self.criarPokemon(nome: "Psyduck", nomeImagem: "psyduck", capturado: false  )
        self.criarPokemon(nome: "Rattata", nomeImagem: "rattata", capturado: false  )
        self.criarPokemon(nome: "Snorlax", nomeImagem: "snorlax", capturado: false  )
        self.criarPokemon(nome: "Zubat",nomeImagem: "zubat", capturado: false  )
        
        do{
            try context.save()
        }catch{}

    }
    //criar pokemons
    func criarPokemon(nome: String, nomeImagem: String, capturado: Bool){
        
        let context = self.getContext()
        let pokemon = Pokemon(context: context)
        pokemon.nome = nome
        pokemon.imagem = nomeImagem
        pokemon.capturado = capturado
        
    }
    
    func recuperarTodosPokemon() -> [Pokemon] {
        let context = self.getContext()
        
        do{
            let pokemon = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
            
            if pokemon.count == 0 {
                self.adicionarTodosPokemons()
                return self.recuperarTodosPokemon()
            }
            
            return pokemon
        }catch{}
        
        return []
    }
    
}

