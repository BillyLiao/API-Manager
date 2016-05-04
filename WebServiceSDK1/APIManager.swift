//
//  APIManager.swift
//  WebServiceSDK1
//
//  Created by 廖慶麟 on 2016/4/27.
//  Copyright © 2016年 廖慶麟. All rights reserved.
//

import UIKit
import AFNetworking

class APIManager: NSObject{
    
    let baseURL = "http://httpbin.org"
    var manager = AFHTTPSessionManager()
    

    func fetchGetResponse(completion: (r: NSDictionary?, e: NSError?) -> Void) -> Void {
        let url = "\(baseURL)/get"
    
        manager.GET(url, parameters: nil, success: { (task, responseObject) -> Void in

            guard let data = responseObject else {
                completion(r: nil, e: NSError(domain: "WebService", code: 200, userInfo: [NSLocalizedDescriptionKey : "Empty responseObject"]))
                return
            }
            let result = data
            completion(r: result as! NSDictionary, e: nil)
            
            }) { (task, e) -> Void in
                completion(r: nil, e: e)
        }
    }

    func postCustomerName(parameters: AnyObject?, completion: (r: NSDictionary?, e: NSError?) -> Void) -> Void{
        let url = "\(baseURL)/post"
        
        manager.POST(url, parameters: parameters, success: { (task, responseObject) -> Void in
            
            guard let data = responseObject else {
                completion(r: nil, e: NSError(domain: "WebService", code: 200, userInfo: [NSLocalizedDescriptionKey : "Empty responseObject"]))
                return
            }
            let result = data
            completion(r: result as! NSDictionary, e: nil)
            
            }) { (task, error) -> Void in
                completion(r: nil, e: error)
        }
    }
    
    func fetchImage(completion: (i: UIImage?, e: NSError?) -> Void) -> Void{
        let url = "\(baseURL)/image/png"
        manager.GET(url, parameters: nil, success: { (task, responseObject) -> Void in
            guard let data = responseObject else{
                completion(i: nil, e: NSError(domain: "WebService", code: 200, userInfo: [NSLocalizedDescriptionKey : "Empty responseObject"]))
                return
            }
            let result = data as! UIImage
            completion(i: result, e: nil)
            }) { (task, error) -> Void in
                completion(i: nil, e: error)
        }
    }

    
}
