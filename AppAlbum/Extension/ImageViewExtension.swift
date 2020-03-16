//
//  ImageViewExtension.swift
//  AppAlbum
//
//  Created by Pere-Dev on 09/03/20.
//  Copyright © 2020 Pere-Dev. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

extension UIImageView
{
    func setImage(url:String)
    {
        AF.request(url).response { response in
            self.image = UIImage(data: response.data!)
        }
    }
}
