using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using IBM.Broker.Plugin;

namespace MSMQLab {
    /// <summary>
    /// Calculator Class
    /// </summary>
    public class Calculator : NBComputeNode {
        /// <summary>
        /// Evaluate Method
        /// </summary>
        /// <param name="inputAssembly"></param>
        public override void Evaluate(NBMessageAssembly inputAssembly) {
            NBOutputTerminal outTerminal = OutputTerminal("Out");

            NBMessage inputMessage = inputAssembly.Message;

            // Create a new message from a copy of the 
            // inboundMessage, ensuring it is disposed of after use
            using (NBMessage outputMessage = new NBMessage(inputMessage)) {
                NBMessageAssembly outAssembly = new NBMessageAssembly(inputAssembly, outputMessage);
                NBElement inputRoot = inputMessage.RootElement;
                NBElement outputRoot = outputMessage.RootElement;

                #region UserCode
                // Add user code in this region to modify the message

                int first = int.Parse(inputRoot.LastChild["Request"]["First"].ValueAsString);
                int second = int.Parse(inputRoot.LastChild["Request"]["Second"].ValueAsString);
                int Result = first + second;

                NBElement xmlRoot = outputRoot[NBParsers.XMLNSC.ParserName];
                xmlRoot.DeleteAllChildren();
                NBElement response = xmlRoot.CreateFirstChild("", "Response");
                response.CreateLastChild("", "Result", Result);
                #endregion UserCode

                // Change the following if not propagating message to the 'Out' terminal
                outTerminal.Propagate(outAssembly);
            }
        }
    }
}
