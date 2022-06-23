
//
//  Created by user217123 on 6/13/22.
//
import SwiftUI

struct DepositoDetailsView: View {
    
    @Environment (\.presentationMode)  var presentationMode
    @State var presentEditDepositoSheet = false
    
    private func  editButton(action: @escaping () -> Void ) -> some View {
        Button(action: {action() }) {
            Text("Edit")
        }
    }
    var deposito  : Deposito
    
    var body: some View {
        Form {
            Section(/*header: Text("Deposito")*/){
                Text(deposito.cantidad)
                Text(deposito.descripcion)
                
            }
        }
        .navigationBarTitle("Deposito: \(deposito.descripcion)")        .navigationBarItems(trailing: editButton {
            self.presentEditDepositoSheet.toggle()
        })
        .onAppear(){
            print("Detalles Deposito\(self.deposito.descripcion)")
        }
        .onDisappear(){
            print(" Detalles Depositos .onDispacher")
        }
        .sheet(isPresented: self.$presentEditDepositoSheet){
            
            DepositoEditView(viewModelD: DepositoViewModel(deposito: deposito),mode: .edit)
                             
            }
    }
}

struct DepositoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let deposito = Deposito(cantidad: "Cantidad", descripcion: "Descripcion")
        return
        NavigationView{
            DepositoDetailsView(deposito: deposito)
        }
    }
}
