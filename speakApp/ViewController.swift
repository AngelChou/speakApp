//
//  ViewController.swift
//  MySecondApp
//
//  Created by Shun-Ching, Chou on 2019/3/14.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var voiceSegment: UISegmentedControl!
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet var labels: [UILabel]!
    
    var voices = ["en-US", "zh-TW"]
    var animalVoices = ["squeak", "moo", "meow", "hiss", "neigh", "baa", "woof", "oink", "roar", "quack", "tweet", "cluck", "ribbit", "growl", "pawoo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (i, slider) in sliders.enumerated() {
            labels[i].text = String(format: "%.2f", slider.value)
        }
    }
    
    func speak(str: String, lan: String) {
        let speechUtterance =  AVSpeechUtterance(string: str)
        speechUtterance.rate = sliders[0].value
        speechUtterance.pitchMultiplier = sliders[1].value
        speechUtterance.volume = sliders[2].value
        speechUtterance.voice = AVSpeechSynthesisVoice(language: lan)
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        if let text = messageTextField.text {
            speak(str: text, lan: voices[voiceSegment.selectedSegmentIndex])
        }
    }
    
    
    @IBAction func speakButtonClicked(_ sender: UIButton) {
        speak(str: animalVoices[sender.tag], lan: voices[0])
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let index = sender.tag
        labels[index].text = String(format: "%.2f", sliders[index].value)
    }
}

