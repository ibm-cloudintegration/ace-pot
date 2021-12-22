namespace MSMQLab
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    using IBM.Broker.Plugin.Connector;
    using System.Messaging;

    /// <summary>
    /// MSMQPolledInput Class
    /// </summary>
    public class MSMQPolledInput : NBPollingInputConnector
    {
        private MessageQueue inputQ = null;
        /// <summary>
        /// Initializes a new instance of the <see cref="MSMQPooledInput" /> class.
        /// </summary>
        /// <param name="connectorFactory">The owning factory.</param>
        /// <param name="name">The name of the connector.</param>
        /// <param name="properties">Contains any user properties placed on the node using this connector, and any flow level User Defined Properties.</param>
        public MSMQPolledInput(NBConnectorFactory connectorFactory, string name, Dictionary<string, string> properties)
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
        /// Performs any setup or connections necessary to start obtaining data.
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
                this.queueName = "CalculatorService.IN.POLL";
            }
            // Opens the input queue for reading
            inputQ = new MessageQueue(".\\Private$\\" + queueName, QueueAccessMode.Receive);

        }

        /// <summary>
        /// Finish Method
        /// </summary>
        /// <remarks>
        /// Performs any shutdown or connection closing necessary to finish obtaining data.
        /// </remarks>
        public override void Finish()
        {
            if (inputQ != null) {
                inputQ.Close();
            }
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

        /// <summary>
        /// ReadData Method
        /// </summary>
        /// <remarks>
        /// Returns an NBInputRecord containing data to be processed by message broker, or a timeout record if no data is available.
        /// </remarks>
        /// <param name="timeout">Maximum duration to wait before returning a data record or a timeout record</param>
        /// <returns>An <c>NBByteArrayInputRecord</c> containing data or <c>NBTimeoutInputRecord</c> if no data is available</returns>
        public override NBPollingResult ReadData(TimeSpan timeout)
        {
            #region UserCode
            // If data is available, return it in a new NBPollingResult.
            // The built-in NBByteArrayPollingResult can be used or a new subclass can be created.
            // If no data is available return an NBTimeoutPollingResult.

            try
            {
                // Try to read a message from the queue, 
                Message message = inputQ.Receive(TimeSpan.FromSeconds(10));

                // Reads the bytes from the input message
                byte[] msgBolb = System.Text.Encoding.Default.GetBytes(new System.IO.StreamReader(message.BodyStream).ReadToEnd());

                // Creates the event that will be delivered to the broker
                NBPollingResult result = new NBByteArrayPollingResult(this, msgBolb);

                // Saves the incoming message id in the BuildProperties collection, which will be copied to the LocalEnvironment
                result.BuildProperties().Add("MsgId", message.Id);

                return result;
            
            }
            catch (MessageQueueException e)
            {
                // Handle no message arriving in the queue. 
                if (e.MessageQueueErrorCode == MessageQueueErrorCode.IOTimeout)
                {
                    return new NBTimeoutPollingResult(this, timeout);
                }
                else
                {
                    throw (e);
                }
            }
            #endregion

        }
    }
}