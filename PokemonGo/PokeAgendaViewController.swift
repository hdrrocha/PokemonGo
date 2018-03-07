//
//  PokeAgendaViewController.swift
//  PokemonGo
//
//  Created by Helder Rocha on 07/03/18.
//  Copyright © 2018 Helder Rocha. All rights reserved.
//

import UIKit

class PokeAgendaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pokemonCapturados: [Pokemon] = []
    var pokemonNaoCapturados: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let coreDataPokemon = CoreDAtaPokemon()
        
        self.pokemonCapturados = coreDataPokemon.recuperarPokemonCapturados(capturado: true)
        self.pokemonNaoCapturados = coreDataPokemon.recuperarPokemonCapturados(capturado: false)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Capturados"
        }  else {
            return "Não Capturados"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.pokemonCapturados.count
        } else {
            return self.pokemonNaoCapturados.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon: Pokemon
        
        if indexPath.section == 0 {
            pokemon = self.pokemonCapturados[ indexPath.row ]
        }else{
            pokemon = self.pokemonNaoCapturados[ indexPath.row ]
        }
        
        let celula = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "celula")
        celula.textLabel?.text = pokemon.nome
        celula.imageView?.image = UIImage(named: pokemon.imagem! )
        
        
        return celula
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func voltarMapa(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
}
