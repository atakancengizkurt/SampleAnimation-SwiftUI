//
//  ContentView.swift
//  SampleAnimation-SwiftUI
//
//  Created by Atakan Cengiz KURT on 17.05.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isClicked = false
  var body: some View {
    GeometryReader{
      geometry in
      
      ZStack{
        Button(action: {
          self.animation()
        }, label: {
          Image(systemName: isClicked ? "gobackward" : "plus.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60, alignment: .center)
        })
        .rotationEffect(isClicked ? .degrees(135): .degrees(0))
        .animation(.spring())
        .offset(x: 0, y: isClicked ? geometry.size.height - 400 : geometry.size.height - 200)
        
        Color
          .black
          .frame(width: 100, height: 100, alignment: .center)
          .rotation3DEffect(
            isClicked ? .degrees(360) : .degrees(0),
            axis: (x: 0.0, y: 1.0, z: 1.0)
          )
          .offset(x: 0, y: isClicked ? geometry.size.height - 300: geometry.size.height - 100)
        
          .animation(.linear(duration: 1.0))
        
        
      }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
    }
  }
  
  func animation(){
    self.isClicked.toggle()
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
