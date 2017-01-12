//
//  ViewController.swift
//  LmyPicker
//
//  Created by limuyun on 2017/1/12.
//  Copyright © 2017年 biiway. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PickerDelegate {

    var areaString : String?
    var dateString : String?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "one")
            cell?.detailTextLabel?.text = areaString
            return cell!
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "two")
            cell?.detailTextLabel?.text = dateString
            
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
            var contentArray = [LmyPickerObject]()
            let plistPath:String = Bundle.main.path(forAuxiliaryExecutable: "area.plist") ?? ""
            let plistArray = NSArray(contentsOfFile: plistPath)
            let proviceArray = NSArray(array: plistArray!)
            for i in 0..<proviceArray.count {
                var subs0 = [LmyPickerObject]()
                
                let cityzzz:NSDictionary = proviceArray.object(at: i) as! NSDictionary
                let cityArray:NSArray = cityzzz.value(forKey: "cities") as! NSArray
                for j in 0..<cityArray.count {
                    var subs1 = [LmyPickerObject]()
                    
                    let areazzz:NSDictionary = cityArray.object(at: j) as! NSDictionary
                    let areaArray:NSArray = areazzz.value(forKey: "areas") as! NSArray
                    for m in 0..<areaArray.count {
                        let object = LmyPickerObject()
                        object.title = areaArray.object(at: m) as? String
                        subs1.append(object)
                    }
                    let citymmm:NSDictionary = cityArray.object(at: j) as! NSDictionary
                    let cityStr:String = citymmm.value(forKey: "city") as! String
                    let object = LmyPickerObject()
                    object.title = cityStr
                    subs0.append(object)
                    object.subArray = subs1
                }
                let provicemmm:NSDictionary = proviceArray.object(at: i) as! NSDictionary
                let proviceStr:String? = provicemmm.value(forKey: "state") as! String?
                let object = LmyPickerObject()
                object.title = proviceStr
                object.subArray = subs0
                contentArray.append(object)
            }
            
            let picker = LmyPicker(delegate: self, style: .nomal)
            picker.contentArray = contentArray
            picker.show()
        }else {
            let picker = LmyPicker(delegate: self, style: .date)
            picker.show()
        }
    }
    func chooseDate(picker: LmyPicker, date: Date) {
        dateString = date.string_from(formatter: "yyyy-MM-dd")
        tableView.reloadData()
    }
    func chooseElements(picker: LmyPicker, content: [Int : Int]) {
        var str:String = ""
        if let array = picker.contentArray {
            var tempArray = array
            for i in 0..<content.keys.count {
                let value:Int! = content[i]
                if value < tempArray.count {
                    let obj:LmyPickerObject = tempArray[value]
                    let title = obj.title ?? ""
                    if str.characters.count>0 {
                        str = str.appending("-\(title)")
                    }else {
                        str = title;
                    }
                    if let arr = obj.subArray {
                        tempArray = arr
                    }
                }
            }
            areaString = str
            tableView.reloadData()
        }
    }
}

