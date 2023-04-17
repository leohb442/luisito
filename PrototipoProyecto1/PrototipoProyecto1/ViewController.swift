//

//  ViewController.swift
//  PrototipoProyecto1
//
//  Created by UNAM FCA 09 on 01/04/22.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct facu{
        var nombre: String
        var img : UIImage
    }
    
    var banderaFac = ""
    
    var fac : [facu] = [facu(nombre: facultad.fca.rawValue , img: UIImage(named: "FCA-letras")!), facu(nombre: facultad.ciencias.rawValue, img: UIImage(named: "arquitectura_facultad")!), facu(nombre: facultad.economia.rawValue, img: UIImage(named: "eco")!)]
    
    
    var facultad2 : facu = facu(nombre: "", img: UIImage(systemName: "pencil")!)
    
    var action: String = "agregar"
    
    @IBOutlet weak var TableViewFacultades: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fac.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as!
        TableViewCellFacultades
        let facultad = fac[indexPath.row]
        cell.lblNombre.text = facultad.nombre
        cell.imgFac.image = facultad.img
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
           
     
        TableViewFacultades.delegate = self
        TableViewFacultades.dataSource = self
    }
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        facultad2 = self.fac[indexPath.row]
        
        
    
        switch facultad2.nombre {
            
        case facultad.fca.rawValue:
            banderaFac = facultad2.nombre
            break
        case facultad.ciencias.rawValue:
            banderaFac = facultad2.nombre
            break
        case facultad.fca.rawValue:
            banderaFac = facultad2.nombre
            break
        default:
            banderaFac = facultad2.nombre
            break

    }
        action = "editar"
        performSegue(withIdentifier: "segue1", sender: nil)
}
    
    @IBAction func mostrarEscena(_ sender: UIBarButtonItem) {
        action = "agregar"
        performSegue(withIdentifier: "segue1", sender: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if action == "editar"{
            if segue.identifier == "segue1" {
            
            let viewcontroller = segue.destination as! ViewControllerCafes
                viewcontroller.banderaCafesFac = banderaFac
                
        }
        }
    }
    
    func getContext() -> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
