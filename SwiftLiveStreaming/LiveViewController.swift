//
//  LiveViewController.swift
//  SwiftLiveStreaming
//
//  Created by 謝飛飛 on 2019/5/20.
//  Copyright © 2019 謝飛飛. All rights reserved.
//

import UIKit
import LFLiveKit

class LiveViewController: UIViewController,LFLiveSessionDelegate
{
    @IBOutlet var status: UILabel!
    lazy var session: LFLiveSession =
    {
        let audioConfiguration = LFLiveAudioConfiguration.default()
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: .low3, outputImageOrientation: .portrait)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        
        session?.delegate = self
        session?.preView = self.view
        session?.beautyLevel = 1
//        session?.brightLevel = 1
        return session!
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func play(_ sender: Any)
    {
        if session.running
        {
            session.stopLive()
        }
        else
        {
            status.text = "處理中..."
            let stream = LFLiveStreamInfo()
            stream.url = defineURL;
            session.startLive(stream)
//            DispatchQueue.main.async
//                {
                    self.session.running = true
//            }
        }
    }
    
    @IBAction func camera(_ sender: Any)
    {
        if session.captureDevicePosition == .front
        {
            session.captureDevicePosition = .back
        }
        else
        {
            session.captureDevicePosition = .front
        }
    }
    
    @IBAction func beauty(_ sender: Any)
    {
        session.beautyFace = !session.beautyFace
    }
    
    func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState)
    {
        switch state
        {
            case .ready:
                status.text = "準備中..."
            case .pending:
                status.text = "連接中..."
            case .start:
                status.text = "已連接"
            case .stop:
                status.text = "已斷線"
            case .error:
                status.text = "異常"
            case .refresh:
                status.text = "刷新中..."
            default:
                status.text = "BUG"
        }
    }
    
    func liveSession(_ session: LFLiveSession?, debugInfo: LFLiveDebug?)
    {
        
    }
    
    func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode)
    {
        
    }
    
    @IBAction func dismiss(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
