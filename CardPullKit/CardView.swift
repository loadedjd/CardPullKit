//
//  CardView.swift
//  CardPullKit
//
//  Created by Jared Williams on 3/17/19.
//  Copyright © 2019 Jared Williams. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    public var cardType: CardType?
    public var isUp: Bool = false
    
    convenience init(type: CardType) {
        var frame: CGRect?
        let mainScreen = UIScreen.main.bounds
        switch type {
        case .small:
            frame = CGRect(x: 0, y: mainScreen.maxY - 50, width: mainScreen.width, height: 100)
            break
        case .info:
            frame = CGRect(x: 0, y: mainScreen.maxY - 50, width: mainScreen.width, height: 200)
            break
            
        case .large:
            frame = CGRect(x: 0, y: mainScreen.maxY - 50, width: mainScreen.width, height: 300)
            break
        }
        
        self.init(frame: frame!)
        self.cardType = type
        self.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animateUp)))
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 25
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func animateUp() {
        if self.isUp {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
                let screen = UIScreen.main.bounds
                self.frame = CGRect(x: 0.0, y: screen.maxY - 50 , width: screen.width, height: self.frame.height)
                self.layoutIfNeeded()
            }) { (completed: Bool) in
                self.isUp = false
            }
        } else {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
                let screen = UIScreen.main.bounds
                self.frame = CGRect(x: 0.0, y: screen.maxY - (self.frame.height + 30), width: screen.width, height: self.frame.height)
                self.layoutIfNeeded()
            }) { (completed: Bool) in
                self.isUp = true
            }
        }
    }
}
