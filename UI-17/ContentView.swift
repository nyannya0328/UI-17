//
//  ContentView.swift
//  UI-17
//
//  Created by にゃんにゃん丸 on 2020/10/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        
            
            Home()
                .navigationBarTitle("girls",displayMode: .inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    
    var columes = Array(repeating : GridItem(.flexible(),spacing : 15),count : 2)
    
    @ObservedObject var delegate = imagedate()
    
    var body: some View{
        
        VStack {
            ScrollView(){
                
                LazyVGrid(columns: columes,spacing : 15){
                    ForEach(delegate.imagedates){ image in
                        
                        Image(image.image).resizable()
                            .frame(height: 150)
                            .cornerRadius(30)
                            
                        
                    }
                    
                    
                    
                }
                
                .padding(.all)
            }
            
            ZStack{
                
                if delegate.selectimage.isEmpty{
                    
                    
                    Text("Drop").font(.system(size: 30))
                }
            
            
        }
        
        
            .frame(height: delegate.selectimage.isEmpty ? 100 : nil)
            
            
            
        }
        
        
        .background(Color.red.opacity(0.1))
        
        
        .edgesIgnoringSafeArea(.bottom)
        
    }
   
    
    
}




class imagedate : ObservableObject{
    @Published var imagedates : [Img] = [
        Img(id: 0, image: "image"),
        Img(id: 1, image: "image2"),
        Img(id: 2, image: "image3"),
        Img(id: 3, image: "image4"),
        Img(id: 4, image: "image5"),
        Img(id: 5, image: "image5"),
        Img(id: 6, image: "image7"),
        Img(id: 7, image: "image7"),
        Img(id: 8, image: "image7"),
        Img(id: 9, image: "image7")
    
    
    
    ]
    
    @Published var selectimage : [Img] = []
    
    
    
}


struct Img : Identifiable {
    var id : Int
    var image : String
}
