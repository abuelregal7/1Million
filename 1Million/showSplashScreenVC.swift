//
//  showSplashScreenVC.swift
//  1Million
//
//  Created by Ahmed on 12/27/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class showSplashScreenVC: UIViewController {

    @IBOutlet weak var videoView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
          
          
//        if #available(iOS 13.0, *) {
//            overrideUserInterfaceStyle = .dark
//        }
       
        perform(#selector(showNavController), with: nil, afterDelay: 5)
         setupView()
    }
    
    private func setupView(){
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "videoSplash", ofType: "mp4")!)
        let player = AVPlayer(url: path)
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player.play()
    }
    
    @objc func showNavController () {
        performSegue(withIdentifier: "showSplashScreen", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
