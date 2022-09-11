//
//  ViewController.swift
//  Help Elon Musk
//
//  Created by Reza Koushki on 11/09/2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var rocketImage: UIImageView!
	
	var rocketIndex = 0
	let numberOfRockets = 5
	
	override func viewDidLoad() {
		super.viewDidLoad()
		rocketImage.image = UIImage(named: "rocket0")
	}

	@IBAction func rocketTapped(_ sender: UITapGestureRecognizer) {
		rocketIndex += 1

		rocketImage.image = UIImage(named: "rocket\(rocketIndex)")
		
		if rocketIndex == numberOfRockets - 1 {
			rocketIndex = 0
		}
	}
	
}

