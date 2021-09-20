const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // 公開鍵：クライアントサイドからPAYJPへ情報を送りトークン化するために必要
  const submit = document.getElementById("button"); 
  submit.addEventListener('click', (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp-month"),
      exp_year: `20${formData.get("exp-year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value="${token}" name="card_token" type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("number").removeAttribute("name"); // form_withのmodelに何も渡されていないため、フォームのidは「〜_number」とはならず「number」だけとなる
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit(); // トークン化した情報を取得し、サーバーサイドへその情報を送る
    });
  });
};

window.addEventListener('load', pay);