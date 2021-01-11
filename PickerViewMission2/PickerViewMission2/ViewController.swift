//
//  ViewController.swift
//  PickerViewMission2
//
//  Created by 김수진 on 2021/01/01.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM=10
    let PICKER_VIEW_COLUMN=2
    let PICKER_VIEW_HEIGHT:CGFloat=80
    
    var imageArray=[UIImage?]()
    var imageFileName=["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0..<MAX_ARRAY_NUM {
            let image=UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        imageView.image=imageArray[0]
        lblImageFileName.text=imageFileName[0]
    }
    
    //피커 뷰의 컴포넌트 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //피커 뷰의 높이
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //피커 뷰의 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //피커 뷰의 각 row의 view
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView=UIImageView(image: imageArray[row])
        imageView.frame=CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    //피커 뷰가 선택되었을 때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component==0) {
            lblImageFileName.text=imageFileName[row]
            
        } else {
        imageView.image=imageArray[row]
        }
    }
}

