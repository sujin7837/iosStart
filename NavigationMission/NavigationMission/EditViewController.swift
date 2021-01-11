//
//  EditViewController.swift
//  NavigationMission
//
//  Created by 김수진 on 2021/01/09.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_controller:EditViewController, message:String)
    func didImageOnOffDone(_controller:EditViewController, isOn:Bool)
    func didSizeBigSmallDone(_controller:EditViewController, isBig:Bool)
}

class EditViewController: UIViewController {
    var textWayValue:String=""
    var textMessage:String=""
    var delegate:EditDelegate?
    var isOn=false
    var isBig=false

    @IBOutlet var btnResize: UIButton!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text=textWayValue
        txtMessage.text=textMessage
        swIsOn.isOn=isOn
        if isBig {
            btnResize.setTitle("확대", for: UIControl.State())
        } else {
            btnResize.setTitle("축소", for: UIControl.State())
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(_controller: self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(_controller: self, isOn: isOn)
            delegate?.didSizeBigSmallDone(_controller: self, isBig: isBig)
        }
        _=navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn=true
        } else {
            isOn=false
        }
    }
    
    @IBAction func btnChangeSize(_ sender: UIButton) {
        if isBig {
            isBig=false
            btnResize.setTitle("축소", for: UIControl.State())
        } else {
            isBig=true
            btnResize.setTitle("확대", for: UIControl.State())
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
