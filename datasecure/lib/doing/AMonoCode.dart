class AmonoAlphabetic {
  String text;

  AmonoAlphabetic(String text) {
    this.text = text;
  }

  String getText() {
    return this.text;
  }

  void setText(String text) {
    this.text = text;
  }

  String MonoEncrypt(String key) {
    String plainText = "ABCDEFGHIJKLMNOPQRSPUVWXYZ";
    String cipherText = "GOYDSIPELUAVCRJWXZNHBQFTMK";
    String output = "";
    int lengthPlainText = plainText.length;
    int lengthCipherText = cipherText.length;
    int lengthKey = key.length;
    int num;

    for (int i = 0; i < lengthKey; i++) {
      num = num=((key.codeUnitAt(i)-65))%26;
      output+=cipherText[num];
    }

    return output;

  }

  String MonoDecrypt(String key){
    String plainText = "ABCDEFGHIJKLMNOPQRSPUVWXYZ";
    String cipherText = "GOYDSIPELUAVCRJWXZNHBQFTMK";
    String output = "";
    int lengthPlainText = plainText.length;
    int lengthCipherText = cipherText.length;
    int lengthKey = key.length;
    int num;

    for(int i=0;i<lengthKey;i++){

      for(int j=0; j<lengthCipherText; j++){

        if(key[i]==cipherText[j]){
          num=j;
          output+=plainText[num];
          break;
        }
      }

    }
    return output;
  }

}