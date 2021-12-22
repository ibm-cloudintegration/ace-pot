using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Runtime.InteropServices;


namespace SampleApplication
{
	public class Form1 : System.Windows.Forms.Form
	{
		public string FNAME,LNAME,COUNTRY;
        public string Zipcode;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button3;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
        private System.Data.SqlClient.SqlConnection sqlConnection1;
        private ComboBox comboBox1;
		
		private System.ComponentModel.Container components = null;

		public Form1()
		{
		
			InitializeComponent();

		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
	
		public void InitializeComponent()
		{
System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
this.label13 = new System.Windows.Forms.Label();
this.textBox3 = new System.Windows.Forms.TextBox();
this.textBox2 = new System.Windows.Forms.TextBox();
this.textBox1 = new System.Windows.Forms.TextBox();
this.label4 = new System.Windows.Forms.Label();
this.label2 = new System.Windows.Forms.Label();
this.label1 = new System.Windows.Forms.Label();
this.label6 = new System.Windows.Forms.Label();
this.button1 = new System.Windows.Forms.Button();
this.button3 = new System.Windows.Forms.Button();
this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
this.comboBox1 = new System.Windows.Forms.ComboBox();
this.SuspendLayout();
// 
// label13
// 
this.label13.Location = new System.Drawing.Point(0, 0);
this.label13.Name = "label13";
this.label13.Size = new System.Drawing.Size(100, 23);
this.label13.TabIndex = 64;
// 
// textBox3
// 
this.textBox3.Location = new System.Drawing.Point(136, 138);
this.textBox3.Name = "textBox3";
this.textBox3.Size = new System.Drawing.Size(168, 20);
this.textBox3.TabIndex = 43;
this.textBox3.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
// 
// textBox2
// 
this.textBox2.Location = new System.Drawing.Point(136, 72);
this.textBox2.Name = "textBox2";
this.textBox2.Size = new System.Drawing.Size(168, 20);
this.textBox2.TabIndex = 38;
this.textBox2.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
// 
// textBox1
// 
this.textBox1.Location = new System.Drawing.Point(136, 40);
this.textBox1.Name = "textBox1";
this.textBox1.Size = new System.Drawing.Size(168, 20);
this.textBox1.TabIndex = 37;
this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
// 
// label4
// 
this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
this.label4.Location = new System.Drawing.Point(16, 108);
this.label4.Name = "label4";
this.label4.Size = new System.Drawing.Size(96, 16);
this.label4.TabIndex = 30;
this.label4.Text = "Country /Region";
// 
// label2
// 
this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
this.label2.Location = new System.Drawing.Point(16, 72);
this.label2.Name = "label2";
this.label2.Size = new System.Drawing.Size(88, 16);
this.label2.TabIndex = 28;
this.label2.Text = "Last name";
// 
// label1
// 
this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
this.label1.Location = new System.Drawing.Point(16, 40);
this.label1.Name = "label1";
this.label1.Size = new System.Drawing.Size(80, 16);
this.label1.TabIndex = 27;
this.label1.Text = "First name";
// 
// label6
// 
this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
this.label6.Location = new System.Drawing.Point(16, 138);
this.label6.Name = "label6";
this.label6.Size = new System.Drawing.Size(64, 16);
this.label6.TabIndex = 32;
this.label6.Text = "ZIP code";
// 
// button1
// 
this.button1.BackColor = System.Drawing.SystemColors.Control;
this.button1.Location = new System.Drawing.Point(246, 213);
this.button1.Name = "button1";
this.button1.Size = new System.Drawing.Size(144, 24);
this.button1.TabIndex = 54;
this.button1.Text = "List All Records";
this.button1.UseVisualStyleBackColor = false;
this.button1.Click += new System.EventHandler(this.button1_Click);
// 
// button3
// 
this.button3.BackColor = System.Drawing.SystemColors.ControlLight;
this.button3.Location = new System.Drawing.Point(48, 213);
this.button3.Name = "button3";
this.button3.Size = new System.Drawing.Size(104, 23);
this.button3.TabIndex = 56;
this.button3.Text = "Add Record";
this.button3.UseVisualStyleBackColor = false;
this.button3.Click += new System.EventHandler(this.button3_Click);
// 
// sqlDataAdapter1
// 
this.sqlDataAdapter1.InsertCommand = this.sqlInsertCommand1;
this.sqlDataAdapter1.SelectCommand = this.sqlSelectCommand1;
this.sqlDataAdapter1.TableMappings.AddRange(new System.Data.Common.DataTableMapping[] {
            new System.Data.Common.DataTableMapping("Table", "CONTACTS", new System.Data.Common.DataColumnMapping[] {
                        new System.Data.Common.DataColumnMapping("ID", "ID"),
                        new System.Data.Common.DataColumnMapping("FNAME", "FNAME"),
                        new System.Data.Common.DataColumnMapping("LNAME", "LNAME"),
                        new System.Data.Common.DataColumnMapping("COUNTRY", "COUNTRY"),
                        new System.Data.Common.DataColumnMapping("ZIPCODE", "ZIPCODE")})});
// 
// sqlInsertCommand1
// 
this.sqlInsertCommand1.CommandText = "INSERT INTO CONTACTS(ID, FNAME, LNAME, COUNTRY, ZIPCODE, ) VALUES (@ID, @FNAME, @" +
    "LNAME, @LANG, @COUNTRY, @ZIPCODE,); SELECT ID, FNAME, LNAME, COUNTRY, ZIPCODE FR" +
    "OM CONTACTS";
this.sqlInsertCommand1.Connection = this.sqlConnection1;
this.sqlInsertCommand1.Parameters.AddRange(new System.Data.SqlClient.SqlParameter[] {
            new System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.Int, 4, "ID"),
            new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 50, "FNAME"),
            new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 50, "LNAME"),
            new System.Data.SqlClient.SqlParameter("@COUNTRY", System.Data.SqlDbType.VarChar, 30, "COUNTRY"),
            new System.Data.SqlClient.SqlParameter("@ZIPCODE", System.Data.SqlDbType.VarChar, 15, "ZIPCODE")});
// 
// sqlConnection1
// 
this.sqlConnection1.ConnectionString = "Server=(local)\\SQLEXPRESS; database=SampleDatabse; integrated security=yes";
this.sqlConnection1.FireInfoMessageEventOnUserErrors = false;
// 
// sqlSelectCommand1
// 
this.sqlSelectCommand1.CommandText = "SELECT ID, FNAME, LNAME, COUNTRY,ZIPCODE FROM CONTACTS";
this.sqlSelectCommand1.Connection = this.sqlConnection1;
// 
// comboBox1
// 
this.comboBox1.FormattingEnabled = true;
this.comboBox1.Items.AddRange(new object[] {
            "USA",
            "UK",
            "Spain",
            "France",
            "Germany",
            "Canada",
            "Argentina",
            "Brazil",
            "Other"});
this.comboBox1.Location = new System.Drawing.Point(136, 108);
this.comboBox1.Name = "comboBox1";
this.comboBox1.Size = new System.Drawing.Size(135, 21);
this.comboBox1.TabIndex = 69;
this.comboBox1.Text = "Select country";
this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
// 
// Form1
// 
this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
this.BackColor = System.Drawing.SystemColors.HighlightText;
this.ClientSize = new System.Drawing.Size(414, 286);
this.Controls.Add(this.comboBox1);
this.Controls.Add(this.button3);
this.Controls.Add(this.button1);
this.Controls.Add(this.textBox3);
this.Controls.Add(this.textBox2);
this.Controls.Add(this.textBox1);
this.Controls.Add(this.label4);
this.Controls.Add(this.label2);
this.Controls.Add(this.label1);
this.Controls.Add(this.label6);
this.Controls.Add(this.label13);
this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
this.MaximizeBox = false;
this.Name = "Form1";
this.Text = "SampleApplication";
this.Load += new System.EventHandler(this.Form1_Load);
this.ResumeLayout(false);
this.PerformLayout();

		}
		#endregion

		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{

		}



		private void button2_Click(object sender, System.EventArgs e)
		{
			this.Dispose();
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
            
			Form2 f2=new Form2();
			f2.ShowDialog();
		}

        private void button3_Click(object sender, EventArgs e)
		{
            string COUNTRYCODE;
            string ZIPCODE;
            COUNTRY = this.comboBox1.SelectedItem.ToString();
			if(this.textBox1.Text==""||this.textBox2.Text=="")
				MessageBox.Show("First Name required");
			else
			{
				this.sqlConnection1.Open();
                switch (COUNTRY)
                {
                    case "UK":
                        COUNTRYCODE = "111";
                        break;
                    case "Germany":
                        COUNTRYCODE = "112";
                        break;
                    case "USA":
                        COUNTRYCODE = "113";
                        break;
                    case "Spain":
                        COUNTRYCODE = "114";
                        break;
                    case "France":
                        COUNTRYCODE = "115";
                        break;
                    case "Brazil":
                        COUNTRYCODE = "116";
                        break;
                    case "Canada":
                        COUNTRYCODE = "117";
                        break;
                    case "Argentina":
                        COUNTRYCODE = "118";
                        break;
                    default:
                        COUNTRYCODE = "999";
                        break;
                }
                ZIPCODE = this.Zipcode;
                ZIPCODE = "X" + ZIPCODE + "X";
			
				string insert="INSERT INTO CONTACTS(FNAME, LNAME, COUNTRY, ZIPCODE) VALUES ('"+ FNAME +"','"+ LNAME +"','"+ COUNTRYCODE +"','"+ ZIPCODE +"')";
				SqlCommand cmd=new SqlCommand(insert,this.sqlConnection1);
				cmd.ExecuteNonQuery();
			
				this.sqlConnection1.Close();
				MessageBox.Show("Contact added");
			}
		}

		private void textBox1_TextChanged(object sender, System.EventArgs e)
		{
			FNAME=this.textBox1.Text.ToString();
		}

        

		private void textBox2_TextChanged(object sender, System.EventArgs e)
		{
			LNAME=this.textBox2.Text.ToString();
			
		}

        private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			COUNTRY=this.comboBox1.SelectedItem.ToString();
			
		}

		private void textBox3_TextChanged(object sender, System.EventArgs e)
		{
			Zipcode=this.textBox3.Text.ToString();
			
		}




        public static string UpdateExternal(string FNAME , string LNAME, string CCOUNTRY, out string COUNTRYCODE, ref string ZIPCODE)
        {

            switch (CCOUNTRY)
           {
               case "UK":
                   COUNTRYCODE = "111";
                   break;
               case "Germany":
                   COUNTRYCODE = "112";
                   break;
               case "USA":
                   COUNTRYCODE = "113";
                   break;
               case "Spain":
                   COUNTRYCODE = "114";
                   break;
               case "France":
                   COUNTRYCODE = "115";
                   break;
               case "Brazil":
                   COUNTRYCODE = "116";
                   break;
               case "Canada":
                   COUNTRYCODE = "117";
                   break;
               case "Argentina":
                   COUNTRYCODE = "118";
                   break;
               default:
                   COUNTRYCODE = "999";
                   break;
           }

           ZIPCODE = "X" + ZIPCODE + "X";
            System.Data.SqlClient.SqlConnection sqlConnection2 = new SqlConnection();
                sqlConnection2.ConnectionString = "Server=(local)\\SQLEXPRESS; database=SampleDatabse; integrated security=yes";
                sqlConnection2.Open();

                string insert = "INSERT INTO CONTACTS(FNAME, LNAME, COUNTRY, ZIPCODE) VALUES ('" + FNAME + "' ,'" + LNAME + "','" + COUNTRYCODE + "' ,'" + ZIPCODE + "' )";
                SqlCommand cmd = new SqlCommand(insert, sqlConnection2);
                cmd.ExecuteNonQuery();


                sqlConnection2.Close();
                
            
            return (FNAME + LNAME);
        }

        
       
	}
}
