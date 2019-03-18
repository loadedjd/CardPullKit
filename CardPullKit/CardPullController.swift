//
//  CardPullController.swift
//  CardPullKit
//
//  Created by Jared Williams on 3/17/19.
//  Copyright © 2019 Jared Williams. All rights reserved.
//

import UIKit

open class CardPullController: UIViewController {
    
    var cardView: CardView?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardView = CardView(type: .info)
        self.view.addSubview(self.cardView!)
    }
    
    open func setCardType(type: CardType) {
        self.cardView = CardView(type: type)
    }
}
