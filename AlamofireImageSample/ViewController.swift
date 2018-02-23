//
//  ViewController.swift
//  AlamofireImageSample
//
//  Created by Pandey on 28/02/17.
//  Copyright © 2017 Pandey. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    let imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 4,
        imageCache: AutoPurgingImageCache()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func downloadImageBtnPressed(_ sender: Any) {
        
        let urlRequest = URLRequest(url: URL(string: "https://www.dropbox.com/s/5o1h8lr3aejnstj/bt_book_now%403x.png?dl=1")!)
        
        imageDownloader.download(urlRequest) { response in
            if let image = response.result.value {
                self.imgView.image = image
            }
        }
    }
}

