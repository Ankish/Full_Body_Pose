//
//  FirstViewController.swift
//  Example
//
//  Created by Ankish Jain on 29/10/21.
//  Copyright © 2021 Tomoya Hirano. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(startButton)
        startButton.frame = CGRect(x: view.center.x, y: view.center.y, width: 100, height: 100)
        startButton.backgroundColor = .gray
        startButton.setTitleColor(.black, for: UIControl.State.normal)
        startButton.setTitle("Start", for: UIControl.State.normal)
        startButton.addTarget(self, action: #selector(startPose), for: UIControl.Event.touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        startButton.center = view.center
    }
    
    @objc private func startPose(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as UIViewController
        self.present(vc, animated: true, completion: nil)
    }
}
