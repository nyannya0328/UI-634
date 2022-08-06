//
//  Home.swift
//  UI-634
//
//  Created by nyannyan0328 on 2022/08/06.
//

import SwiftUI

struct Home: View {
    @StateObject var model = MotionManager()
  
    var body: some View {
         VStack{
            
            HStack{
                
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "person")
                        .font(.title)
                }


            }
            .foregroundColor(.white)
            
            
            Text("Exclusive tips just for you")
                .font(.custom("GabrielaStencilW00-lightit", size: 30))
                .foregroundColor(.white)
                .padding(.top)
             
             ParallaxCards()
                 .padding(.bottom,10)
             
             TabBar()
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
          .background{
           
              Color("BG")
                  .ignoresSafeArea()
          }
        
        
    }
    @ViewBuilder
    func ParallaxCards()->some View{
        
        TabView(selection: $model.currentSlider) {
            
            ForEach(sample_places){place in
                
                GeometryReader{proxy in
                    
                     let size = proxy.size
                    
                    ZStack{
                        Image(place.bgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:model.currentSlider.id == place.id ? -model.xValue * 75 : 0)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                        
                        
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:model.currentSlider.id == place.id ? overlayOffset() : 0)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                        
                       
                            
                        VStack{
                            
                            Text("Features")
                                .font(.title.weight(.light))
                               
                            
                            Text(place.placeName)
                                .font(.custom("Gabriela Stencil", size: 50))
                                .padding(.top,5)
                            
                            Button {
                                
                            } label: {
                                
                                Text("Explore")
                                    .font(.title.lowercaseSmallCaps())
                                    .padding(.horizontal)
                                    .padding(.vertical,10)
                                    .background{
                                     
                                        Rectangle()
                                            .fill(.red.opacity(0.3).gradient)
                                    }
                                    
                            }

                       
                        }
                        .foregroundColor(.white)
                        .frame(maxHeight: .infinity,alignment: .top)
                        .padding(.top,30)
                        
                        
                        
                    }
                    .frame(width: size.width,height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
               
                   
                    
                }
                .tag(place)
             
                
                
            }
            
            
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear{model.detectMotion()}
        .onDisappear{model.stopMotionUpdates()}
        
        
    
        
        
        
    }
    func overlayOffset()->CGFloat{
        
        let offset = model.xValue * 7
        
        if offset > 0{
            
            return offset > 8 ? 8 : offset
        }
        
        return -offset > 8 ? 0 : -offset
        
    }
   @ViewBuilder
    func TabBar()->some View{
        
   
        HStack(spacing:0){
            
            
            ForEach(["house.fill","suit.heart","magnifyingglass"],id:\.self){image in
                
                
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .center)
            
            
        }
     
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
