//
//  ModelViewController.swift
//  AppAlbum
//
//  Created by Pere-Dev on 09/03/20.
//  Copyright © 2020 Pere-Dev. All rights reserved.
//

import Foundation
import Alamofire

protocol AlbumViewModelDelegate {
    func getDataSuccessFully()
    func failedToGetData()
}

class AlbumViewModel {
    
    var delegate:AlbumViewModelDelegate!
    var albmData = [Any]()
    
    func numberOfRowsInAlbum() -> Int
    {
        return albmData.count
    }
    
    func dataForIndexNumber(index:Int) -> Any
    {
        return albmData[index]
    }
    
    func syncApi()
    {
        ApiHandler().callApi { ablData, msg in
            guard let data = ablData
            else
            {
                self.delegate.failedToGetData()
                return
            }
            self.albmData = data
            self.delegate.getDataSuccessFully()
        }
    }
}
