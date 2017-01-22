//
//  ViewController.swift
//  SlugSense
//
//  Created by Douglas MacbookPro on 1/21/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit
import UserNotifications

var tabSelected = 0
var humidityGlobalVar = "0"
var temperatureGlobalVar = "0"
var heatGlobalVar = "0"
var moistureGlobalVar = "0"
var lightGlobalVar = "0"

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let chartPageURL = URL(string: "http://192.168.2.7:8000/")
        let chartPageURLRequest = URLRequest(url: chartPageURL!)
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getJSON), userInfo: nil, repeats: true)
        timer.fire()
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func getJSON(){
        
        let jsonUrl = URL(string: "http://169.233.211.156:8000/api/get_values")
        let task = URLSession.shared.dataTask(with: jsonUrl!) { (data, response, error) in
            if error != nil{
                print("Error!")
            }
            else{
                if let content = data{
                    do{
                        // Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJson)
                        var intString = myJson["solar"] as! Int
                        heatGlobalVar = String(intString)
                        
                        intString = myJson["temp"] as! Int
                        temperatureGlobalVar = String(intString)
                        
                        intString = myJson["humid"] as! Int
                        humidityGlobalVar = String(intString)
                        
                        intString = myJson["moist"] as! Int
                        moistureGlobalVar = String(intString)
                    }
                    catch{
                        print("Error loading JSON")
                    }
                }
            }
        }
        task.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabSelected = 0
    }


}

