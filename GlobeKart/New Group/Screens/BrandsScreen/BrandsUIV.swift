//
//  BrandsUIV.swift
//  GlobeKart
//
//  Created by Aman Kumar on 08/11/20.
//

import SwiftUI

struct BrandsUIV: View {
    var body: some View {
           
        Home()
    }
}

struct BrandsUIV_Previews: PreviewProvider {
    static var previews: some View {
        BrandsUIV()
    }
}

struct Home : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    
    @State var data = [

        Card(id: 0, img: "App_BG_icon_bg", name: "Jill", show: false),
        Card(id: 1, img: "App_BG_icon_bg", name: "Emma", show: false),
        Card(id: 2, img: "App_BG_icon_bg", name: "Catherine", show: false),
        Card(id: 3, img: "App_BG_icon_bg", name: "iJustine", show: false),
        Card(id: 4, img: "App_BG_icon_bg", name: "Juliana", show: false),
        Card(id: 5, img: "App_BG_icon_bg", name: "Lilly", show: false),
        Card(id: 6, img: "App_BG_icon_bg", name: "Emily", show: false)

    ]
    
    var body : some View{
        
        NavigationView{
            
            VStack{
                
                Spacer()
                
                HStack(spacing: 15){
                    
                    ForEach(data){i in
                        
                        CardView(data: i)
                        .offset(x: self.x)
                        .highPriorityGesture(DragGesture()
                        
                            .onChanged({ (value) in
                                
                                if value.translation.width > 0{
                                    
                                    self.x = value.location.x
                                }
                                else{
                                    
                                    self.x = value.location.x - self.screen
                                }
                                
                            })
                            .onEnded({ (value) in

                                if value.translation.width > 0{
                                    
                                    
                                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                        
                                        
                                        self.count -= 1
                                        self.updateHeight(value: Int(self.count))
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                                else{
                                    
                                    
                                    if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.data.count - 1){
                                        
                                        self.count += 1
                                        self.updateHeight(value: Int(self.count))
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                            })
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
                
                Spacer()
            }
            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("Carousel List")
            .animation(.spring())
            .onAppear {
                
                self.op = ((self.screen + 15) * CGFloat(self.data.count / 2)) - (self.data.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                
                self.data[0].show = true
            }
        }
    }
    
    func updateHeight(value : Int){
        
        
        for i in 0..<data.count{
            
            data[i].show = false
        }
        
        data[value].show = true
    }
}

struct CardView : View {
    
    var data : Card
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            
            Image(data.img)
            .resizable()
            
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
            
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 500 : 440)
        .background(Color.white)
        .cornerRadius(25)
    }
}

struct Card : Identifiable {
    
    var id : Int
    var img : String
    var name : String
    var show : Bool
}
