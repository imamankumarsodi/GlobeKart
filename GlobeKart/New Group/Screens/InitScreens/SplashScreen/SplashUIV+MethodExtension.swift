//
//  SplashUIV+MethodExtension.swift
//  GlobeKart
//
//  Created by Aman Kumar on 20/10/20.
//

import Foundation
import SwiftUI

extension SplashUIV {
  var uAnimationDuration: Double { return 1.0 }
  var uAnimationDelay: Double { return  0.2 }
  var uExitAnimationDuration: Double { return 0.3 }
  var finalAnimationDuration: Double { return 0.4 }
  var minAnimationInterval: Double { return 0.1 }
  var fadeAnimationDuration: Double { return 0.4 }
  
  func handleAnimations() {
    runAnimationPart1()
    runAnimationPart2()
    runAnimationPart3()
    if SplashUIV.shouldAnimate {
      restartAnimation()
    }
  }
  
  func runAnimationPart1() {
    withAnimation(.easeIn(duration: uAnimationDuration)) {
      percent = 1
      uScale = 5
      lineScale = 1
    }
    
    withAnimation(Animation.easeIn(duration: uAnimationDuration).delay(0.5)) {
      textAlpha = 1.0
    }
    
    let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay
    DispatchQueue.main.asyncAfter(deadline: deadline) {
      withAnimation(.easeOut(duration: self.uExitAnimationDuration)) {
        self.uScale = 0
        self.lineScale = 0
      }
      withAnimation(.easeOut(duration: self.minAnimationInterval)) {
        self.squareScale = 0
      }
      
      withAnimation(Animation.spring()) {
        self.textScale = self.uZoomFactor
      }
    }
  }
  
  func runAnimationPart2() {
    let deadline: DispatchTime = .now() + uAnimationDuration + uAnimationDelay + minAnimationInterval
    DispatchQueue.main.asyncAfter(deadline: deadline) {
      self.squareColor = Color.white
      self.squareScale = 1
      withAnimation(.easeOut(duration: self.fadeAnimationDuration)) {
        self.coverCircleAlpha = 1
        self.coverCircleScale = 1000
      }
    }
  }
  
  func runAnimationPart3() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2*uAnimationDuration) {
      withAnimation(.easeIn(duration: self.finalAnimationDuration)) {
        self.textAlpha = 0
        self.squareColor = AppColors.app_theme
      }
    }
  }
  
  func restartAnimation() {
    let deadline: DispatchTime = .now() + 2*uAnimationDuration + finalAnimationDuration
    DispatchQueue.main.asyncAfter(deadline: deadline) {
      self.percent = 0
      self.textScale = 1
      self.coverCircleAlpha = 0
      self.coverCircleScale = 1
      self.handleAnimations()
    }
  }
}
