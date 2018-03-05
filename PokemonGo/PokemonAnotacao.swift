//
//  PokemonAnotacao.swift
//  PokemonGo
//
//  Created by Helder Rocha on 05/03/18.
//  Copyright © 2018 Helder Rocha. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnotacao: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coordenadas: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coordenadas
        self.pokemon = pokemon
    }
    
}

