using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_OH_SESF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region  VALIDATION
    /****************************
    *       VALIDATION          *
    ****************************/
    private void SetErrorMessage(object source, ServerValidateEventArgs arguments, string message)
    {
        CustomValidator cv = (CustomValidator)source;
        cv.ErrorMessage = message;
        arguments.IsValid = false;
    }
    protected void Validate_ValSEREGLN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEREGLN.Text))
        {
            if (SEREGLN.Text == "5")
            {
                //Other required
                if (Core.IsEmpty(SEREGLNSP.Text))
                {
                    arguments.IsValid = false;
                    //ValSEREGLN.ErrorMessage = Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEREGLNSP.Focus();
                }
            }
            else
            {
                //why not =1, 2, or 9
                //Other not required
                if (!Core.IsEmpty(SEREGLNSP.Text))
                {
                    arguments.IsValid = false;
                    //ValSEREGLN.ErrorMessage = "If #2 <> 5, Other must be blank.";
                    //ValSEREGLN.ErrorMessage = Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEREGLNSP.Focus();
                }
            }
        }
    }
    protected void Validate_ValSELATRN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SELATRN.Text))
        {
            if (SELATRN.Text == "3")
            {
                //Other required
                if (Core.IsEmpty(SELATRNSP.Text))
                {
                    arguments.IsValid = false;
                    //ValSELATRN.ErrorMessage = "If #6 = 3, Other is required.";
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SELATRNSP.Focus();
                }
            }
            else
            {
                //Other not required
                if (!Core.IsEmpty(SELATRNSP.Text))
                {
                    arguments.IsValid = false;
                    //ValSELATRN.ErrorMessage = "If #6 <> 3, Other must be blank.";                
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SELATRNSP.Focus();
                }
            }
        }
    }
    protected void Validate_ValSEOUTHOME(object source, ServerValidateEventArgs arguments)
    {
        if (SEOUTHOME.Text == "00")
        {
            //Fields must be blank
            if (!Core.IsEmpty(SEOUTKAT.Text + SEOUTNEP.Text + SEOUTIND.Text + SEOUTGULF.Text + SEOUTSEA.Text + SEOUTNEA.Text + SEOUTOTH.Text))
            {
                arguments.IsValid = false;
                //ValSEOUTHOME.ErrorMessage = "If #14 = 00, fields (a-g) must be blank.";
                //ValSEOUTHOME.ErrorMessage = Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrSEOUTHOME");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrSEOUTHOME"));
                SEOUTHOME.Focus();
            }
        }
        else if (SEOUTHOME.Text != "99")
        {
            //Other not required
            if (Core.IsEmpty(SEOUTKAT.Text)
                || Core.IsEmpty(SEOUTNEP.Text)
                || Core.IsEmpty(SEOUTIND.Text)
                || Core.IsEmpty(SEOUTGULF.Text)
                || Core.IsEmpty(SEOUTSEA.Text)
                || Core.IsEmpty(SEOUTNEA.Text)
                || Core.IsEmpty(SEOUTOTH.Text))
            {
                arguments.IsValid = false;
                //ValSEOUTHOME.ErrorMessage = "If #14 = 01-98, fields (a-g) must have a value.";
                //ValSEOUTHOME.ErrorMessage = Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqSEOUTHOME");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqSEOUTHOME"));
                SEOUTHOME.Focus();
            }
            else
            {
                // Only validate total if total is 01-97.  If value = 98, total is 98 *or more*.
                if (SEOUTHOME.Text != "98")
                {
                    // check total
                    int intTotal = int.Parse(SEOUTHOME.Text);
                    int intSub = int.Parse(SEOUTKAT.Text) + int.Parse(SEOUTNEP.Text) + int.Parse(SEOUTIND.Text) + int.Parse(SEOUTGULF.Text) + int.Parse(SEOUTSEA.Text) + int.Parse(SEOUTNEA.Text) + int.Parse(SEOUTOTH.Text);
                    if (intTotal != intSub)
                    {
                        arguments.IsValid = false;
                        //ValSEOUTHOME.ErrorMessage = "#14 value (" + intTotal + ") does not match sum of a-g (" + intSub + ")";
                        //ValSEOUTHOME.ErrorMessage = Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrInvSEOUTHOME");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrInvSEOUTHOME"));
                        SEOUTHOME.Focus();
                    }
                }
            }
        }
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        //GridMain.PageIndex = e.NewPageIndex;
    }
    protected void GridMain_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Control Row display based on data
            //Label LB = (Label)e.Row.FindControl("NA_01_APE_CODE");
            //Image IM = (Image)e.Row.FindControl("ImageCheckYesNo");
            //Label LM = (Label)e.Row.FindControl("LabelMessage");
            //if (LB.Text =="")
            //{
            //    //Change the row color.
            //    LM.Text = "<br>Não corresponde a um evento de morte";
            //    LM.ForeColor = System.Drawing.Color.RosyBrown;
            //    IM.ImageUrl = "img/check_no.png";
            //}
        }
    }

    //section b
    protected void CustVal_HFWORRYTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEWORRYFOOD.Text))
        {
            if (SEWORRYFOOD.Text == "0"
                || SEWORRYFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SEWORRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEWORRYTIMS.Focus();
                }
            }
            else if (SEWORRYFOOD.Text == "1")
            {
                if (Core.IsEmpty(SEWORRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEWORRYTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFLACKTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SELACKFOOD.Text))
        {
            if (SELACKFOOD.Text == "0"
                || SELACKFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SELACKTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SELACKTIMS.Focus();
                }
            }
            else if (SELACKFOOD.Text == "1")
            {
                if (Core.IsEmpty(SELACKTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SELACKTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFLMTTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SELMTFOOD.Text))
        {
            if (SELMTFOOD.Text == "0"
                || SELMTFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SELMTTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SELMTTIMS.Focus();
                }
            }
            else if (SELMTFOOD.Text == "1")
            {
                if (Core.IsEmpty(SELMTTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SELMTTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFRESRCTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SERESRCFOOD.Text))
        {
            if (SERESRCFOOD.Text == "0"
                || SERESRCFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SERESRCTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SERESRCTIMS.Focus();
                }
            }
            else if (SERESRCFOOD.Text == "1")
            {
                if (Core.IsEmpty(SERESRCTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SERESRCTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFSMALLTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SESMALLFOOD.Text))
        {
            if (SESMALLFOOD.Text == "0"
                || SESMALLFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SESMALLTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SESMALLTIMS.Focus();
                }
            }
            else if (SESMALLFOOD.Text == "1")
            {
                if (Core.IsEmpty(SESMALLTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SESMALLTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFFEWTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEFEWFOOD.Text))
        {
            if (SEFEWFOOD.Text == "0"
                || SEFEWFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SEFEWTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEFEWTIMS.Focus();
                }
            }
            else if (SEFEWFOOD.Text == "1")
            {
                if (Core.IsEmpty(SEFEWTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEFEWTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFNOFOODTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SENOFOOD.Text))
        {
            if (SENOFOOD.Text == "0"
                || SENOFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SENOFOODTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SENOFOODTIMS.Focus();
                }
            }
            else if (SENOFOOD.Text == "1")
            {
                if (Core.IsEmpty(SENOFOODTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SENOFOODTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFHUNGRYTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEHUNGRYFOOD.Text))
        {
            if (SEHUNGRYFOOD.Text == "0"
                || SEHUNGRYFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SEHUNGRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEHUNGRYTIMS.Focus();
                }
            }
            else if (SEHUNGRYFOOD.Text == "1")
            {
                if (Core.IsEmpty(SEHUNGRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEHUNGRYTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFENGHTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEENGHFOOD.Text))
        {
            if (SEENGHFOOD.Text == "0"
                || SEENGHFOOD.Text == "9")
            {
                if (!Core.IsEmpty(SEENGHTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEENGHTIMS.Focus();
                }
            }
            else if (SEENGHFOOD.Text == "1")
            {
                if (Core.IsEmpty(SEENGHTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEENGHTIMS.Focus();
                }
            }
        }
    }
    protected void Validate_RequiredSEOTHERSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEOTHER.Text))
        {
            if (SEOTHER.Text == "0" || SEOTHER.Text == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEOTHERSP.Focus();
                }
            }
            else
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEOTHERSP.Focus();
                }
            }
        }
    }

    protected void Validate_RequiredSEOUTOTHSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(SEOUTOTH.Text))
        {
            if (SEOUTOTH.Text == "00" || SEOUTOTH.Text == "99")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrNoReqField"));
                    SEOUTOTHSP.Focus();
                }
            }
            else
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "SESF", "ErrReqField"));
                    SEOUTOTHSP.Focus();
                }
            }
        }
    }
    #endregion

}