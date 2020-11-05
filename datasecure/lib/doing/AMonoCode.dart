class AmonoAlphabetic {
  String text;

  AmonoAlphabetic(String text){
    this.text=text;
  }

  String getText(){
    return this.text;
  }

  void setText(String text){
    this.text=text;
  }

  String MonoEncrypt(String text){
    String str="GOYDSIPELUAVCRJWXZNHBQFTMK";
    String output="";
    int lengthText = text.length;
    int lengthStr = text.length;
    int num;

    for(int i=0;i<lengthText;i++){
      for(int j=0;j<lengthStr;j++){
        if(text[i]==str[j]){
          num=j;
        }
        output+=str[num];
      }
      return output;
    }

  }
}