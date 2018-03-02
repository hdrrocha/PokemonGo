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
    func getContext() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
//        return context!
    }
        
    //add todos os pokemons
    func adicionarTodosPokemons() {
        
    }
    //criar pokemons
    func criarPkemon(nome: String, nomeImagem: String, capturado: Bool){
        
    }
    
}

