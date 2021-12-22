namespace MSMQInput
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Messaging;

    //TODO: Add a reference to the IBM.Broker.Plugin.dll assembly which is in the "<MessageBrokerInstallPath>\bin" folder
    using IBM.Broker.Plugin.Connector;

    /// <summary>
    /// EventInputConnector Class
    /// </summary>
    public class EventInputConnector : NBEventInputConnector
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="EventInputConnector" /> class.
        /// </summary>
        /// <param name="connectorFactory">The owning factory.</param>
        /// <param name="name">The name of the connector.</param>
        /// <param name="properties">Contains any user properties placed on the node using this connector.</param>
        public EventInputConnector(NBConnectorFactory connectorFactory, string name, Dictionary<string, string> properties)
            : base(connectorFactory, name, properties)
        {
        }

        /// <summary>
        /// Initialize Method
        /// </summary>
        /// <remarks>
        /// Performs any validation of properties that is required when the flow is deployed.
        /// </remarks>
        public override void Initialize()
        {
        }

        /// <summary>
        /// Start Method
        private string queueName;
        /// </summary>
        /// <remarks>
        /// Registers a user defined delegate with the event source.
        /// The delegate is where an <c>NBByteArrayInputEvent</c> or another subclass of <c>NBInputEvent</c> must be created and delivered.
        /// </remarks>
        public override void Start()
        {
            // Reads the input queue name from the User Defined Property (UDP) of the node

            if (Properties.ContainsKey("queueName"))
            {
                this.queueName = Properties["queueName"];
            }
            else
            {
                this.queueName = "CalculatorService.IN.EVENT";
            }
            // Opens the input queue for reading
            MessageQueue inputQ = new MessageQueue(".\\Private$\\" + queueName, QueueAccessMode.Receive);

            // Add an event handler for the ReceiveCompleted event.
            inputQ.ReceiveCompleted += new ReceiveCompletedEventHandler(this.MessageReceived);

            // Begin the asynchronous receive operation.
            inputQ.BeginReceive();

        }

        /// <summary>
        /// Finish Method
        /// </summary>
        /// <remarks>
        /// Performs deregistration of the delegate from the event source.
        /// </remarks>
        public override void Finish()
        {
        }

        /// <summary>
        /// Terminate Method
        /// </summary>
        /// <remarks>
        /// Perform any final shutdown required when the flow is stopped or undeployed.
        /// </remarks>
        public override void Terminate()
        {
        }

        #region UserDelegate
        // Create a method here that forms the delegate to be registered with the event source in the Start method.
        private void MessageReceived(object source, ReceiveCompletedEventArgs asyncResult)
        {
            MessageQueue inputQ = null;
            try
            {
                // Connect to the queue
                inputQ = (MessageQueue)source;

                // End the asynchronous Receive operation.
                Message message = inputQ.EndReceive(asyncResult.AsyncResult);

                // Reads the bytes from the input message
                byte[] msgBolb = System.Text.Encoding.Default.GetBytes(new System.IO.StreamReader(message.BodyStream).ReadToEnd());

                // Creates the event that will be delivered to the broker
                NBEvent nbEvent = new NBByteArrayInputEvent(this, msgBolb);

                // Saves the incoming message id in the BuildProperties collection, which will be copied to the LocalEnvironment
                nbEvent.BuildProperties().Add("MsgId", message.Id);

                // Delivers the event to the IIB runtime
                this.DeliverEvent(nbEvent);
            }
            finally
            {
                // Restart the asynchronous Receive operation.
                inputQ.BeginReceive();
            }
        }
        #endregion
    }
}
