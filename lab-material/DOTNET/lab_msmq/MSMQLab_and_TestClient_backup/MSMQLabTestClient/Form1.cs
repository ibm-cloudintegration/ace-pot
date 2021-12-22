using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MSMQLabTestClient
{
    public partial class Form1 : Form
    {
        private MessageQueue queueOut;
        private MessageQueue queueIn;


        public Form1()
        {
            InitializeComponent();
            this.CenterToScreen();
            //queueOut = new MessageQueue(".\\Private$\\CalculatorService.IN", QueueAccessMode.Send);
            //queueIn = new MessageQueue(".\\Private$\\CalculatorService.OUT", QueueAccessMode.Receive);
        }

        private void sumButton_Click(object sender, EventArgs e)
        {
            // disables the interface while processing
            this.Enabled = false;

            // Creates the outgoing object 
            Request request = new Request();
            request.First = (int)firstNumber.Value;
            request.Second = (int)secondNumber.Value;

            // Creates the output message
            System.Messaging.Message messageOut = new System.Messaging.Message(request);

            //queueOut = new MessageQueue(".\\Private$\\" + textBox1.Text, QueueAccessMode.Send);
            // If this Test App input queue field contains a value, use this as the name of the Test App output queue,
            // otheriwse use the hard-coded value "CalculatorService.IN".
            // This is the name of the input queue to the message flow, as determined by the UDP on the MSMQ Input Node.
            if (string.IsNullOrEmpty(comboBox1.Text))
            {
                queueOut = new MessageQueue(".\\Private$\\" + "CalculatorService.IN.EVENT", QueueAccessMode.Send);
            }
            else
            {
                queueOut = new MessageQueue(".\\Private$\\" + comboBox1.Text, QueueAccessMode.Send);
            }

            // If this Test App output queue field contains a value, use that as the name of the Test App output queue,
            // otherwise use the hard-coded value "CalculatorService.IN".
            // This is the name of the input queue to the message flow, as determined by the UDP on the MSMQ Input Node.
            
            if (string.IsNullOrEmpty(textBox2.Text))
            {
                queueIn = new MessageQueue(".\\Private$\\" + "CalculatorService.OUT", QueueAccessMode.Receive);
            }
            else
            {
                queueIn = new MessageQueue(".\\Private$\\" + textBox2.Text, QueueAccessMode.Receive);
            }
            
                        
            // Send the message to the Integration Bus flow.
            queueOut.Send(messageOut);

            try
            {
                // waits for an incoming message which has in its CorrelationID header the same Id of the message sent above
                System.Messaging.Message messageIn = queueIn.ReceiveByCorrelationId(messageOut.Id, TimeSpan.FromSeconds(10));

                // Format and display the result
                messageIn.Formatter = new XmlMessageFormatter(new Type[] { typeof(Response) });
                Response response = (Response)messageIn.Body;
                MessageBox.Show(String.Format("The sum is {0}", response.Result), "MSMQLab Test Client", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MessageQueueException e2)
            {
                // Handle no message arriving in the queue. 
                if (e2.MessageQueueErrorCode == MessageQueueErrorCode.IOTimeout)
                {
                    MessageBox.Show("No response received in 10s.", "MSMQ Lab Test Client", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    MessageBox.Show(e2.ToString(), "MSMQ Lab Test Client", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            finally
            {
                // Enables again the user interface
                this.Enabled = true;
            }
        }
    }

    [Serializable]
    public class Request
    {
        public int First { get; set; }
        public int Second { get; set; }
    }

    [Serializable]
    public class Response
    {
        public int Result { get; set; }
    }
}
