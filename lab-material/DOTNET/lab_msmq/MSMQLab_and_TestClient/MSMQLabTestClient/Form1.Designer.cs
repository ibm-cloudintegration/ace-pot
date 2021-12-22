namespace MSMQLabTestClient {
    partial class Form1 {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.firstNumberLabel = new System.Windows.Forms.Label();
            this.secondNumberLabel = new System.Windows.Forms.Label();
            this.firstNumber = new System.Windows.Forms.NumericUpDown();
            this.secondNumber = new System.Windows.Forms.NumericUpDown();
            this.sumButton = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.firstNumber)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.secondNumber)).BeginInit();
            this.SuspendLayout();
            // 
            // firstNumberLabel
            // 
            this.firstNumberLabel.AutoSize = true;
            this.firstNumberLabel.Location = new System.Drawing.Point(26, 130);
            this.firstNumberLabel.Name = "firstNumberLabel";
            this.firstNumberLabel.Size = new System.Drawing.Size(69, 13);
            this.firstNumberLabel.TabIndex = 0;
            this.firstNumberLabel.Text = "First Number:";
            // 
            // secondNumberLabel
            // 
            this.secondNumberLabel.AutoSize = true;
            this.secondNumberLabel.Location = new System.Drawing.Point(26, 178);
            this.secondNumberLabel.Name = "secondNumberLabel";
            this.secondNumberLabel.Size = new System.Drawing.Size(87, 13);
            this.secondNumberLabel.TabIndex = 1;
            this.secondNumberLabel.Text = "Second Number:";
            // 
            // firstNumber
            // 
            this.firstNumber.Location = new System.Drawing.Point(386, 130);
            this.firstNumber.Maximum = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            this.firstNumber.Minimum = new decimal(new int[] {
            1000,
            0,
            0,
            -2147483648});
            this.firstNumber.Name = "firstNumber";
            this.firstNumber.Size = new System.Drawing.Size(68, 20);
            this.firstNumber.TabIndex = 2;
            this.firstNumber.Value = new decimal(new int[] {
            2,
            0,
            0,
            0});
            // 
            // secondNumber
            // 
            this.secondNumber.Location = new System.Drawing.Point(386, 178);
            this.secondNumber.Maximum = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            this.secondNumber.Minimum = new decimal(new int[] {
            1000,
            0,
            0,
            -2147483648});
            this.secondNumber.Name = "secondNumber";
            this.secondNumber.Size = new System.Drawing.Size(68, 20);
            this.secondNumber.TabIndex = 3;
            this.secondNumber.Value = new decimal(new int[] {
            3,
            0,
            0,
            0});
            // 
            // sumButton
            // 
            this.sumButton.Location = new System.Drawing.Point(386, 227);
            this.sumButton.Name = "sumButton";
            this.sumButton.Size = new System.Drawing.Size(68, 23);
            this.sumButton.TabIndex = 4;
            this.sumButton.Text = "Sum!";
            this.sumButton.UseVisualStyleBackColor = true;
            this.sumButton.Click += new System.EventHandler(this.sumButton_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(26, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(252, 52);
            this.label1.TabIndex = 6;
            this.label1.Text = "MSMQ input queue name\r\n(default CalculatorService.IN)\r\nIf you use a different que" +
    "ue, remember to \r\nchange the queueName UDP on the Message Flow";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(277, 71);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(177, 20);
            this.textBox2.TabIndex = 7;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(26, 73);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(157, 26);
            this.label2.TabIndex = 8;
            this.label2.Text = "MSMQ output queue name\r\n(default CalculatorService.OUT)";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "CalculatorService.IN",
            "CalculatorService.IN.EVENT",
            "CalculatorService.IN.POLL"});
            this.comboBox1.Location = new System.Drawing.Point(277, 14);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(192, 21);
            this.comboBox1.TabIndex = 9;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(558, 299);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.sumButton);
            this.Controls.Add(this.secondNumber);
            this.Controls.Add(this.firstNumber);
            this.Controls.Add(this.secondNumberLabel);
            this.Controls.Add(this.firstNumberLabel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "MSMQ Lab Test Client";
            ((System.ComponentModel.ISupportInitialize)(this.firstNumber)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.secondNumber)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label firstNumberLabel;
        private System.Windows.Forms.Label secondNumberLabel;
        private System.Windows.Forms.NumericUpDown firstNumber;
        private System.Windows.Forms.NumericUpDown secondNumber;
        private System.Windows.Forms.Button sumButton;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox comboBox1;
    }
}

