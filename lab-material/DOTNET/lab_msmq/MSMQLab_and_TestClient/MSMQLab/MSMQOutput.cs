using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using IBM.Broker.Plugin;
using System.Messaging;

namespace MSMQLab {
    /// <summary>
    /// MSMQOutput Class
    /// </summary>
    public class MSMQOutput : NBComputeNode {
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

                // Reads the input queue name from the User Defined Property (UDP) of the node
                string queueName = this.GetUserDefinedPropertyAsString("outputQueue");
                if (string.IsNullOrWhiteSpace(queueName)) { 
                    queueName = "CalculatorService.OUT";
                }

                // Opens the input queue for reading
                MessageQueue outputQ = new MessageQueue(".\\Private$\\" + queueName, QueueAccessMode.Send);

                // assemble the output message, calling IIB parser to serialize the data
                Message message = new Message();
                byte[] data = inputRoot.AsBitStream();
                message.BodyStream.Write(data, 0, data.Length);

                // TODO Waiting MGK's fix of NBEvent.GetBuildProperties()
                message.CorrelationId = inputAssembly.LocalEnvironment.RootElement["DotNet"]["Input"]["MsgId"].ValueAsString;

                // sends the response message
                outputQ.Send(message);

                #endregion UserCode

                // Change the following if not propagating message to the 'Out' terminal
                outTerminal.Propagate(outAssembly);
            }
        }
    }
}
