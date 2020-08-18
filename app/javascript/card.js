const pay = () => {
  const PAYJP_PUBLIC_KEY = process.env.PAYJP_PUBLIC_KEY;
  Payjp.setPublicKey(PAYJP_PUBLIC_KEY);
  console.log(PAYJP_PUBLIC_KEY)
  const form = document.getElementById("charge-form");

  if (form.getAttribute("data-load") != null) {
    return null;
  }
  form.setAttribute("data-load", "true");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_shipping_address[number]"),
      cvc: formData.get("purchase_shipping_address[cvc]"),
      exp_month: formData.get("purchase_shipping_address[exp_month]"),
      exp_year: `20${formData.get("purchase_shipping_address[exp_year]")}`,
    };
    console.log(card);
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        console.log(status);
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name="token">`;      
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        document.getElementById("charge-form").submit();
      }
    });

  });
};

setInterval(pay, 1000);