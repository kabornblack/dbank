import Debug "mo:base/Debug";

actor DBank {
  stable var currentValue = 300;
  // currentValue := 100;

  let id = 6423694854846;
  Debug.print(debug_show(id));

//ALLOW USER TO DEPOSIT FUNDS
  public func topUp(amount: Nat) {
    currentValue += amount;

    Debug.print(debug_show(currentValue));

  };

// ALLOW USERS TO WITHDRAW FUNDS
   public func withdraw(amount: Nat) {

    let tempValue : Int = currentValue - amount;
    if (tempValue >= 0) {
    currentValue -= amount;

    Debug.print(debug_show(currentValue));
    } else {Debug.print("Withdrawal amount too large")}
  };

 public query func checkBalance(): async Nat {
 return currentValue;
};


}