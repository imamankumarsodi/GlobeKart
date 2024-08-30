//
//  SplashUIV.swift
//  GlobeKart
//
//  Created by Aman Kumar on 20/10/20.
//

import SwiftUI

struct SplashUIV: View {
    static var shouldAnimate = true
    let uZoomFactor: CGFloat = 1.4
    let lineWidth:  CGFloat = 4
    let lineHeight: CGFloat = 28
    let uSquareLength: CGFloat = 12
    let uLineWidth: CGFloat = 5
    
    @State var textAlpha = 0.0
    @State var textScale: CGFloat = 1
    
    @State var coverCircleScale: CGFloat = 1
    @State var coverCircleAlpha = 0.0
    
    @State var percent = 0.0
    
    @State var uScale: CGFloat = 1
    @State var lineScale: CGFloat = 1
    @State var squareScale: CGFloat = 1
    @State var squareColor = AppColors.white_color

    var body: some View {
        ZStack {
            Image("Chimes")
                .resizable(resizingMode: .tile)
                .opacity(textAlpha)
                .scaleEffect(textScale)
            
            
            Circle()
                .fill(AppColors.app_theme)
                .frame(width: 1, height: 1, alignment: .center)
                .scaleEffect(coverCircleScale)
                .opacity(coverCircleAlpha)
            
            VStack{
                Text(ConstantTexts.splash_nameLT1)
                    .font(.custom("CocoBikeR", size:25))
                    .foregroundColor(AppColors.white_color)
                    .opacity(textAlpha)
                    .offset(x: 3, y: 0)
                    .scaleEffect(textScale)
                
                
                Text(ConstantTexts.splash_nameLT2)
                    .font(.custom("CocoBikeR", size:10))
                    .foregroundColor(AppColors.white_color)
                    .opacity(textAlpha)
                    .offset(x: 68, y: 0)
                    .scaleEffect(textScale)
            }
            
            
            GlobeO(percent: percent)
                .stroke(AppColors.white_color, lineWidth: uLineWidth)
                .rotationEffect(.degrees(-90))
                .aspectRatio(1, contentMode: .fit)
                .padding(20)
                .onAppear() {
                  self.handleAnimations()
              }
                .scaleEffect(uScale * uZoomFactor)
                .frame(width: 45, height: 45,
                       alignment: .center)
            
            
            
            Rectangle()
              .fill(squareColor)
              .scaleEffect(squareScale * uZoomFactor)
              .frame(width: uSquareLength, height: uSquareLength,
                     alignment: .center)
              .onAppear() {
                self.squareColor = AppColors.app_theme
            }
            
            Rectangle()
              .fill(AppColors.app_theme)
              .scaleEffect(lineScale, anchor: .bottom)
              .frame(width: lineWidth, height: lineHeight,
                     alignment: .center)
              .offset(x: 0, y: -22)
            
            
            Spacer()
        }
        .background(AppColors.app_theme)
        .edgesIgnoringSafeArea(.all)
    }
}



struct SplashUIV_Previews: PreviewProvider {
    static var previews: some View {
        SplashUIV()
    }
}
