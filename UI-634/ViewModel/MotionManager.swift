//
//  MotionManager.swift
//  UI-634
//
//  Created by nyannyan0328 on 2022/08/06.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    
    @Published var manager : CMMotionManager = .init()
    @Published var currentSlider : Place = sample_places.first!
   
    
    @Published var xValue : CGFloat = 0
    
    
    func detectMotion(){
        
        if !manager.isDeviceMotionActive{
            
            manager.deviceMotionUpdateInterval = 1/40
            
            manager.startDeviceMotionUpdates(to: .main) { [weak self] motion,err  in
                
                if let attiude = motion?.attitude{
                    
                    self?.xValue = attiude.roll
                    print(attiude.roll)
                }
                
            }
            
        }
        
        
        
    }
    
    func stopMotionUpdates(){
        
        manager.stopDeviceMotionUpdates()
        
        
    }
}


