//
//  LightViewController.swift
//  SlugSense
//
//  Created by Douglas MacbookPro on 1/21/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit

class LightViewController: UIViewController {
    
    @IBOutlet weak var light: UILabel!
    @IBOutlet weak var humid: UILabel!
    @IBOutlet weak var solar: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var gaugeView: GaugeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabSelected = 3
        
        gaugeView.thickness = 15
        gaugeView.labelFont = UIFont.systemFont(ofSize: 40, weight: UIFontWeightThin)
        gaugeView.labelColor = UIColor.white
//        gaugeView.gaugeBackgroundColor = UIColor.white
//        gaugeView.gaugeColor = UIColor.cyan
        gaugeView.startAngle = 180
        gaugeView.animationDuration = 2.00
        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateValues), userInfo: nil, repeats: true)
        timer.fire()

    }
    
    @objc private func updateValues(){
        humid.text = humidityGlobalVar + "%"
        solar.text = heatGlobalVar + "%"
        temp.text = temperatureGlobalVar + "%"
        light.text = lightGlobalVar + "%"
        gaugeView.labelText = moistureGlobalVar + "%"
        gaugeView.percentage = Float(moistureGlobalVar)!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabSelected = 3
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
