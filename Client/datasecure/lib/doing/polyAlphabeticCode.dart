class PolyAlphabetic{
  String text;

  PolyAlphabetic(String text){
    this.text=text;
  }

  String getText(){
    return this.text;
  }

  void setText(String text){
    this.text=text;
  }

  String PolyAlphabeticEncrypt(String text){
      String cipherTextOne = "TMKGOYDSIPELUAVCRJWXZNHBQF";
      String cipherTextTwo = "DCBAHGFEMLKJIZYXWVUTSRQPON";
      String output="";

      int lengtChipherTextOne = cipherTextOne.length;
      int lengthChipherTextTwo = cipherTextTwo.length;
      int lengthText = text.length;
      int num;

      for(int i=0;i<lengthText;i++){
        num = num=((text.codeUnitAt(i)-65))%26;
        if(i%2==0){
          output+=cipherTextOne[num];
        }else{
          output+=cipherTextTwo[num];
        }
      }
      return output;
  }
  String PolyAlphabeticDecrypt(String text){
    String fix = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String cipherTextOne = "TMKGOYDSIPELUAVCRJWXZNHBQF";
    String cipherTextTwo = "DCBAHGFEMLKJIZYXWVUTSRQPON";
    String output="";

    int lengtChipherTextOne = cipherTextOne.length;
    int lengthChipherTextTwo = cipherTextTwo.length;
    int lengthText = text.length;
    int num;

    for(int i=0;i<lengthText;i++){

      if(i%2==0){
        for(int j=0;j<lengtChipherTextOne;j++){
          if(text[i]==cipherTextOne[j]){
            num=j;
            output+=fix[num];
            print(fix[num]);
            break;
          }
        }
      }else{
        for(int k=0;k<lengthChipherTextTwo;k++){
          if(text[i]==cipherTextTwo[k]){
            num=k;
            output+=fix[num];
            print(fix[num]);
            break;
          }
        }
      }

    }
    return output;

  }
}