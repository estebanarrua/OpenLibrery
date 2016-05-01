//
//  ViewController.swift
//  OpenLibrarySearch
//
//  Created by Esteban Gabriel Arrua Garcia on 24/4/16.
//  Copyright © 2016 Esteban Gabriel Arrua Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var conectServer:ConectServer = ConectServer()
    @IBOutlet weak var TFIsbn: UITextField!
    @IBOutlet weak var LTitulo: UILabel!
    @IBOutlet weak var IEPortada: UIImageView!
    @IBOutlet weak var LAutores: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TFIsbn.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
        conectServer.isbn = sender.text!
        let text = conectServer.connect()
        if(text == "CONN_Error"){
            let alerta = UIAlertController(title: "Error", message: "No tiene conexion a internet", preferredStyle: UIAlertControllerStyle.Alert)
            let accion = UIAlertAction(title: "Salir" , style: UIAlertActionStyle.Cancel ,handler: {alerAction in
                
            })
            alerta.addAction(accion)
            self.presentViewController(alerta, animated: true, completion: nil)
        }else{
            if(conectServer.titulo != ""){
                LTitulo.text = conectServer.titulo
            }else{
                LTitulo.text = "Sin Titulo"
            }
            
            if(conectServer.portada != nil){
                IEPortada.image = conectServer.portada!
            }
            
            if(conectServer.autores.count > 0){
                for autor in conectServer.autores{
                    LAutores.text = "\(autor)\n"
                }
            }else{
                LAutores.text = "Autores desconocidos."
            }
        }
        
    }

}

