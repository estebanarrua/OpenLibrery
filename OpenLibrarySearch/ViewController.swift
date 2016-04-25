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
    @IBOutlet weak var TVRespuesta: UITextView!
    
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
        if(text == "Error"){
            TVRespuesta.text = ""
            let alerta = UIAlertController(title: "Error", message: "No tiene conexion a internet", preferredStyle: UIAlertControllerStyle.Alert)
            let accion = UIAlertAction(title: "Salir" , style: UIAlertActionStyle.Cancel ,handler: {alerAction in
                
            })
            alerta.addAction(accion)
            self.presentViewController(alerta, animated: true, completion: nil)
        }else{
            TVRespuesta.text = text
        }
        
    }

}

