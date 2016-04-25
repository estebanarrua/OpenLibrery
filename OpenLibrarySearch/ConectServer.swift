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
    var text = ""
    
    func connect() -> String {
        let url = NSURL(string: "\(route)\(isbn)")
        let datos : NSData? = NSData(contentsOfURL: url!)
        if(datos != nil){
            text = NSString(data:datos!, encoding:NSUTF8StringEncoding) as! String
            
        }else{
            text = "Error"
        }
        
        return text
    }
    

}


