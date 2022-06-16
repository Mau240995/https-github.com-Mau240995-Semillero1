//
//  ContentView1.swift
//  Semillero
//
//  Created by user217123 on 6/12/22.
//

import SwiftUI

struct ContentView1: View {
    @StateObject var viewModel =  CuentasViewModel()
    @StateObject var viewModelD = DepositosViewModel()
    
    @StateObject var viewModelT = TransferenciaViewModel()
    
    @State var  presentAddDepositoSheet = false
        
    private func cuentaRowView(cuenta: Cuenta) -> some View{
            VStack(alignment: .leading){
                Text("Numero de Cuenta:")
                Text(cuenta.idCuenta)
                Text("Saldo Disponible $")
                Text(cuenta.saldo)
        }
    }
  
    var body: some View {
        NavigationView {
          VStack{
              List {
                    ForEach(viewModel.cuentas){ cuenta in cuentaRowView(cuenta: cuenta)
                            .font(.largeTitle)
                            .frame(width: 350)
                                        .lineLimit(2)
                                        .lineSpacing(10)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 5)                    }
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
