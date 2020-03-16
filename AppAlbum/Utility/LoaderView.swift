//
//  LoaderView.swift
//  AppAlbum
//
//  Created by Pere-Dev on 10/03/20.
//  Copyright © 2020 Pere-Dev. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
     var loader: UIActivityIndicatorView = {
           let loader = UIActivityIndicatorView()
           return loader
       }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(loader)
        loader.startAnimating()
        loader.center = self.center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stopLoader() {
        loader.stopAnimating()
    }
    
}
