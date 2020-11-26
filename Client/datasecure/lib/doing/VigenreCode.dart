class Vigenre {
  String text;
  String key;

  Vigenre(String text,String key){
    this.text=text;
    this.key=key;
  }

  String VigenereEncrypt(String text, String key){
    int lengthText = text.length;
    int lengthKey = key.length;
    int num;
    int countKey=0;
    int numkey=0;
    int cipherTextInt;
    String output="";

    for(int i=0;i<lengthText;i++){
      num=((text.codeUnitAt(i)-65))%26;
      numkey=((key.codeUnitAt(countKey)-65))%26;
      if(countKey==lengthKey-1){
        countKey=0;
      }else{
        countKey++;
      }
      cipherTextInt = (num+numkey)%26;

      output+=(String.fromCharCode(cipherTextInt+65));
    }
    return output;

  }
  String VigenereDecrypt(String text, String key){
    int lengthText = text.length;
    int lengthKey = key.length;
    int num;
    int countKey=0;
    int numkey=0;
    int plainTextInt;
    String output="";

    for(int i=0;i<lengthText;i++){
      num=((text.codeUnitAt(i)-65))%26;
      numkey=((key.codeUnitAt(countKey)-65))%26;
      if(countKey==lengthKey-1){
        countKey=0;
      }else{
        countKey++;
      }
      plainTextInt = (num-numkey+26)%26;
      print(plainTextInt);

      output+=(String.fromCharCode(plainTextInt+65));
    }
    return output;

  }



  }
