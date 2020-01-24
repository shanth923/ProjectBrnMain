//
//  DataBaseManager.swift
//  ProjectBrnMain
//
//  Created by R Shantha Kumar on 1/7/20.
//  Copyright © 2020 R Shantha Kumar. All rights reserved.
//

import UIKit

class DataBaseManager: NSObject {
    
    static var shared  = DataBaseManager()
    
 
    var loginData = [String:String]()
    
    var attendanceData = [[String:Any]]()
    
    private override init() {
        super.init()
    }
    

}
