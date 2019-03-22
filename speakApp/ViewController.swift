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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked(_ sender: Any) {

        let speechUtterance =  AVSpeechUtterance(string: messageTextField.text!)
//        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
}

