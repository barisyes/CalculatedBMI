//
//  ViewController.swift
//  CalculatedBMI
//
//  Created by Barış Yeşilkaya on 20.07.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSliderBar: UISlider!
    @IBOutlet weak var weightSliderBar: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSliderBar.maximumValue = 2.2
    }
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSliderBar(_ sender: UISlider) {
        weightLabel.text = "\(String(format: "%.1f", sender.value))kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSliderBar.value
        let weight = weightSliderBar.value
        
        calculatorBrain.calculateBMI(weight: weight, height: height)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}
