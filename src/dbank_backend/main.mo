import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();

  let id = 6423694854846;
  // Debug.print(debug_show(id));

//ALLOW USER TO DEPOSIT FUNDS
  public func topUp(amount: Float) {
    currentValue += amount;

    Debug.print(debug_show(currentValue));

  };

// ALLOW USERS TO WITHDRAW FUNDS
   public func withdraw(amount: Float) {

    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
    currentValue -= amount;

    Debug.print(debug_show(currentValue));
    } else {Debug.print("Withdrawal amount too large")}
  };

 public query func checkBalance(): async Float {
 return currentValue;
};

public func compound() {
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - startTime;
  let timeElapsedS = timeElapsedNS / 1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
  startTime := currentTime;
}

}