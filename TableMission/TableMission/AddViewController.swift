//
//  AddViewController.swift
//  TableMission
//
//  Created by 김수진 on 2021/01/09.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let PICKER_VIEW_HEIGHT:CGFloat=80
    let PICKER_VIEW_COUNT=3
    let PICKER_VIEW_COLUMN=1
    var imageArr=[UIImage?]()
    var imageFileName=["cart.png", "clock.png", "pencil.png"]
    var fileName=""

    @IBOutlet var AddItem: UITextField!
    @IBOutlet var ImgView: UIImageView!
    @IBOutlet var ImgPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<PICKER_VIEW_COUNT {
            let image=UIImage(named: itemsImage[i])
            imageArr.append(image)
        }
        ImgView.image=imageArr[0]
        fileName=imageFileName[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component:Int)->CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?)->UIView {
        let imageView=UIImageView(image:imageArr[row])
        imageView.frame=CGRect(x:0, y:0, width: 50, height: 50)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ImgView.image=imageArr[row]
        fileName=imageFileName[row]
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(AddItem.text!)
        itemsImage.append(fileName)
        AddItem.text=""
        _=navigationController?.popViewController(animated: true)
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
