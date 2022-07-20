//
//  ResultViewController.swift
//  CalculatedBMI
//
//  Created by Barış Yeşilkaya on 20.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue : String?
    var adviceText : String?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = bmiValue
        adviceLabel.text = adviceText

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
