//
//  LFCHomeVC.swift
//  Newvision
//
//  Created by chenruibao on 2022/10/12.
//

import UIKit
import SwiftyJSON
import SVProgressHUD


class LFCHomeVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var devList = [Any]()
    var tableView:UITableView? = nil
    var mqtt:QHMQTTManager?=nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.navigationItem.title = "Home"
        tableView =  UITableView.init(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight), style: UITableView.Style.plain)
        tableView!.register(UINib.init(nibName: "devCell", bundle: nil), forCellReuseIdentifier: "devCell")
        tableView!.dataSource = self
        tableView!.delegate = self
        self.view.addSubview(tableView!)
        
        let url = "http://192.156.1.10:8080/skeeper/api/user/device/queryList"
        let parms = ["userId" : NSNumber.init(value: UserId),"ver":NSNumber.init(value: 1.0)]
        
        
                NetWorkTool.requestDataWithParam(type: .POST, urlString: url, parameters: parms, finishedCallback:{result in
        
                    print(result)
        
                })
                
//                配合设备端暂时注释
                NetWorkTool.requestDataWithParam(type: .POST, urlString:url, parameters: parms) { [self] result in
        
                    let dict = JSON(result)
                    weak var weakSelf = self
                    weakSelf?.devList = [Any]()
        

                    var objectDict = Dictionary<String, Any>.init()
                    objectDict.updateValue(NSNumber.init(value: 1), forKey: "tilvision/app/\(UserId)/sub")
        
                    for index in 0..<(dict["data"].array?.count)! {
        
                        let gggg =  dict["data"].array?[index]
        
        
        
                        let Dict = JSON(dict["data"].array?[index] as Any)
        
                        let devType:Int = Dict["deviceType"].intValue
        
        
        
                        if devType == 24 || devType == 26{
                            
                            
                            
                            weakSelf?.devList.append(Dict)
                            let mac:String = Dict["deviceCode"].stringValue
                            objectDict.updateValue(NSNumber.init(value: 1), forKey: "tilvision/device/\(mac)/pub")
        
        
                            
                            
        
                        }else{
                            weakSelf?.devList.append(Dict)
                        }
        
        
        
                    }
        
                    weakSelf!.tableView?.reloadData()
                    print(weakSelf?.devList as Any)
        
        
        
                    mqtt?.subscribeToTopic(withTopicsDic: objectDict);
        
        
                }
        
        
        
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return devList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:devCell = tableView.dequeueReusableCell(withIdentifier: "devCell", for: indexPath) as! devCell
        let dict = JSON(devList[indexPath.row])
        cell.devNameLa.text = dict["deviceName"].stringValue
        cell.devIDLa.text = dict["deviceCode"].stringValue
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 5
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return AppWidth / 320 * 249;
        
    }
    

   

}
