//
//  BloodTrackerController.swift
//  vamphelper
//
//  Created by goktan on 1.09.2021.
//  Copyright © 2021 goktan. All rights reserved.
//

import UIKit

class BloodTrackerController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
        @IBOutlet weak var bloodLevelConstraint: NSLayoutConstraint!
        
        // MARK: - Properties
        let bloodStore = DataStore()
        let targetAmount = 2700.0
        
        // MARK: - Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            
            updateAppereance()
        }
        
        // MARK: - Functions
        func updateWaterLevel(amount: Double) {
            let screenHeight = Double(view.frame.size.height)
            let ratio = amount / targetAmount
            let calculatedHeight = screenHeight * ratio
            
            bloodLevelConstraint.constant = CGFloat(calculatedHeight)
            
            UIViewPropertyAnimator.init(duration: 0.5, dampingRatio: 0.75) {
                self.view.layoutIfNeeded()
            }.startAnimation()
        }
        
        func updateLabels(amount: Double) {
            let amountToTarget = (targetAmount - amount) / 1000
            
            if amount < targetAmount {
                let subtitleText = String(format: "To meet today's blood requirement, you must drink \n%g liters of blood.", amountToTarget)
                subtitleLabel.text = subtitleText
                
                if amount == 0 {
                    titleLabel.text = "Hi! \nDid you drink blood today?"
                } else {
                    titleLabel.text = "Congratulations! \nYou're on the right track."
                }
            } else {
                titleLabel.text = "Wonderful! \nTake good care of yourself."
                subtitleLabel.text = "You have met the full amount of blood required for your body today."
            }
        }
        
        func updateAppereance() {
            let currentbloodAmount = bloodStore.getCurrentAmount()
            
            updateLabels(amount: currentbloodAmount)
            updateWaterLevel(amount: currentbloodAmount)
        }
        
        // MARK: - Actions
        @IBAction func addWaterButtonTapped(_ sender: UIButton) {
            var bloodAmount = 0.0
            
            switch sender.tag {
            case 0:
                bloodAmount = 200
            case 1:
                bloodAmount = 500
            case 2:
                bloodAmount = 800
            default:
                break
            }
            
            bloodStore.addblood(amount: bloodAmount)
            updateAppereance()
        }
    }

