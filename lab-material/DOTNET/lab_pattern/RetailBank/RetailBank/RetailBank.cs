using System;
using System.Collections.Generic;
using System.Text;

namespace BankingApplication {
    public class RetailBank {

        public static string GetBalance(string accountNumber, out string lastUpdated) {
            lastUpdated = System.DateTime.Now.ToString();
            Random random = new Random();
            return random.Next(100, 50000).ToString();
 
        }

        public static string TransferMoney(string sourceAccountNumber, string targetAccountNumber, string value) {
            return "Successfully transferred $" + value + " from account " + sourceAccountNumber + " to account " + targetAccountNumber;
        }

        public static string FindMissingAccount(string name, ref string lastKnownAccountNumber) {
            lastKnownAccountNumber = "1234567890";
            return "Account located successfully..!";
        }
    }
}
