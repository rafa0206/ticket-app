mixin DefaultValidator{

  String? validateText(String? value){
    if(value!.isEmpty){
      return 'Campo vazio.';
    }
    return null;
  }

  String? validateNumber( String? value){
    if(value!.isEmpty){
      return 'Campo vazio.';
    }
    if(value == '0'){
      return 'Valor não pode ser 0.';
    }
    return null;
  }

}