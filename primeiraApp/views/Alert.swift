//
//  Alert.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 31/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func erro(message:String = "Unexpected error.") {
        let details = UIAlertController(title: "Sorry",
                                        message: message,
                                        preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Understood",
                                   style: UIAlertActionStyle.Cancel,
                                   handler: nil)
        details.addAction(cancel)
        controller.presentViewController(
            details, animated: true, completion: nil)
    }
}