//
//  ViewController.swift
//  PokemonGo
//
//  Created by Helder Rocha on 01/03/18.
//  Copyright © 2018 Helder Rocha. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var contador = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //quem via vai gerenciar esse mapa é essa propria class
        mapa.delegate = self
        mapa.showsUserLocation = true
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        //Exibir pokemon
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            print("exibe anotacao")
            if let coordenadas = self.gerenciadorLocalizacao.location?.coordinate{
                let anotacao = MKPointAnnotation()
                
                let latAleatoria = (Double(arc4random_uniform(400)) - 250)/100000.0
                let longAleatoria = (Double(arc4random_uniform(400)) - 250)/100000.0
                anotacao.coordinate =  coordenadas
                anotacao.coordinate.latitude += latAleatoria
                anotacao.coordinate.longitude += longAleatoria
                
    
                self.mapa.addAnnotation(anotacao)
                
            }
          
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let anotacaoView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
       
        
        if annotation is MKUserLocation {
            anotacaoView.image = #imageLiteral(resourceName: "player")
        } else {
             anotacaoView.image = #imageLiteral(resourceName: "charmander")
        }
        
        var frame = anotacaoView.frame
        frame.size.height = 40
        frame.size.width = 40
        
        anotacaoView.frame = frame
        return anotacaoView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if contador < 5 {
            self.centralizar()
            contador += 1
        } else {
            gerenciadorLocalizacao.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse && status != .notDetermined{
            //alert
            let alertController = UIAlertController(title: "Permissão de localização", message: "Para que você possa caçar pokemons é necessario que  autorize o uso de localização", preferredStyle: .alert)
            
            let acaoConfiguracao = UIAlertAction(title: "Abrir configurações", style: .default, handler: {
                (alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplicationOpenSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar =  UIAlertAction(title: "Cancelar", style: .default, handler: nil)
            
            alertController.addAction(acaoConfiguracao)
            alertController.addAction(acaoCancelar)
            
            present(alertController, animated: true, completion: nil)
        }
    }

    func centralizar () {
        if let coodernadas = gerenciadorLocalizacao.location?.coordinate  {
            let regiao = MKCoordinateRegionMakeWithDistance(coodernadas, 200, 200)
            mapa.setRegion(regiao, animated: true)
        }
    }
    
    @IBAction func centralizarJogador(_ sender: Any) {
       self.centralizar()
    }
    
    @IBAction func abrirPokedex(_ sender: Any) {
    }
    
}

