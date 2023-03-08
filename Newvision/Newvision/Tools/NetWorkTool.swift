//
//  NetWorkTool.swift
//  SwiftYunTianTuan
//
//  Created by a123 on 17/7/20.
//  Copyright © 2017年 LUFEICHENG. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

enum MethodType {
    case GET
    case POST
}

class NetWorkTool: NSObject {
    
    //单例
    static let shareNetworkTool = NetWorkTool()
    
    //类方法
    class func requestDataWithParam(type: MethodType,urlString: String, parameters: [String : Any],finishedCallback : @escaping (  _ results : Any) -> ()){
            
                        
            
            let url = URL(string: urlString)!
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"

            let parameters = parameters

            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                // No-op
            }
            
            

            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJBUFAiLCJ1c2VyX2lkIjoiNjE0NiIsImlzcyI6IlNlcnZpY2UiLCJleHAiOjE2NTMxOTAzMjcsImlhdCI6MTY1MDU5ODI2N30.yUT5aJbnNo5ld_4hjIVjku64dJz7vAMlll7esXpz1S4", forHTTPHeaderField: "token")
            
           
            
            AF.request(urlRequest).responseJSON {
                
                (response) in
                switch response.result {
                
                case .success(let json):
                    print(json)
                    finishedCallback(json)
                    break
                case .failure(let error):
                    SVProgressHUD .showError(withStatus: "error")
                    print("error:\(error)")
                    break
                }
                
//                print(response.request?.httpBody)
//                print(response.request?.allHTTPHeaderFields)
                
                
            }
            
            

            
           
        }
    
    
        
}
