//
//  ContentView.swift
//  GlobeKart
//
//  Created by Aman Kumar on 20/10/20.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Varibles for
    @State private var showSplash = Bool()
    
    let tabView = TabUIV()
    var body: some View {
        NavigationView {
            ZStack{
                SplashUIV()
                    .opacity(showSplash ? 0 : 1)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            SplashUIV.shouldAnimate = false
                            withAnimation() {
                                self.showSplash = true
                            }
                        }
                    }
                NavigationLink(destination: tabView,
                               isActive: $showSplash,
                               label: {EmptyView()})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
