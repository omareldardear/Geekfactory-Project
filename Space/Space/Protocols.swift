//
//  Protocols.swift
//  ITunesSearch
//
//  Created by Omar ElDardear on 5/24/17.
//  Copyright © 2017 Omar ElDardear. All rights reserved.
//

import Foundation

protocol WebServiceProtocol : class{
    
    func RequestStarted()
    func RequestFinished(data : Data )
    func Error()
    
}
