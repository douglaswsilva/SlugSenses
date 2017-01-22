//
//  SubView.swift
//  SlugSense
//
//  Created by Douglas MacbookPro on 1/21/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit

class SubView: UIView {

    @IBOutlet var subView: UIView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var gauge: GaugeView!
    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var icon4: UIImageView!
    @IBOutlet weak var label4: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        UINib(nibName: "SubView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(subView)
        subView.frame = self.bounds
        
        populate()
        
        gauge.thickness = 15
        gauge.labelFont = UIFont.systemFont(ofSize: 40, weight: UIFontWeightThin)
        gauge.labelColor = UIColor.white
        gauge.startAngle = 270
        gauge.labelText = "0%"
        gauge.animationDuration = 1.00

        
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(populate), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc private func populate(){
        
        if tabSelected == 0 {
            title.text = "Temperature"
            label1.text = moistureGlobalVar + "%"
            icon1.image = #imageLiteral(resourceName: "MoistureForApp")
            label2.text = heatGlobalVar + "%"
            icon2.image = #imageLiteral(resourceName: "HeatForApp")
            label3.text =  humidityGlobalVar + "%"
            icon3.image = #imageLiteral(resourceName: "HumidityForApp")
            label4.text = lightGlobalVar + "%"
            icon4.image = #imageLiteral(resourceName: "SunForApp")
            gauge.labelText = temperatureGlobalVar + "°F"
            gauge.percentage = Float(temperatureGlobalVar)!
            
        }
        
        if tabSelected == 1{
            title.text = "Humidity"
            label1.text = moistureGlobalVar + "%"
            icon1.image = #imageLiteral(resourceName: "MoistureForApp")
            label2.text = heatGlobalVar + "%"
            icon2.image = #imageLiteral(resourceName: "HeatForApp")
            label3.text = temperatureGlobalVar + "°F"
            icon3.image = #imageLiteral(resourceName: "TemperatureForApp")
            label4.text = lightGlobalVar + "%"
            icon4.image = #imageLiteral(resourceName: "SunForApp")
            gauge.labelText = humidityGlobalVar + "%"
            gauge.percentage = Float(humidityGlobalVar)!

        }
        
        if tabSelected == 2{
            title.text = "Moisture"
            label1.text = humidityGlobalVar + "%"
            icon1.image = #imageLiteral(resourceName: "HumidityForApp")
            label2.text = heatGlobalVar + "%"
            icon2.image = #imageLiteral(resourceName: "HeatForApp")
            label3.text = temperatureGlobalVar + "°F"
            icon3.image = #imageLiteral(resourceName: "TemperatureForApp")
            label4.text = lightGlobalVar + "%"
            icon4.image = #imageLiteral(resourceName: "SunForApp")
            gauge.labelText = moistureGlobalVar + "%"
            gauge.percentage = Float(moistureGlobalVar)!
        }
        
        if tabSelected == 3{
            title.text = "Light"
            label1.text = humidityGlobalVar + "%"
            icon1.image = #imageLiteral(resourceName: "HumidityForApp")
            label2.text = moistureGlobalVar + "%"
            icon2.image = #imageLiteral(resourceName: "MoistureForApp")
            label3.text = temperatureGlobalVar + "°F"
            icon3.image = #imageLiteral(resourceName: "TemperatureForApp")
            label4.text = heatGlobalVar + "%"
            icon4.image = #imageLiteral(resourceName: "HeatForApp")
            gauge.labelText = lightGlobalVar + "%"
            gauge.percentage = Float(lightGlobalVar)!
        }
        
        if tabSelected == 4{
            title.text = "Heat"
            label1.text = humidityGlobalVar + "%"
            icon1.image = #imageLiteral(resourceName: "HumidityForApp")
            label2.text = moistureGlobalVar + "%"
            icon2.image = #imageLiteral(resourceName: "MoistureForApp")
            label3.text = temperatureGlobalVar + "°F"
            icon3.image = #imageLiteral(resourceName: "TemperatureForApp")
            label4.text = lightGlobalVar + "%"
            icon4.image = #imageLiteral(resourceName: "SunForApp")
            gauge.labelText = heatGlobalVar + "%"
            gauge.percentage = Float(heatGlobalVar)!
        }
    }

}
