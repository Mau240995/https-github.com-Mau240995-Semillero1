//
//  TransferenciaDetailsView.swift
//  Semillero
//
//  Created by user217123 on 6/13/22.
//
import SwiftUI

struct TransferenciaDetailsView: View {
    
    @Environment (\.presentationMode)  var presentationMode
    @State var presentEditTransferenciaSheet = false
    
    private func  editButton(action: @escaping () -> Void ) -> some View {
        Button(action: {action() }) {
            Text("Edit")
        }
    }
    var transferencia: Transferencia
    
    var body: some View {
        Form {
            Section(header: Text("Transferencia")){
                Text(transferencia.cantidad)
                Text(transferencia.descripcion)
                Text(transferencia.numeroCuenta)
            }
        }
        .navigationBarTitle(transferencia.descripcion)
        .navigationBarItems(trailing: editButton {
            self.presentEditTransferenciaSheet.toggle()
        })
        .onAppear(){
            print("transferenciadetails.onapper()\(self.transferencia.descripcion)")
        }
        .onDisappear(){
            print("Transferencias details.onDispacher")
        }
        .sheet(isPresented: self.$presentEditTransferenciaSheet){
            TransferenciaEditView(viewModelT: TransferenciaViewModel(transferencia: transferencia),modeT: .edit)
        }
    }
}

struct TransferenciaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let transferencia = Transferencia(cantidad: "Cantidad", descripcion: "Descripcion", numeroCuenta: "Numero de Cuenta")
        return
        NavigationView{
            TransferenciaDetailsView(transferencia: transferencia)
        }
    }
}
