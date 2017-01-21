//
//  HumidityViewController.swift
//  SlugSense
//
//  Created by Douglas MacbookPro on 1/21/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit
import WebKit

class HumidityViewController: UIViewController {

    @IBOutlet weak var humidityViewContainer: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        humidityViewContainer.addSubview(webView)
        let frame = CGRect(x: 0, y: 0, width: humidityViewContainer.bounds.width, height: humidityViewContainer.bounds.height)
        webView.frame = frame
        
        let moistureURLStr = "https://people.ucsc.edu/~okdogulu/slugsense.html"
        let moistureURL = URL(string: moistureURLStr)
        let moistureURLRequest = URLRequest(url: moistureURL!)
        
        webView.load(moistureURLRequest)
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(reloadWebView), userInfo: nil, repeats: true)

    }
    
    func reloadWebView(){
        webView.reload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
