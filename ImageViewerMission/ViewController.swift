//
//  ViewController.swift
//  ImageViewerMission
//
//  Created by 김수진 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {
    var numImage=1
    var maxImage=6
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewer: UILabel!
    @IBOutlet var btnBefore: UIButton!
    @IBOutlet var btnAfter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBeforeImage(_ sender: UIButton) {
        numImage=numImage-1
        
        if(numImage<1) {
            numImage=maxImage
        }
        
        let imageName=String(numImage) + ".png"
        imageView.image=UIImage(named: imageName)
    }
    
    @IBAction func btnAfterImage(_ sender: UIButton) {
        numImage=numImage+1
        
        if(numImage>maxImage) {
            numImage=1
        }
        
        let imageName=String(numImage) + ".png"
        imageView.image=UIImage(named: imageName)
    }
}

