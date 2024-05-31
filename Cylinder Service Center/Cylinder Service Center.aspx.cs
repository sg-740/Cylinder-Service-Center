using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Cylinder_Service_Center
{
    public partial class Cylinder_Service_Center : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("data source=SAHIL\\SQLEXPRESS;initial catalog=CylinderServiceCenter;integrated security=true;");
        string CylinderString = ConfigurationManager.ConnectionStrings["CylinderString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SignInPannel.Visible = false;
                NewAccountPannel.Visible = false;
            }
        }
        protected void Loginlinkbtn_Click(object sender, EventArgs e)
        {
            SignInPannel.Visible = true;
            txtUsername.Focus();
            NewAccountPannel.Visible = false;
            //Image1.Visible = false;
        }
        protected void Signlinkbtn_Click(object sender, EventArgs e)
        {
            NewAccountPannel.Visible = true;
            txtName.Focus();
            SignInPannel.Visible = false;
            //  Image1.Visible = false;
        }
        protected void Homelinkbtn_Click(object sender, EventArgs e)
        {
            SignInPannel.Visible = false;
            NewAccountPannel.Visible = false;
            Image1.Visible = true;
        }
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            bool validate = ValidationForm();
            if (validate)
            {
                //SqlCommand cmd = new SqlCommand("insert into SignInData(username,email,password)values('" + txtUsername.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "')", con);
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();
                //    Response.Write("<script>alert('Sign-In Successfully!')</script>");
                //    lblSignpannel.Text = "Sign-In Successfully!";
                //    lblSignpannel.ForeColor = System.Drawing.Color.BlueViolet;
                //    txtEmail.Text = "";

                //}
                //else
                //{
                //    Response.Write("<script>alert('Sign-In Failed!')</script>");
                //}
                try
                {
                    string CylinderString = ConfigurationManager.ConnectionStrings["CylinderString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CylinderString))
                    {
                        using (SqlCommand cmd = new SqlCommand("storeSignInData", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                            con.Open();
                            int RowAffected = cmd.ExecuteNonQuery();
                            con.Close();

                            if (RowAffected > 0)
                            {
                                Response.Write("<script>alert('Sign-In Successfully!')</script>");
                                lblSignpannel.Text = "Sign-In Successfully!";
                                lblSignpannel.ForeColor = System.Drawing.Color.BlueViolet;
                                txtEmail.Text = "";
                            }
                            else
                            {
                                lblSignpannel.Text = "Sign-In Failed!";
                                lblSignpannel.ForeColor = System.Drawing.Color.Red;
                                Response.Write("<script>alert('Sign-In Failed!')</script>");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception (e.g., log the error and display a friendly message)
                    lblSignpannel.Text = "An error occurred: " + ex.Message;
                    lblSignpannel.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        public bool ValidationForm()
        {
            if (string.IsNullOrEmpty(txtUsername.Text.ToString()) && string.IsNullOrEmpty(txtEmail.Text.ToString()) && string.IsNullOrEmpty(txtPassword.Text.ToString()))
            {
                Response.Write("<script>alert('All Field Required!')</script>");
                lblSignpannel.Text = "Please Input All The Field To Sign-In";
                lblSignpannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            if (string.IsNullOrEmpty(txtUsername.Text.ToString()))
            {
                Response.Write("<script>alert('Username Is Required')</script>");
                lblSignpannel.Text = "Please Input UserName To Sign-In";
                lblSignpannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtEmail.Text.ToString()))
            {
                Response.Write("<script>alert('Email Is Required')</script>");
                lblSignpannel.Text = "Please Input Email-ID To Sign-In";
                lblSignpannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtPassword.Text.ToString()))
            {
                Response.Write("<script>alert('Password Is Required')</script>");
                lblSignpannel.Text = "Please Input Password To Sign-In";
                lblSignpannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else
            {
                return true;
            }
        }
        protected void btnNewAccount_Click(object sender, EventArgs e)
        {

            bool NewAccountValidate = NewAccountValidationForm();
            if (NewAccountValidate)
            {

                try
                {
                    string CylinderString = ConfigurationManager.ConnectionStrings["CylinderString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CylinderString))
                    {
                        using (SqlCommand cmd = new SqlCommand("storeNewAccountData1", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@Name", txtName.Text);
                            cmd.Parameters.AddWithValue("@email", txtEmail1.Text);
                            cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                            cmd.Parameters.AddWithValue("@password", txtPassword1.Text);
                            cmd.Parameters.AddWithValue("@cpassword", txtCPassword.Text);

                            con.Open();
                            int RowAffected = cmd.ExecuteNonQuery();
                            con.Close();

                            if (RowAffected != 0)
                            {
                                Response.Write("<script>alert('Login Successfully!')</script>");
                                lblSignpannel.Text = "Login Successfully!";
                                lblSignpannel.ForeColor = System.Drawing.Color.BlueViolet;
                                txtEmail.Text = "";
                            }
                            else
                            {
                                lblSignpannel.Text = "Login Failed!";
                                lblSignpannel.ForeColor = System.Drawing.Color.Red;
                                Response.Write("<script>alert('Login Failed!')</script>");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception (e.g., log the error and display a friendly message)
                    lblSignpannel.Text = "An error occurred: " + ex.Message;
                    lblSignpannel.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        public bool NewAccountValidationForm()
        {
            if (string.IsNullOrEmpty(txtName.Text.ToString()) && string.IsNullOrEmpty(txtEmail1.Text.ToString()) && string.IsNullOrEmpty(txtMobile.Text.ToString()) && string.IsNullOrEmpty(txtPassword1.Text.ToString()) && string.IsNullOrEmpty(txtCPassword.Text.ToString()))
            {
                Response.Write("<script>alert('All Field Required!')</script>");
                lblNewAccountPannel.Text = "Please Input All The Field To Login";
                lblNewAccountPannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtName.Text.ToString()))
            {
                Response.Write("<script>alert('Full Name Is Required')</script>");
                lblNewAccountPannel.Text = "Please Input Full Name To Login";
                lblNewAccountPannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtEmail1.Text.ToString()))
            {
                Response.Write("<script>alert('Email-ID Is Required')</script>");
                lblNewAccountPannel.Text = "Please Input Email-ID To Login";
                lblNewAccountPannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtMobile.Text.ToString()))
            {
                Response.Write("<script>alert('Mobile No Is Required')</script>");
                lblNewAccountPannel.Text = "Please Input Mobile No To Login";
                lblNewAccountPannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtPassword1.Text.ToString()))
            {
                Response.Write("<script>alert('Password Is Required')</script>");
                lblNewAccountPannel.Text = "Please Input Password To Login";
                lblNewAccountPannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else if (string.IsNullOrEmpty(txtCPassword.Text.ToString()))
            {
                Response.Write("<script>alert('Confirm Password Is Required')</script>");
                lblNewAccountPannel.Text = "Please Input Confirm Password To Login";
                lblNewAccountPannel.ForeColor = System.Drawing.Color.DarkRed;
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}