//
//  LoginViewController.swift
//  ProjectBrnMain
//
//  Created by R Shantha Kumar on 1/7/20.
//  Copyright © 2020 R Shantha Kumar. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController: ViewController {

    
    @IBOutlet weak var stackView1: UIStackView!
    
    @IBOutlet weak var stackView2: UIStackView!
    
    
    var loginData = [String:String]()
    
    var emailText:HoshiTextField!
    var passwordText:HoshiTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        emailText = HoshiTextField()
        emailText.placeholder = "Enter Email"
        emailText.frame = CGRect(x: 0, y: 0, width:280, height: 60)
        emailText.borderInactiveColor = .red
        emailText.placeholderColor = .black
        emailText.textColor = .black
        emailText.borderActiveColor = .orange
        stackView1.addSubview(emailText)
       
        
        passwordText = HoshiTextField()
        passwordText.placeholder = "Enter Password"
        passwordText.frame = CGRect(x: 0, y: 0, width:280, height: 60)
        passwordText.borderInactiveColor = .red
        passwordText.placeholderColor = .black
        passwordText.textColor = .black
        passwordText.borderActiveColor = .orange
        stackView2.addSubview(passwordText)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginView(_ sender: Any) {
        
        loginData = BRNData()
        
        print(loginData)
        
    }
    
    //servewr data
    
    
    func BRNData()-> [String:String]{
      
          var convertedData:[String:String]?
          
        var  urlRequest = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
          
          urlRequest.httpMethod = "POST"
          emailText.text! = "shanth923@gmail.com"
        passwordText.text! = "9493215373v@"
      
           let dataToSend =  "registeredEmail=\(emailText.text!)&registeredPassword=\(passwordText.text!)&funcName=verifyLogin"
          
          urlRequest.httpBody = dataToSend.data(using:String.Encoding.utf8)
          
      var    urlDataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, URLResponse, Error) in
              
              print("got data")
              do{
                   convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
                  
                 
                  
              }
              
              catch{
                  
                  print("something went wrong")
                  
              }
              
          })
          urlDataTask.resume()
          
          
          while(convertedData == nil)
          {
              
          }
          
          DataBaseManager.shared.loginData=convertedData!
          return convertedData!
      }
      
      
      
      
      func attendanceDetails() -> [[String:Any]]{
          
          var covertedData:[[String:Any]]?
        var  urlRequest = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
          urlRequest.httpMethod="POST"
          let  dataToSend="funcName=getUserAttendance&studentIDByAdmin=NoValue"
          
          urlRequest.httpBody = dataToSend.data(using:String.Encoding.utf8)
          
       var  urlDataTask = URLSession.shared.dataTask(with:urlRequest,completionHandler:{(data, conncetionDetails,error) in
              
              print("got data from server")
              
              do{
                  covertedData = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
                  
                 
              }catch
              {
                  print("something went wrong")
              }
              
          })
          urlDataTask.resume()
          
          while (covertedData == nil) {
              
          }
          DataBaseManager.shared.attendanceData = covertedData!
          return covertedData!
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
