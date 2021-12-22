using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace SampleApplication
{
		public class Form2 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.DataGrid dataGrid1;
		private System.Data.SqlClient.SqlDataAdapter sqlDataAdapter1;
		private System.Data.SqlClient.SqlCommand sqlSelectCommand1;
		private System.Data.SqlClient.SqlCommand sqlInsertCommand1;
		private System.Data.SqlClient.SqlConnection sqlConnection1;
		private System.ComponentModel.Container components = null;

		public Form2()
		{
			
			InitializeComponent();

		}
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
	
		private void InitializeComponent()
		{
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form2));
            this.dataGrid1 = new System.Windows.Forms.DataGrid();
            this.sqlDataAdapter1 = new System.Data.SqlClient.SqlDataAdapter();
            this.sqlInsertCommand1 = new System.Data.SqlClient.SqlCommand();
            this.sqlConnection1 = new System.Data.SqlClient.SqlConnection();
            this.sqlSelectCommand1 = new System.Data.SqlClient.SqlCommand();
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGrid1
            // 
            this.dataGrid1.BackColor = System.Drawing.SystemColors.HighlightText;
            this.dataGrid1.BackgroundColor = System.Drawing.Color.MediumPurple;
            this.dataGrid1.DataMember = "";
            this.dataGrid1.FlatMode = true;
            this.dataGrid1.HeaderForeColor = System.Drawing.SystemColors.ControlText;
            this.dataGrid1.Location = new System.Drawing.Point(0, 0);
            this.dataGrid1.Name = "dataGrid1";
            this.dataGrid1.Size = new System.Drawing.Size(776, 384);
            this.dataGrid1.TabIndex = 0;
            this.dataGrid1.Navigate += new System.Windows.Forms.NavigateEventHandler(this.dataGrid1_Navigate);
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
            this.sqlInsertCommand1.CommandText = "INSERT INTO CONTACTS(ID, FNAME, LNAME, COUNTRY, ZIPCODE) VALUES (@ID, @FNAME, @LN" +
                "AME, @COUNTRY, @ZIPCODE); SELECT ID, FNAME, LNAME,COUNTRY,  ZIPCODE FROM CONTACT" +
                "S";
            this.sqlInsertCommand1.Connection = this.sqlConnection1;
            this.sqlInsertCommand1.Parameters.AddRange(new System.Data.SqlClient.SqlParameter[] {
            new System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.Int, 4, "ID"),
            new System.Data.SqlClient.SqlParameter("@FNAME", System.Data.SqlDbType.VarChar, 50, "FNAME"),
            new System.Data.SqlClient.SqlParameter("@LNAME", System.Data.SqlDbType.VarChar, 50, "LNAME"),
            new System.Data.SqlClient.SqlParameter("@COUNTRY", System.Data.SqlDbType.VarChar, 30, "COUNTRY"),
            new System.Data.SqlClient.SqlParameter("@ZIPCODE", System.Data.SqlDbType.Int, 4, "ZIPCODE")});
            // 
            // sqlConnection1
            // 
            this.sqlConnection1.ConnectionString = "Server=(local)\\SQLEXPRESS; database=SampleDatabse; integrated security=yes";
            this.sqlConnection1.FireInfoMessageEventOnUserErrors = false;
            // 
            // sqlSelectCommand1
            // 
            this.sqlSelectCommand1.CommandText = "SELECT ID, FNAME, LNAME, COUNTRY, ZIPCODE FROM CONTACTS";
            this.sqlSelectCommand1.Connection = this.sqlConnection1;
            // 
            // Form2
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(433, 325);
            this.Controls.Add(this.dataGrid1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form2";
            this.Text = "All Contacts";
            this.Load += new System.EventHandler(this.Form2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid1)).EndInit();
            this.ResumeLayout(false);

		}
		#endregion

		private void dataGrid1_Navigate(object sender, System.Windows.Forms.NavigateEventArgs ne)
		{
		
		}

		public void Form2_Load(object sender, System.EventArgs e)
		{		
			string select="SELECT * FROM CONTACTS";
			DataSet ds=new DataSet();
			this.sqlConnection1.Open();
			this.sqlDataAdapter1=new SqlDataAdapter(select,sqlConnection1);
			this.sqlDataAdapter1.Fill(ds,"CONTACTS");
			if(ds.Tables["CONTACTS"].Rows.Count==0)
			{
				MessageBox.Show("There are  no contacts in the database.");
			}
			else
			{
				this.dataGrid1.SetDataBinding(ds,"CONTACTS");
			}
			this.sqlConnection1.Close();
		}
	}
}
