//
//  ViewController.swift
//  Help Elon Musk
//
//  Created by Reza Koushki on 11/09/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var rocketImage: UIImageView!
	@IBOutlet weak var launchOrLandButton: UIButton!
	
	var audioPlayer = AVAudioPlayer()
	
	var rocketIndex = 0
	let numberOfRockets = 5
	
	override func viewDidLoad() {
		super.viewDidLoad()
		rocketImage.image = UIImage(named: "rocket0")
		launchOrLandButton.setTitle("Blast Off!", for: .normal)
		print(rocketImage.frame.origin.y)

	}

	func playSound(name: String, audioPlayer: inout AVAudioPlayer) {
		if let sound = NSDataAsset(name: name) {
			do {
				try audioPlayer = AVAudioPlayer(data: sound.data)
				audioPlayer.play()
			} catch {
				print("Error: \(error.localizedDescription). Could not initialize AVAudioPlayer object")
			}
		} else {
			print("ERROR: Could not read data from file")
		}
	}
	
	@IBAction func launchOrLandPressed(_ sender: UIButton) {
		playSound(name: "rocketsound", audioPlayer: &audioPlayer)
		if launchOrLandButton.currentTitle == "Blast Off!" {
			UIView.animate(withDuration: 3.0, delay: 0.0, options: []) {
				self.rocketImage.transform = CGAffineTransform(translationX: 0, y: -(self.rocketImage.frame.origin.y + self.rocketImage.frame.size.height))
			} completion: { _ in
				self.audioPlayer.stop()
			}
			launchOrLandButton.setTitle("Return", for: .normal)
		} else {
			UIView.animate(withDuration: 3.0, delay: 0.0, options: []) {
				self.rocketImage.transform = CGAffineTransform.identity
			} completion: { _ in
				self.audioPlayer.stop()
			}

			launchOrLandButton.setTitle("Blast Off!", for: .normal)
		}
	}
	@IBAction func rocketTapped(_ sender: UITapGestureRecognizer) {
		rocketIndex += 1
		if rocketIndex == numberOfRockets {
			rocketIndex = 0
		}
		rocketImage.image = UIImage(named: "rocket\(rocketIndex)")

	}
	
}

