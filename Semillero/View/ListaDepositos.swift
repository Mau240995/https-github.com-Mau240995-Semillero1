//
//  ListaDepositos.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//


import SwiftUI

struct ListaDepositos: View {
    @StateObject var viewModel =  CuentasViewModel()
    @StateObject var viewModelD = DepositosViewModel()
    @State var  presentAddDepositoSheet = false
    
    private var addButton: some  View {
        
        Button (action:{
            self.presentAddDepositoSheet.toggle()
        }){
            Image(systemName: "plus")
        }
    }
   
    private func depositoRowView(deposito: Deposito) -> some View{
        NavigationLink(destination: DepositoDetailsView(deposito: deposito)){
            VStack(alignment: .leading){
                Text("Cantidad $")
                Text(deposito.descripcion)
                Text("Descripcion:")
                Text(deposito.cantidad)
            }
        }
    }
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModelD.depositos){ deposito in
                    depositoRowView(deposito: deposito)
                }
            }
            .navigationTitle(" Depositos ")
            .navigationBarItems(trailing: addButton)
            .onAppear(){
               print("Cuentas List View")
                self.viewModel.subcribe()
                self.viewModelD.subcribe()
            }
            .sheet(isPresented: self.$presentAddDepositoSheet) {
                DepositoEditView()
            }
        }
    }
}

struct ListaDepositos_Previews: PreviewProvider {
    static var previews: some View {
        ListaDepositos()
    }
}
