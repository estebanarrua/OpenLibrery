//
//  ConectServer.swift
//  OpenLibrarySearch
//
//  Created by Esteban Gabriel Arrua Garcia on 25/4/16.
//  Copyright © 2016 Esteban Gabriel Arrua Garcia. All rights reserved.
//

import UIKit

class ConectServer: NSObject {
    
    let route = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
    var isbn = ""
    var titulo = ""
    var autores: Array<String> = Array<String>()
    var portadaURL = ""
    var portada:UIImage? = nil
    
    
    func connect() -> String {
        let url = NSURL(string: "\(route)\(isbn)")
        let datos : NSData? = NSData(contentsOfURL: url!)
        do{
            if(datos != nil){
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                let dico2 = dico1["ISBN:\(isbn)"] as! NSDictionary
                if(dico2["title"] != nil){
                    titulo = dico2["title"] as! NSString as String
                }
                if(dico2["authors"] != nil){
                    let array1 = dico2["authors"] as! NSArray
                    for value in array1{
                        let dico3 = value as! NSDictionary
                        if(dico3["name"] != nil){
                            autores.append(dico3["name"] as! NSString as String)
                        }
                    }
                }
                if(dico2["cover"] != nil){
                    let dico3 = dico2["cover"] as! NSDictionary
                    if(dico3["large"] != nil){ portadaURL = dico3["large"] as! NSString as String }
                    else if (dico3["medium"] != nil) { portadaURL = dico3["medium"] as! NSString as String }
                    else if (dico3["small"] != nil) { portadaURL = dico3["small"] as! NSString as String }
                    if (portadaURL != ""){
                        let urlImage = NSURL(string: portadaURL)
                        let datosImage : NSData? = NSData(contentsOfURL: urlImage!)
                        if(datosImage != nil){
                            portada = UIImage(data: datosImage!)
                        }
                    }
                }
                return "OK"
            }else{
                return "CONN_Error"
            }
        }
        catch _ {
            return "JSON_ERROR"
        }
    }
    

}


