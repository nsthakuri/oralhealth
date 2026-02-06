using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Data & Database
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

// Typed DataSets
using OralHealthTableAdapters;
using maharishiTableAdapters;

public partial class dashboard_OH_WOMENLISTS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lblsucessmsg.Text = "";
            
            BindWomanGrid();
        }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        BindWomanGrid();

    }



    private void BindWomanGrid()
    {
        OralHealthTableAdapters.WomenRosterTableAdapter TA = new OralHealthTableAdapters.WomenRosterTableAdapter();
        OralHealth.WomenRosterDataTable DT = new OralHealth.WomenRosterDataTable();
        if (Address.Text == string.Empty)
        {
            TA.FillByOrderByCreateDate(DT);
        }
        else
        {
            TA.FillByAddress(DT, Address.Text);
        }
        GridWomanList.DataSource = DT;
        GridWomanList.DataBind();
    }

    protected void ButtonCensusSaveData_Click(object sender, EventArgs e)
    {


    }

    protected void GridWomanList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //lblsucessmsg.Text = "";
        if (e.CommandName == "DeleteRow")
        {
            int CensusID = Convert.ToInt32(e.CommandArgument);
            BindWomanGrid();
            //delete from woman list
            var womanListTA = new OralHealthTableAdapters.WomenRosterTableAdapter();
            womanListTA.DeleteQuery(CensusID);
            //PanelSuccess.Visible = true;
            //lblsucessmsg.Text = MsgWomanDeletedFromList;
            BindWomanGrid();
            return;
        }

        //if (e.CommandName == "ButtonAddToCensusWithNNIPS")
        //{
        //    int rowIndex = Convert.ToInt32(e.CommandArgument);
        //    if (rowIndex < 0 || rowIndex >= GridWomanList.Rows.Count)
        //        return;

        //    PrepareCensusForm(
        //        isWithinNNIPS: true,
        //        censusID: GridWomanList.DataKeys[rowIndex]["CensusID"].ToString(),
        //        firstName: GridWomanList.DataKeys[rowIndex]["CensusFirstNames"].ToString(),
        //        lastName: GridWomanList.DataKeys[rowIndex]["CensusLastName"].ToString()
        //    );

        //    return;
        //}

        //if (e.CommandName == "ButtonAddToCensusOutsideNNIPS")
        //{
        //    int rowIndex = Convert.ToInt32(e.CommandArgument);
        //    if (rowIndex < 0 || rowIndex >= GridWomanList.Rows.Count)
        //        return;

        //    PrepareCensusForm(
        //        isWithinNNIPS: false,
        //        censusID: GridWomanList.DataKeys[rowIndex]["CensusID"].ToString(),
        //        firstName: GridWomanList.DataKeys[rowIndex]["CensusFirstNames"].ToString(),
        //        lastName: GridWomanList.DataKeys[rowIndex]["CensusLastName"].ToString()
        //    );

        //    return;
        //}

    }

    protected void ValidateWomanNNIPS(object source, ServerValidateEventArgs args)
    {
        // WITHIN NNIPS → skip validation completely
        if (!ChkCensusNNIPSnum.Visible)
        {
            args.IsValid = true;
            return;
        }

        // OUTSIDE NNIPS
        bool isNew = ChkCensusNNIPSnum.Checked;
        string nnips = NewCensusNNIPSnum.Text.Trim();

        // If "assign new NNIPS" checked → textbox must be empty
        // If unchecked → textbox must have NNIPS
        args.IsValid = isNew ? nnips == "" : nnips != "";
    }

    protected void ValidateHusbandNNIPS(object source, ServerValidateEventArgs args)
    {
        bool isNew = ChkNewHusbandNNIPSNUM.Checked;
        string nnips = NewHusbandNNIPSNUM.Text.Trim();

        args.IsValid = isNew ? nnips == "" : nnips != "";
    }
    protected void ValidateMetStatus(object source, ServerValidateEventArgs args)
    {
        string ms = NewCensusMS.SelectedValue;
        bool valid = true;

        if (ms == "1")
            valid = NewCensusConsent.SelectedValue != "";
        else if (ms == "2")
            valid = NewCensusConsent.SelectedValue == "";

        args.IsValid = valid;
    }

}