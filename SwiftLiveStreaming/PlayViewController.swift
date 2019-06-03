//
//  PlayViewController.swift
//  SwiftLiveStreaming
//
//  Created by 謝飛飛 on 2019/5/20.
//  Copyright © 2019 謝飛飛. All rights reserved.
//

import UIKit
import IJKMediaFramework

class PlayViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let ijk = IJKFFMoviePlayerController.init(contentURL: URL.init(string: defineURL), with: nil)
        if let ijk = ijk
        {
            ijk.view.frame = self.view.bounds
            self.view.addSubview(ijk.view)
            ijk.prepareToPlay()
        }
    }

}
