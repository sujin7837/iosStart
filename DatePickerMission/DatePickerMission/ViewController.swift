//
//  ViewController.swift
//  DatePickerMission
//
//  Created by 김수진 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector=#selector(ViewController.updateTime) //알람이 구동되면 실행할 함수
    let interval=1.0
    let count=0
    var alarmTime: String?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView=sender
        
        let formatter=DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm EEE"
        
        lblPickerTime.text="선택시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat="hh:mm aaa"
        alarmTime=formatter.string(from: datePickerView.date)
    }
    
    //알람이 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func updateTime() {
        let date=NSDate()   //현재 시간을 가져옴
        
        let formatter=DateFormatter()
        formatter.dateFormat="yyyy-MM-dd HH:mm:ss EEE"
        
        lblCurrentTime.text="현재시간 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat="hh:mm aaa"
        let currentTime=formatter.string(from: date as Date)
        
        if(alarmTime==currentTime) {
            view.backgroundColor=UIColor.red
        } else {
            view.backgroundColor=UIColor.white
        }
        
    }
}

