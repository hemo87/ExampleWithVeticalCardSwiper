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
        cardSwiper.isPreviousCardVisible = true
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
         let cell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: index) as! TestCell

        isFlipped = false
        cell.redView.alpha = 1
        return cell
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return 10
    }

    
    func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
        self.isFlipped.toggle()
        
        let cell = verticalCardSwiperView.cellForItem(at: IndexPath(row: index, section: 0)) as! TestCell
        
//        if cell.redView.alpha == 1 {
//            isFlipped = true
//        } else {
//            isFlipped = false
//        }
////        cell.redView.alpha = self.isFlipped ? 0 : 1
////        cell.blueView.alpha = self.isFlipped ? 1 : 0


//        var topView: UIView?
//
//        topView = isFlipped ? cell.redView : cell.blueView
        

            UIView.transition(with: cell, duration: 2.0, options: [ .transitionFlipFromLeft], animations: {
                print("in animation")
                
                        cell.redView.alpha = self.isFlipped ? 0 : 1
                        cell.blueView.alpha = self.isFlipped ? 1 : 0
                
            })
 
        
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
//            cell.transform = __CGAffineTransformMake(0, 0, 0, 0, 1, -1)
//        }) { (Bool) in
//
//        }
//
//        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
//            animations:^(void) {
//            view.transform = CGAffineTransformMakeScale(1, -1);
//            }
//            completion:nil];
        
        

    }

}
