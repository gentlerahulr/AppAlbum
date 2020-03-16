//
//  AlbumCell.swift
//  AppAlbum
//
//  Created by Pere-Dev on 09/03/20.
//  Copyright © 2020 Pere-Dev. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumUrl: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(model:[Any])
    {
        let a = model[0] as! NSDictionary
        
        albumTitle.text = a.value(forKey: "title") as! String
        albumUrl.text = a.value(forKey: "url") as! String
        albumImageView.setImage(url: a.value(forKey: "thumbnailUrl") as! String)
    }
    
}
