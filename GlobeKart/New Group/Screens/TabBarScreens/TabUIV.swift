//
//  TabUIV.swift
//  GlobeKart
//
//  Created by Aman Kumar on 23/10/20.
//

import SwiftUI

struct TabUIV: View {
    //  @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView{
            HomeUIV()
                .tabItem {
                    Image(systemName: "house")
                    Text(ConstantTexts.homeTBT)
                }
            CategoriesUIV()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text(ConstantTexts.categoriesTBT)
                }
            BrandsUIV()
                .tabItem {
                    Image(systemName: "tag")
                    Text(ConstantTexts.brandsTBT)
                }
            MyAccountUIV()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text(ConstantTexts.myAccountTBT)
                }
            MyBagUIV()
                .tabItem {
                    Image(systemName: "bag")
                    Text(ConstantTexts.myBagTBT)
                }
        }.navigationBarBackButtonHidden(true)
        .onAppear() {
            UITabBar.appearance().barTintColor = .cyan
            }
        
        
    }
}

struct TabUIV_Previews: PreviewProvider {
    static var previews: some View {
        TabUIV()
    }
}
