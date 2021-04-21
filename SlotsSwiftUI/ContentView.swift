//
//  ContentView.swift
//  SlotsSwiftUI
//
//  Created by Andrei Cirlan on 21.04.2021.
//

import SwiftUI

var fruits = ["apple","star","cherry"]

struct ContentView: View {
    
    @State var credit = 1000
    
    @State var image1 = fruits[0]
    @State var image2 = fruits[1]
    @State var image3 = fruits[2]
    
    var body: some View {
        
        ZStack{
            Spacer()
            VStack{
                Spacer()
                Text("Swift UI Slots")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                Spacer()
                let creditString = String(credit)
                HStack{
                    Text("Credits: ")
                    .font(.subheadline)
                    Text(creditString)
                }
                Spacer()
                HStack{
                    Spacer()
                    Image(image1)
                        .resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(image2).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                    Image(image3).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    // generate a random number between 2 and 14
                    let number1 = Int.random(in: 0...2)
                    let number2 = Int.random(in: 0...2)
                    let number3 = Int.random(in: 0...2)
                    
                    image1 = fruits[number1]
                    image2 = fruits[number2]
                    image3 = fruits[number3]
                    if number1 == number2 && number2 == number3 {
                        credit += 1000
                    } else {
                        credit -= 100
                    }
                    
                }, label: {
                    Text("Spin")
                        .foregroundColor(Color.white)
                })
                .padding(.all, 13.0)
                .frame(width: 150.0)
                .background(Color.red)
                .cornerRadius(/*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }.background(Color.white).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
