//
//  ViewController.swift
//  demo-babydate
//
//  Created by jeanwei on 2019/12/21.
//  Copyright © 2019 jeanwei. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    
    var myDatePicker: UIDatePicker!
    var myLabel: UILabel!
    

   
    @IBOutlet weak var babybirthday: UIDatePicker!
    @IBOutlet weak var babysex: UISegmentedControl!
    @IBOutlet weak var babyfeeding: UISwitch!
    @IBOutlet weak var feedingouer: UISlider!
    @IBOutlet weak var babyDaysofbirth: UILabel!
    @IBOutlet weak var newdate: UILabel!
    @IBOutlet weak var drinkmilkforhours: UILabel!
    @IBOutlet weak var babyimageview: UIImageView!
    @IBOutlet weak var birthday: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  

    }
   
   
    
    @IBAction func babyfeeingswich(_ sender: UISwitch) {
       if sender.isOn == true {    // 判斷使用者選擇是開還是關
            babyimageview.image = UIImage(named: "SwitchOn")  //顯示on的圖片
        }else {
            babyimageview.image = UIImage(named: "SwitchOff") //顯示off的圖片
        }
    }
    
    @IBAction func feedingouerSlider(_ sender: UISlider) {
       // UISlider按鈕右邊 尚未填滿的顏色
        feedingouer.maximumTrackTintColor = UIColor.green
        feedingouer.minimumTrackTintColor = UIColor.red
        feedingouer.thumbTintColor = UIColor.blue
        feedingouer.minimumValue = 1
        feedingouer.maximumValue = 4
        feedingouer.isContinuous = true
        sender.value.round()
        drinkmilkforhours.text = "餵奶\(Int(sender.value).description)小時"
    }
    
    @IBAction func babybirthdayDatePicker(_ sender: Any) {
        let datePicker = sender as! UIDatePicker
        
        //get date from datePicker
        let babyDate = datePicker.date
        
        print(babyDate)
        let babyDate1 = DateFormatter()
               babyDate1.dateFormat = "MM dd yyyy" // 設定要顯示在Text Field的日期時間格式
        
               birthday.text = babyDate1.string(from: babybirthday.date) // 更新lable的內容
       
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd yyyy"
        let time = formatter.string(from: now)
        self.newdate.text = time
        

        let calendar = Calendar.current

        
        let date1 = calendar.startOfDay(for: babyDate)
        let date2 = calendar.startOfDay(for: now)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
         babyDaysofbirth.text = "出生天數：\(components.day!)天"
}
    

    //點選空白處鍵盤收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
}






