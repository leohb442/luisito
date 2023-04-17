//
//  ViewControllerCafeEspecifica.swift
//  PrototipoProyecto1
//
//  Created by UNAM FCA 09 on 27/04/22.
//
import UIKit
import CoreData

struct cafe{
    var nombre: String
    var ubicacion: String
    var img : UIImage
    var higiene: String
    var precio : String
    var tiempo: String
    var facultad : String
}

class ViewControllerCafeEspecifica: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var comentarios: [Comentarios] = [Comentarios]()
    var comentario : Comentarios = Comentarios()
    var cafeteria : cafe = cafe(nombre: "", ubicacion: "", img: UIImage(systemName: "pencil")!, higiene: "", precio: "", tiempo: "", facultad: facultad.todas.rawValue)
    
    @IBOutlet weak var tablaComentarios: UITableView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblUbicacion: UITextView!
    @IBOutlet weak var lblPrecios: UILabel!
    @IBOutlet weak var lblHigiene: UILabel!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet weak var imgCafe: UIImageView!
    @IBOutlet weak var txtCom: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comentarios.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaComentarios", for: indexPath) as!
        TableViewCellComentarios
        let com = comentarios [indexPath.row]
        cell.lblComentario.text = com.comentario
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaComentarios.delegate = self
        tablaComentarios.dataSource = self
        
        if cafeteria.nombre != ""{
            lblNombre.text = cafeteria.nombre
            lblUbicacion.text = cafeteria.ubicacion
            lblPrecios.text = cafeteria.precio
            lblHigiene.text = cafeteria.higiene
            lblTiempo.text = cafeteria.tiempo
            imgCafe.image = cafeteria.img
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recoverData()
        tablaComentarios.reloadData()
        
    }
    
    func recoverData(){
           
           let context = getContext()
           let fetchRequest : NSFetchRequest<Comentarios> = Comentarios.fetchRequest()
           
           do{
               comentarios = try context.fetch(fetchRequest)
           }catch let error as NSError {
               
               print("No se pudo recuperar \(error), \(error.userInfo)")
           }
       }
           
    func getContext() -> NSManagedObjectContext{
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

    @IBAction func addComentario(_ sender: Any) {
        if let com = txtCom.text{

        saveEntityComentario(comentario: com)
            print("\(com)")
            recoverData()

            tablaComentarios.reloadData()
    }
    }
    
    func saveEntityComentario(comentario : String) {
    let context = getContext()
    
    let entityComentario = NSEntityDescription.entity(forEntityName: "Comentarios", in: context)!
    let comentarioManaged = NSManagedObject(entity: entityComentario, insertInto: context) as! Comentarios
        comentarioManaged.comentario = comentario
  
    do{
        try context.save()
    } catch let error as NSError{
        print("No se pudo salvar: \(error), \(error.userInfo)")
    }
}
}

