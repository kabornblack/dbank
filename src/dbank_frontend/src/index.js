import { dbank_backend } from "../../declarations/dbank_backend";

window.addEventListener("load", async function() {
  // console.log("finished loading");

  update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  // console.log("submitted");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length !=0) {
  await dbank_backend.topUp(inputAmount);
  };

  if (document.getElementById("withdrawal-amount").value.length !=0) {
    await dbank_backend.withdraw(withdrawalAmount);
    };

    await dbank_backend.compound();

  
  update();
 

  document.getElementById("input-amount").value="";
  document.getElementById("withdrawal-amount").value="";

  button.removeAttribute("disabled");
});

async function update() {
  const currentAmount =  await dbank_backend.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}