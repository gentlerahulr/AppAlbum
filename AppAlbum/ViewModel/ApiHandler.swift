//
//  ApiHandler.swift
//  AppAlbum
//
//  Created by Pere-Dev on 09/03/20.
//  Copyright © 2020 Pere-Dev. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ApiHandler {
    
    func callApi(complitionHandler:@escaping(_ showData:[Any]?,_ errorMsg:String?)->())
    {
        let url = Constant.baseUrl
        
        AF.request(url, method: .get, parameters:nil , encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseJSON { resp in
           // print(resp.result)
            guard let respData = resp.data
                else
            {
                complitionHandler(nil,"error")
                return
            }
            do
            {
//                                let decoder = JSONDecoder()
//                                let a = try decoder.decode(AlbumData.self, from: respData)
//                                complitionHandler([a],nil)
//
                let jsondata = try JSONSerialization.jsonObject(with: respData, options: []) as! [Any]
                complitionHandler(jsondata,nil)
            }
            catch
            {
                print(error.localizedDescription)
                complitionHandler(nil,"error")
            }
        }
            
    }
}
