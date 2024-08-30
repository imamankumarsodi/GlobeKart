//
//  MyAccountUIV.swift
//  GlobeKart
//
//  Created by Aman Kumar on 08/11/20.
//

import SwiftUI

struct MyAccountUIV: View {
    @State var dragAmount = CGSize.zero

    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotation3DEffect(.degrees(-Double(self.dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(Double(self.dragAmount.height / 20)), axis: (x: 1, y: 0, z: 0))
                    .offset(self.dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    self.dragAmount = .zero
                                }
                            }
                    )
            }
        }
    }
}

struct MyAccountUIV_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountUIV()
    }
}
