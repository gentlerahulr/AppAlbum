//
//  ViewController.swift
//  AppAlbum
//
//  Created by Pere-Dev on 09/03/20.
//  Copyright © 2020 Pere-Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model = AlbumViewModel()
    let loader = LoaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        model.delegate = self
      //  view.addSubview(loader)
        loader.center = view.center
        model.syncApi()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowsInAlbum()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let bundle =
        let cell = Bundle.main.loadNibNamed("AlbumCell", owner: self, options: nil)?[0] as! AlbumCell
        cell.setData(model: [model.albmData[indexPath.row]])
        return cell
    }
    
}

extension ViewController : AlbumViewModelDelegate
{
    func getDataSuccessFully() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.loader.stopLoader()
            self.loader.removeFromSuperview()
        }
    }

    func failedToGetData() {
        print("error")
    }
}


