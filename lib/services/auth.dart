import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;// creates a instance of
          //firebaseAuth class

  //create obj based on Firebase user object
  CusUser _userFromFirebaseUser(User user){
    return user != null ? CusUser(uid : user.uid ) : null;
  }

  // auth change user system
  Stream<CusUser> get user{
    return _auth.authStateChanges()
        // .map((User user) => _userFromFirebaseUser(user));
          .map(_userFromFirebaseUser);// same as the above commented
  }


  //A method for signIn anonymously
  Future signInAnon() async{
   try {
     UserCredential result= await _auth.signInAnonymously();
     User user = result.user;
     return _userFromFirebaseUser(user);
   }
   catch(e){
        print(e.toString());
        return null;
   }
  }
  //method to Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //signOut method
  Future sgnOut() async{
    try{
      return await _auth.signOut();
  }catch(e){
      print(e.toString());
      return null;
    }
  }

}