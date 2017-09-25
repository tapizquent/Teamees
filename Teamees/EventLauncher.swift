//
//  EventLauncher.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/24/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class EventLauncher {
    func launchEvent(){
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .red
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = keyWindow.frame
            }, completion: { (completedAnimation) in
                // We will do something here later...
            })
        }
        print("JOSE: Lauching event....")
    }
}
