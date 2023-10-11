//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Volkan Celik on 08/07/2023.
//

import Firebase
import UIKit

class AuthViewModel:NSObject,ObservableObject{
    
    @Published var didAuthenticateUser=false
    @Published var userSession:FirebaseAuth.User?
    private var tempCurrentUser:FirebaseAuth.User?
    @Published var currentUser:User?
    
    static let shared=AuthViewModel()
    
    override init(){
        super.init()
        print("DEBUG:Auth View Model did init")
        userSession=Auth.auth().currentUser
        fetchUser()
        print("Fetched user")
    }
    
    func login(withEmail email:String,password:String){
        Auth.auth().signIn(withEmail: email, password: password){result,error in
            if let error=error{
                print("DEBUG:Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            //guard let user=result?.user else {return}
            self.userSession=result?.user
            self.fetchUser()
        }
    }
    
    func register(withEmail email:String,password:String,fullname:String,username:String){
        Auth.auth().createUser(withEmail: email, password: password){result,error in
            if let error=error{
                print("DEBUG:Failed to register with error \(error.localizedDescription)")
                return
            }
            //print("DEBUG:Successfully registered user with firebase!!")
            guard let user=result?.user else {return}
            self.tempCurrentUser=user
            let data:[String:Any]=[
                "email":email,
                "username":username,
                "fullname":fullname
            ]
            COLLECTION_USERS.document(user.uid).setData(data){_ in
                self.didAuthenticateUser=true
            }
            
        }
    }
    
    func uploadProfileImage(_ image:UIImage){
        guard let uid=tempCurrentUser?.uid else {return}
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(["profileImageurl":imageUrl]){_ in
                print("DEBUG:Successfully updated user data...")
                self.userSession=self.tempCurrentUser
            }
        }
    }
    
    func signout(){
        self.userSession=nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid=userSession?.uid else {return}
        print(uid)
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            //guard let data=snapshot?.data() else {return}
            guard let user=try? snapshot?.data(as: User.self) else {return}
            self.currentUser=user
            //self.currentUser=user

            
        }
    }
    
}
