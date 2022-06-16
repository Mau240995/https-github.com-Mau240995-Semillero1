//
//  MenuPrincipal.swift
//  PRUEBA
//
//  Created by user217123 on 6/7/22.
//

import SwiftUI

struct MenuPrincipal: View {

    
  private let emojiList: [EmojiItem] = [
    EmojiItem(
      emoji: "👾",
      name: "Depositos", description: ""),
    EmojiItem(
      emoji: "🚀",
      name: "Transferencias",
      description: ""),
    EmojiItem(
      emoji: "🧸",
      name: "Movimientos",
      description: ""),
    EmojiItem(
      emoji: "👩🏽‍💻",
      name: "Inverciones",
      description: ""),
    EmojiItem(
      emoji: "🗺",
      name: "Cerrar Sesion",
      description: ""),
  ]
    
    var body: some View {
        NavigationView{
            List(emojiList) { emojiItem in
                NavigationLink(destination: DetailsView(emojiItem: emojiItem)) {
                  HStack {
                      EmojiCircleView(emojiItem: emojiItem)
                      Text(emojiItem.name)
                  }
                  
                }
                .background(LinearGradient(gradient: Gradient(colors: [.white,.green.opacity(3)]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                
            }.navigationTitle("Banco Azteca").navigationBarHidden(false)
              
        }
    }
}

struct DetailsView: View {
    @State var deposito: String = ""
    @State var transferencia: String = ""
    @State var cuenta: String = ""
    @State var saldoDisponible = ""
    

    let emojiItem: EmojiItem
    
    var body: some View {
        VStack (alignment: .leading) {
        HStack {
          EmojiCircleView(emojiItem: emojiItem)
               // .padding(.trailing, 5)
              
        Text(emojiItem.name)
          //.font(.largeTitle)
          .bold()
 
      }
            
            if (emojiItem.name == "Depositos"){
                        VStack{
                Text("Cantidad Que Desea Depositar").padding(30)
                TextField("Cantidad",text: $deposito).keyboardType(.default).disabled(true).autocapitalization(.none).padding(10)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(6)
                    .padding(.horizontal, 90)
                
                    .onChange(of: deposito, perform: {
                        value in print("Deposito value in \(value)")
                
                    })
                Button(action: {
                        
                }){
                Text("Aceptar")
                    .multilineTextAlignment(.center)
                    .padding(6).font(.system(size:30)).foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
        }
          if (emojiItem.name == "Transferencias"){
            VStack{Text("Numero de Cuenta").padding(30)
                TextField("Numero de Cuenta",text: $cuenta).keyboardType(.default).disabled(true).autocapitalization(.none).padding(10)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(6)
                    .padding(.horizontal, 90)
                
                    .onChange(of: cuenta, perform: {
                        value in print("Numero de Cuenta value in \(value)")
                
                    })
                Text("Cantidad Que Desea Transferir").padding(30)
                TextField("Cantidad",text: $transferencia).keyboardType(.default).disabled(true).autocapitalization(.none).padding(10)
                    .font(.headline)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(6)
                    .padding(.horizontal, 90)
                
                    .onChange(of: transferencia, perform: {
                        value in print("Transferencia value in \(value)")
                
                    })
                Button(action: {
                        
                }){
                Text("Aceptar")
                    .multilineTextAlignment(.center)
                    .padding(6).font(.system(size:30)).foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
        }
                    //.padding*(
            
            if (emojiItem.name == "Historial"){
               
                VStack{
                    //Text(cuenta.idcuenta)
                    TextField("Numero de Cuenta",text: $cuenta).keyboardType(.default).disabled(true).autocapitalization(.none).padding(10)
                        //.font(.headline)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(6)
                       // .padding(.horizontal, 90)
                        .onChange(of: transferencia, perform: {
                            value in print("Transferencia value in \(value)")
                    
                        })
                }
            }
      Spacer()
    }
////
        ///
    .padding()
    .navigationBarTitle(Text(emojiItem.name), displayMode: .inline)
        .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
        
    }
}

struct EmojiCircleView: View {
  let emojiItem: EmojiItem
  
  var body: some View {
    ZStack {
      Text(emojiItem.emoji)
        .shadow(radius: 3)
        .font(.largeTitle)
        .frame(width: 65, height: 65)
        .overlay(
          Circle().stroke(Color.purple, lineWidth: 3)
        )
    }
  }
   
}

struct EmojiItem: Identifiable {
  let id = UUID()
  let emoji: String
  let name: String
  let description: String
}

struct MenuPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MenuPrincipal()
    }
}
