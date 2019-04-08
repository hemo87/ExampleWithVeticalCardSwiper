//
//  File.swift
//  ExampleWithVeticalCardSwiper
//
//  Created by Marc Heminsley on 08/04/2019.
//  Copyright © 2019 MarcHeminsley. All rights reserved.
//

import Foundation
import UIKit

class CardCellTest: CardCell {

    @IBOutlet var redView: UIView!
    @IBOutlet var blueView: UIView!
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 12
        
        super.layoutSubviews()
    }
}
