//
//  ViewController.swift
//  NavigationMission
//
//  Created by 김수진 on 2021/01/09.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let lampOn=UIImage(named: "lamp-on.png")
    let lampOff=UIImage(named: "lamp-off.png")
    
    var isOn=true
    var isBig=false
    var orgBig=false

    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image=lampOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController=segue.destination as! EditViewController
        if segue.identifier=="editButton" {
            editViewController.textWayValue="segue : use button"
        } else if segue.identifier=="editBarButton" {
            editViewController.textWayValue="segue : use Bar button"
        }
        editViewController.textMessage=txtMessage.text!
        editViewController.isOn=isOn
        editViewController.isBig=orgBig
        editViewController.delegate=self
    }
    
    func didMessageEditDone(_controller: EditViewController, message: String) {
        txtMessage.text=message
    }
    
    func didImageOnOffDone(_controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image=lampOn
            self.isOn=true
        } else {
            imgView.image=lampOff
            self.isOn=false
        }
    }
    
    func didSizeBigSmallDone(_controller: EditViewController, isBig: Bool) {
        let scale:CGFloat=2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isBig {
            if orgBig {
            } else {
                self.isBig=false
                self.orgBig=true
                newWidth=imgView.frame.width*scale
                newHeight=imgView.frame.height*scale
                imgView.frame.size=CGSize(width: newWidth, height: newHeight)
            }
        } else {
            if orgBig {
                self.isBig=true
                self.orgBig=false
                newWidth=imgView.frame.width/scale
                newHeight=imgView.frame.height/scale
                imgView.frame.size=CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
        }
    }
    
}

