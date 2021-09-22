function chat (){
  const submit = document.getElementById("chat-submit");
  submit.addEventListener('click', (e) => {
    e.preventDefault();

    const formData = new FormData(document.getElementById("form")); //フォームに入力された値を引数に取ることで、その値を取得できるオブジェクト
    const XHR = new XMLHttpRequest(); //JavaScriptを用いてサーバーとHTTP通信を行うときに利用するオブジェクト
    XHR.open("POST", "/chats", true);  //リクエストを初期化し、リクエストの内容を指定するためのメソッド
    XHR.responseType = "json";
    XHR.send(formData);

   

  });
};

window.addEventListener('load', chat);