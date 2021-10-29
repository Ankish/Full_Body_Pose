//
//  ViewController.swift
//  Example
//
//  Created by Tomoya Hirano on 2020/04/02.
//  Copyright © 2020 Tomoya Hirano. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UpperBodyPoseTrackerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleView: UISwitch!
    @IBOutlet weak var closeButton: UIButton!

    let camera = Camera()
    let tracker: UpperBodyPoseTracker = UpperBodyPoseTracker()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.setSampleBufferDelegate(self)
        camera.start()
        tracker.startGraph()
        tracker.delegate = self

        closeButton.addTarget(self, action: #selector(closeThis), for: UIControl.Event.touchUpInside)
    }
    
    @objc func closeThis(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        tracker.send(pixelBuffer)
        
        DispatchQueue.main.async {
            if !self.toggleView.isOn {
                self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer!))
            }
        }
    }
    
    func upperBodyPoseTracker(_ tracker: UpperBodyPoseTracker!, didOutputLandmarks landmarks: [Landmark]!) {
        print(landmarks)
    }
    
    func upperBodyPoseTracker(_ tracker: UpperBodyPoseTracker!, didOutputPixelBuffer pixelBuffer: CVPixelBuffer!) {
        DispatchQueue.main.async {
            if self.toggleView.isOn {
                self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer))
            }
        }
    }
}
