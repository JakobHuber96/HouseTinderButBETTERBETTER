//
//  ContentView.swift
//  HouseTinderButBETTERBETTER
//
//  Created by Huber, Jakob - Student on 4/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var  path = NavigationPath()
    
    var body: some View {
        NavigationView {
            VStack{
                //card stack
                
                TopLine()
                
                //card stack
                
                ZStack {
                    ForEach(Card.data.reversed()) {card in
                        CardView(card: card).padding(8)
                    }
                }
                
                HStack (spacing: 5){
                    Button(action: {}) {
                        Image("refresh_circle").resizable().aspectRatio(contentMode: .fit ).frame(height:65)
                    }
                    
                    Button(action: {}) {
                        Image("dismiss_circle").resizable().aspectRatio(contentMode: .fit ).frame(height: 75)
                    }
                    
                    Button(action: {}) {
                        Image("bookmarkIcon").resizable().aspectRatio(contentMode: .fit ).frame(height: 65)
                    }
                    
                    Button(action: {}) {
                        Image("like_circle") .resizable().aspectRatio(contentMode: .fit ).frame(height: 75)
                    }
                    
                    Button(action: {}) {
                        Image("boost_circle").resizable().aspectRatio(contentMode: .fit ).frame(height: 65)
                    }
                }
            }.zIndex(1.0)
        }
    }
    
        
        
        
        
        
    struct CardView: View {
        @State var card: Card
        let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0)])
        var body: some View {
           ZStack(alignment: .topLeading){
                Image(card.imageName).resizable()
                LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
                
                
                VStack(alignment: .leading ){
                    VStack(alignment: .leading)
                    {
                        Spacer()
                        HStack{
                            Text(card.name).font(.title).fontWeight(.bold)
                            
                            
                            
                        }
                        Text(String(card.age)).font(.title)
                    }
                    Text(card.bio)
                    
                }
                .padding()
                .foregroundColor(.white)
                
                HStack{
                    Image("like")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:150)
                        .opacity(Double(card.x/10 - 1))
                    Spacer()
                    Image("nope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:150)
                        .opacity(Double(card.x/10 * -1 - 1))
                }
            }
            .cornerRadius(8)
            .offset(x: card.x, y: card.y)
            .rotationEffect(.init(degrees: card.degree))
            .gesture (
                
                DragGesture()
                
                    .onChanged { value in
                        
                        withAnimation(.default) {
                            card.x = value.translation.width
                            card.y = value.translation.height
                            card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                            
                        }
                        
                        
                    }
                    .onEnded{ value in
                        
                        withAnimation(.interpolatingSpring(mass:1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                            switch value.translation.width{
                            case 0...100:
                                card.x = 0; card.degree = 0; card.y = 0
                            case let x where x > 100:
                                card.x = 500; card.degree = 12
                            case (-100)...(-1):
                                card.x = 0 ; card.degree = 0; card.y = 0
                            case let x where x < -100:
                                card.x = -500; card.degree = -12
                            default: card.x = 0; card.y = 0
                                
                            }
                            
                        }
                        
                        
                    }
                
            )
        }
        
        
    }
    
    struct TopLine: View {
        
        var body: some View {
            
            
            HStack {
                
        
                NavigationLink(destination: Favorites_menu()) {
                    Image("chats")
                    
                }
            }
            
        }
        
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
    }


