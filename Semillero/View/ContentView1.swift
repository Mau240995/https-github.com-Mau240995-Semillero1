//
//  ContentView1.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//
import SwiftUI
struct ContentView1: View {
    @StateObject var viewModel =  UsuariosViewModel()
    @StateObject var viewModelD = DepositosViewModel()
    
    @StateObject var viewModelT = TransferenciaViewModel()

    @State var  presentAddDepositoSheet = false
        
   
  
    var body: some View {
        NavigationView {
          VStack{
              List {
                  NavigationLink(destination: MiCuenta()){
                      Text("Detalles De Cuenta")
                          .font(.title)
                  }
                  .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                  NavigationLink (destination: ListaDepositos()){
                            Text("Depositos")
                                .font(.title)
                        }
                        .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                        NavigationLink(destination: ListaTransferencias()){
                            Text("Tranferencias")
                                .font(.title)
                        }
                        .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                        NavigationLink (destination: ListaDepositos()){
                            Text("Inversiones")
                                .font(.title)
                        }
                        .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                          NavigationLink (destination: ListaDepositos()){
                              Text("Pagos")
                                  .font(.title)
                          }
                          .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                          NavigationLink (destination: ListaDepositos()){
                              Text("Cerrar Sesion")
                                  .font(.title)
                          }
                          .background(LinearGradient(gradient: Gradient(colors: [.white,.green]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))
                        }
              
          }         .navigationTitle("Banco Azteca")
              .onAppear(){
                 print("Menu")
                  self.viewModel.subcribe()
            }
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
