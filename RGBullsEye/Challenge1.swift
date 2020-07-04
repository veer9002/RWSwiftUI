//
//  Challenge1.swift
//  RGBullsEye
//
//  Created by Manish Sharma on 27/06/20.
//  Copyright © 2020 Manish Sharma. All rights reserved.
//

import SwiftUI

struct Challenge1: View {
    let targetValue = Int.random(in: 1...100)
    @State var currentValue = 50.0
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(targetValue) ")
            HStack {
                Text("0").foregroundColor(.red)
                Slider(value: $currentValue, in: 0.0...100.0, step: 1.0)
                Text("100").foregroundColor(.green)
            }.padding(.horizontal)
            Button(action: { self.showAlert = true }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your score"), message: Text(String(computeScore())))
            }.padding()
         }
        }
        .environment(\.colorScheme, .dark)
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - Int(currentValue))
        return 100 - difference
    }
}

struct Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Challenge1()
            .previewLayout(.fixed(width: 568, height: 320))
//            .environment(\.colorScheme, .dark)
    }
}
