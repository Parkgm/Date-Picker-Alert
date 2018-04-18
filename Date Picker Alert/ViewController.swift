//
//  ViewController.swift
//  Date Picker Alert
//
//  Created by dit on 2018. 4. 18..
//  Copyright © 2018년 dit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var settingTime: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var myTimer = Timer()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentTime.text = formatter.string(from: datePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
        })
    }
    
    func updateTime(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentTime.text = formatter.string(from: date)
        
        if currentTime.text == settingTime.text {
            let myAlret = UIAlertController(title : "알림", message: "설정된 시간이 되었습니다.!", preferredStyle: .actionSheet)
            
            let okAction = UIAlertAction(title: "확인", style: .default) {(myaction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red
            }
//            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler : nil)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (myaction:UIAlertAction) in
                self.view.backgroundColor = UIColor.yellow
            }
            
            myAlret.addAction(okAction)
            myAlret.addAction(cancelAction)
            present(myAlret, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        settingTime.text = formatter.string(from: datePicker.date)
        
    }
    
}

