//
//  PokeAgendaViewController.swift
//  PokemonGo
//
//  Created by Helder Rocha on 07/03/18.
//  Copyright © 2018 Helder Rocha. All rights reserved.
//

import UIKit

class PokeAgendaViewController: UIViewController {
    
    var pokemonCapturados: [Pokemon] = []
    var pokemonNaoCapturados: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let coreDataPokemon = CoreDAtaPokemon()
        
        self.pokemonCapturados = coreDataPokemon.recuperarPokemonCapturados(capturado: true)
        self.pokemonNaoCapturados = coreDataPokemon.recuperarPokemonCapturados(capturado: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func voltarMapa(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
}
