//
//  ViewControllerCafes.swift
//  PrototipoProyecto1
//
//  Created by UNAM FCA 09 on 01/04/22.
//

import UIKit
import CoreData

class ViewControllerCafes: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
   
    
//    var caf : [cafe] = [cafe(nombre: "Cabañita", facultad: "FCA", imgCafe: UIImage(named: "LaCabaña")!),cafe(cafeteriaN: "Fonda", facultadC: "Ciencias", imgCafe: UIImage(named: "fonda")!), cafe(cafeteriaN: "Estacionamiento", facultadC: "FCA", imgCafe: UIImage(named: "est")!)]
    
    var banderaCafesFac = ""
    
    //tiene todas las cafeterias de la unam
    var caf : [cafe] = [cafe(nombre: "Cabañita", ubicacion: "Atras del edificio I, a un costado del edificio de idiomas", img:  UIImage (named: "LaCabaña")!, higiene: "Higiene Regular", precio: "Precios Buenos", tiempo: "5 min", facultad: facultad.fca.rawValue),cafe(nombre: "Fonda", ubicacion: "Atras del edificio B, cerca de las palapas", img:  UIImage (named: "fonda")!, higiene: "Mala", precio: "Buenos", tiempo: "10 min", facultad: facultad.ciencias.rawValue), cafe(nombre: "Estacionamiento", ubicacion: "Atras del edificio K, cerca de servicios escolares", img:  UIImage (named: "est")!, higiene: "Buena", precio: "Caros", tiempo: "15 min", facultad: facultad.fca.rawValue),cafe(nombre: "Ecotacos", ubicacion: "Atras del edificio A, a un costado de la biblioteca de la Facultad de derecho ", img:  UIImage (named: "tacos")!, higiene: "Mala", precio: "Baratos", tiempo: "5 min", facultad: facultad.economia.rawValue) ]
    
    
    
    
    
    
    
    // tener todas las cafeterias de la facultad seleccionada
    var facultadSeleccionada = [cafe] ()
    
    var cafeteria : cafe = cafe(nombre: "", ubicacion: "", img: UIImage (systemName: "pencil")!, higiene: "", precio: "", tiempo: "", facultad: facultad.todas.rawValue)
    
    var action: String = "agregar"
    
    
    
    @IBOutlet weak var TableViewCafeterias: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facultadSeleccionada.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaCafes", for: indexPath) as!
        TableViewCellCafes
        
        let cafeteria = facultadSeleccionada[indexPath.row]
        
        cell.lblcafe.text = cafeteria.nombre
        cell.lblFacultad.text = cafeteria.facultad
        cell.imgCafe.image = cafeteria.img
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtrarCafeterias()
        TableViewCafeterias.delegate = self
        TableViewCafeterias.dataSource = self
        
    }
    
    
    func filtrarCafeterias () {
        
        for i in caf{
            if i.facultad == banderaCafesFac{
                facultadSeleccionada.append(i)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cafeteria = facultadSeleccionada[indexPath.row]
        action = "editar"
        performSegue(withIdentifier: "segue2", sender: nil)
    }
    
    @IBAction func mostrarEscena(_ sender: UIBarButtonItem) {
        action = "agregar"
        performSegue(withIdentifier: "segue2", sender: nil)
    }
        func getContext() -> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "segue2" {
            
            let viewcontroller = segue.destination as! ViewControllerCafeEspecifica
                
                viewcontroller.cafeteria = cafeteria
                
                
        
            }
    }
    
}
