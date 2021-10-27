//
//  ViewController.swift
//  TrafficLights
//
//  Created by Artem Tkachev on 26.10.21.
//

import UIKit

enum CurrentLight{
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .black
        
        startButton.layer.cornerRadius = 20 // cornerRadius отвечает за закругленные углы
        
        redLight.alpha = lightIsOff // alpha отвечает за прозрачность, CGFloat 0.0 - 1
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2 //frame отвечает за изменение размера и положения прямоугольника, width возвращает ширину прямоугольника
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }
    
    @IBAction func startButtonPressed() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .red
        }
    }
    


}

