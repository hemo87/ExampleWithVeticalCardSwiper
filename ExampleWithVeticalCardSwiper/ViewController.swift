//
//  ViewController.swift
//  ExampleWithVeticalCardSwiper
//
//  Created by Marc Heminsley on 08/04/2019.
//  Copyright © 2019 MarcHeminsley. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class ViewController: UIViewController, VerticalCardSwiperDatasource, VerticalCardSwiperDelegate {

    @IBOutlet var cardSwiper: VerticalCardSwiper!
    
    var isFlipped = false
    override func viewDidLoad() {
        super.viewDidLoad()

        cardSwiper.datasource = self
        cardSwiper.delegate = self
        cardSwiper.register(nib: UINib(nibName: "TestCell", bundle: nil), forCellWithReuseIdentifier: "TestCell")
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
         let cell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: index) as! TestCell
        return cell
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return 10
    }

    
    func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
        self.isFlipped.toggle()
        
        let cell = verticalCardSwiperView.cellForItem(at: IndexPath(row: index, section: 0)) as! TestCell
        
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: cell, duration: 1.0, options: transitionOptions, animations: {
            print("in animation")
            cell.redView.alpha = self.isFlipped ? 1 : 0
            
        })

    }

}
