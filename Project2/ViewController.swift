//
//  ViewController.swift
//  Project2
//
//  Created by TwoStraws on 13/08/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!

	var countries = [String]()
	var correctAnswer = 0
	var score = 0

	override func viewDidLoad() {
		super.viewDidLoad()
        
        let borderWidth = CGFloat(1)
            
		button1.layer.borderWidth = borderWidth
		button2.layer.borderWidth = borderWidth
		button3.layer.borderWidth = borderWidth

		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor

		countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
		askQuestion()
	}

	func askQuestion(action: UIAlertAction! = nil) {
		countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]

		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)

		correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
		title = countries[correctAnswer].uppercased()
	}

	@IBAction func buttonTapped(_ sender: UIButton) {
		var title: String

		if sender.tag == correctAnswer {
			title = "Correct"
			score += 1
		} else {
			title = "Wrong"
			score -= 1
		}

		let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
		present(ac, animated: true)
	}

}

