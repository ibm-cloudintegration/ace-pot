using System;
using System.Collections.Generic;
using System.Text;

namespace BankingApplication {
    public class RetailBank {

        public static string GetBalance(string accountNumber, out string lastUpdated) {
            lastUpdated = System.DateTime.Now.ToString();
            return "1000.00";
        }

        public static string TransferMoney(string sourceAccountNumber, string targetAccountNumber, string value) {
            return "Money transferred correctly..!";
        }

        public static string FindMissingAccount(string name, ref string lastKnownAccountNumber) {
            lastKnownAccountNumber = "1234567890";
            return "Account located successfully..!";
        }
    }
}
