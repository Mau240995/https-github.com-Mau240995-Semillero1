//
//  ContentView.swift
//  Semillero
//
//  Created by user217123 on 6/10/22.
//

import SwiftUI
import FirebaseAuth
import AudioToolbox


struct ContentView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var menuPrincipal = false
    
    var body: some View {
        NavigationView{
           ScrollView{
                VStack(spacing: 16)
               {
                    Picker(selection: $isLoginMode, label: Text("Picker hare")){
                        Text("Login")
                        .tag(true)
                        Text("Crear Cuenta")
                            .tag(true)
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    if !isLoginMode{
                        Button{
                            
                        } label: {
                            Image(systemName: "person.fill")
                            .font(.system(size: 64))
                            .padding()
                        }
                    }
                    Group{
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                        
                    }.padding(12).background(Color.white).cornerRadius(10)
                    Button{
                        
                        handleAction()
                            
                    } label:{
                        HStack{
                            Spacer()
                            Text(isLoginMode ? "Iniciar Sesion" : "Crear Cuenta")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .font(.system(size: 14,weight: .semibold))
                           Spacer()
                        }.background(Color.blue)
                            .sheet(isPresented: self.$menuPrincipal){
                                ContentView1()
                            }

                    }.cornerRadius(10)
                    Text(self.loginStatusMessage)
                }.padding()
           }.navigationBarHidden(false)
            .navigationTitle(isLoginMode ? "Iniciar Sesion" : "Crear Cuenta")
            .background(LinearGradient(gradient: Gradient(colors: [.white,.red]),startPoint: .top,endPoint: .bottom).edgesIgnoringSafeArea(.all))   
            
        }
    }
    private func handleAction() {
        if isLoginMode{
            loginUser()
        }else{
            createNewAccount()
        }
    }
    private func loginUser(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, err in if let err = err {
                print("Error Al  Iniciar Sesion: ", err)
                self.loginStatusMessage = "Error Al Iniciar Sesion : \(err)"
                return
            }
            
            print("Inicio de Sesion Exitoso: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Inicio de Sesion Exitoso:\(result?.user.uid ?? "")"
            self.menuPrincipal.toggle()

        }
        
    }
    @State var loginStatusMessage = ""
    private func createNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, err in if let err = err {
                print("Error Al Crear el Usuario: ", err)
                self.loginStatusMessage = "Error Al Crear el usuario : \(err)"
                return
            }
            print("Usuario Creado Con exito: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Se A Creado el Usuario Con Exito:\(result?.user.uid ?? "")"
            
        }
        
    }
}

//

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
