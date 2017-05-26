//
//  WebService.swift
//  ITunesSearch
//
//  Created by Omar ElDardear on 5/23/17.
//  Copyright © 2017 Omar ElDardear. All rights reserved.
//

import Foundation

class WebService{
    
    
    
    
    static func GETRequest ( mURL: URL , mDelegate : WebServiceProtocol){
        let session = URLSession(configuration: .default)
        var mRequest = URLRequest(url: mURL)
        mRequest.httpMethod = "GET"
        mRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let mTask = session.dataTask(with: mURL, completionHandler: {
            data, response, error in
            
            if let error = error as NSError?, error.code == -999 {
               mDelegate.Error()
                return   // Search was cancelled
            }
            
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let jsonData = data{
                DispatchQueue.main.async {
                    mDelegate.RequestFinished(data: jsonData)
                }
                return
            
            }
            else {
                mDelegate.Error()
            }

        })
        mDelegate.RequestStarted()
        mTask.resume()
    }
    
}
