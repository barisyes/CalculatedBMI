//
//  ViewController.swift
//  CalculatedBMI
//
//  Created by Barış Yeşilkaya on 20.07.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSliderBar: UISlider!
    @IBOutlet weak var weightSliderBar: UISlider!
    
    var bmiValue = "0.0"
    var bmiScore : Float = 0.0
    
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
        
        let bmi = weight / pow(height, 2)
        bmiScore = bmi
        bmiValue = String(format: "%.1f", bmi)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
            if 0 < bmiScore && bmiScore <= 18.4 {
                destinationVC.adviceText = "Eat something!!!"
            } else if 18.4 < bmiScore && bmiScore < 25{
                destinationVC.adviceText = "Keep going like this 👍"
            } else if 25 <= bmiScore {
                destinationVC.adviceText = "You should cut down on eating!!!"
            }
        }
    }
    
    
}
