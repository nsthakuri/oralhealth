using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_OH_LPVF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region VALIDATION
    /*************************
    *      VALIDATION       *
    *************************/

    protected void CustVal_WomaStatusRequired(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (LPVVS.SelectedValue == "X")
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrVS"));
            LPVVS.Focus();
            return;
        }

        if (LPVVS.SelectedValue == "1")
        {
            if (LPVMS.SelectedValue == "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMS"));
                LPVMS.Focus();
                return;
            }
            else if (LPVMS.SelectedValue == "1")
            {
                if (LPVPS.SelectedValue == "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrPS"));
                    LPVPS.Focus();
                    return;
                }
                else if (LPVPS.SelectedValue == "1"
                    || LPVPS.SelectedValue == "2"
                    || LPVPS.SelectedValue == "9")
                {
                    if (LPVFS.SelectedValue == "X")
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrFS"));
                        LPVFS.Focus();
                        return;
                    }
                }
                else if (LPVPS.SelectedValue == "3")
                {
                    if (LPVFS.SelectedValue != "X")
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNotFS"));
                        LPVFS.Focus();
                        return;
                    }
                }
            }
            else if (LPVMS.SelectedValue == "2")
            {
                if (LPVPS.SelectedValue != "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNotPS"));
                    LPVPS.Focus();
                    return;
                }
                if (LPVFS.SelectedValue != "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNotFS"));
                    LPVFS.Focus();
                    return;
                }
            }
        }
        else if (LPVVS.SelectedValue == "8")
        {
            if (LPVMS.SelectedValue != "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNotMS"));
                LPVMS.Focus();
                return;
            }
            if (LPVPS.SelectedValue != "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNotPS"));
                LPVPS.Focus();
                return;
            }
            if (LPVFS.SelectedValue != "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNotFS"));
                LPVFS.Focus();
                return;
            }
        }
        */
    }
    protected void CustVal_ValidateTOB2AMPM(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVBP2REQ.Text))
        {
            if (LPVBP2REQ.Text == "1")
            {
                if (Core.IsEmpty(LPVTOB2HH.Text) ||
                    Core.IsEmpty(LPVTOB2MM.Text) ||
                    LPVTOB2AMPM.SelectedValue == "X")
                {
                    //      SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVTOB2HH.Focus();
                }
                //2nd BP should be taken after 1hr of 1st BP
                //TimeSpan TimeDiff = (DateTime)BP2TIME - (DateTime)BP1TIME;
                //double Minutes = TimeDiff.TotalMinutes;
                //if (Minutes < 60)
                // {
                //   SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrBPTIME"));
                //  LPVTOB2HH.Focus();
                // }
            }
            else
            {
                if (!Core.IsEmpty(LPVTOB2HH.Text) ||
                    !Core.IsEmpty(LPVTOB2MM.Text) ||
                    LPVTOB2AMPM.SelectedValue != "X")
                {
                    //   SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVTOB2HH.Focus();
                }
            }
        }
    }



    protected void CustVal_ValidateBodyTemperature(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVTEMPWhole.Text) && !Core.IsEmpty(LPVTEMPFract.Text))
        {
            if (LPVTEMPWhole.Text == "999")
            {
                if (LPVTEMPFract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTemp9"));
                    LPVTEMPWhole.Focus();
                }
            }
            if (LPVTEMPWhole.Text == "666")
            {
                if (LPVTEMPFract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTemp6"));
                    LPVTEMPWhole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate1MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVMUAC1Whole.Text) && !Core.IsEmpty(LPVMUAC1Fract.Text))
        {
            if (LPVMUAC1Whole.Text == "99")
            {
                if (LPVMUAC1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC9"));
                    LPVMUAC1Whole.Focus();
                }
            }
            if (LPVMUAC1Whole.Text == "66")
            {
                if (LPVMUAC1Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC6"));
                    LPVMUAC1Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate2MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVMUAC2Whole.Text) && !Core.IsEmpty(LPVMUAC2Fract.Text))
        {
            if (LPVMUAC2Whole.Text == "99")
            {
                if (LPVMUAC2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC9"));
                    LPVMUAC2Whole.Focus();
                }
            }
            if (LPVMUAC2Whole.Text == "66")
            {
                if (LPVMUAC2Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC6"));
                    LPVMUAC2Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate3MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVMUAC3Whole.Text) && !Core.IsEmpty(LPVMUAC3Fract.Text))
        {
            if (LPVMUAC3Whole.Text == "99")
            {
                if (LPVMUAC3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC9"));
                    LPVMUAC3Whole.Focus();
                }
            }
            if (LPVMUAC3Whole.Text == "66")
            {
                if (LPVMUAC3Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC6"));
                    LPVMUAC3Whole.Focus();
                }
            }
            /*
            if (!Core.IsEmpty(LitPEFMedianMUAC.Text))
            {
                decimal decPEFMUAC = decimal.Parse(LitPEFMedianMUAC.Text);
                decimal decLPVMUAC = decimal.Parse(MedianMUAC);
                if (decLPVMUAC < decPEFMUAC)
                {
                    SetErrorMessage(source, arguments, "PEF भिजिटमा लिईएको MUAC (" + LitPEFMedianMUAC.Text + ") भन्दा कम छ।  कृपया पुन: नाप लिएर​ निश्चित गर्नुहोस। <br />");
                }
            }
            */
        }
    }
    protected void CustVal_Validate2SYSDIA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVSYS2.Text) && !Core.IsEmpty(LPVDIA2.Text))
        {
            if (LPVSYS2.Text == "999")
            {
                if (LPVDIA2.Text != "999")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrSYSDIA9"));
                    LPVDIA2.Focus();
                }
            }
            if (LPVSYS2.Text == "666")
            {
                if (LPVDIA2.Text != "666")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrSYSDIA6"));
                    LPVDIA2.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate2DIA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVBP2REQ.Text))
        {
            if (LPVBP2REQ.Text == "1")
            {
                if (Core.IsEmpty(LPVSYS2.Text) ||
                    Core.IsEmpty(LPVDIA2.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVSYS2.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(LPVSYS2.Text) ||
                    !Core.IsEmpty(LPVDIA2.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVSYS2.Focus();
                }
            }
        }
    }

    protected void CustVal_FRSTBPRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVBP2REQ.Text))
        {
            if (int.Parse(LPVSYS1.Text) > 140
                || int.Parse(LPVDIA1.Text) > 90)
            {
                if (LPVBP2REQ.Text == "0")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReq2BP"));
                    LPVBP2REQ.Focus();
                }
            }
            else if (int.Parse(LPVSYS1.Text) < 140
                || int.Parse(LPVDIA1.Text) < 90)
            {
                if (LPVBP2REQ.Text == "1")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNo2BP"));
                    LPVBP2REQ.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate1SYSDIA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVSYS1.Text) && !Core.IsEmpty(LPVDIA1.Text))
        {
            if (LPVSYS1.Text == "999")
            {
                if (LPVDIA1.Text != "999")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrSYSDIA9"));
                    LPVSYS1.Focus();
                }
            }
            if (LPVSYS1.Text == "666")
            {
                if (LPVDIA1.Text != "666")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrSYSDIA6"));
                    LPVSYS1.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate1Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVWT1Whole.Text) && !Core.IsEmpty(LPVWT1Fract.Text))
        {
            if (LPVWT1Whole.Text == "99")
            {
                if (LPVWT1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight9"));
                    LPVWT1Whole.Focus();
                }
            }
            if (LPVWT1Whole.Text == "66")
            {
                if (LPVWT1Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight6"));
                    LPVWT1Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate2Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVWT2Whole.Text) && !Core.IsEmpty(LPVWT2Fract.Text))
        {
            if (LPVWT2Whole.Text == "99")
            {
                if (LPVWT2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight9"));
                    LPVWT2Whole.Focus();
                }
            }
            if (LPVWT2Whole.Text == "66")
            {
                if (LPVWT2Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight6"));
                    LPVWT2Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate3Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVWT3Whole.Text) && !Core.IsEmpty(LPVWT3Fract.Text))
        {
            if (LPVWT3Whole.Text == "99")
            {
                if (LPVWT3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight9"));
                    LPVWT3Whole.Focus();
                }
            }
            if (LPVWT3Whole.Text == "66")
            {
                if (LPVWT3Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight6"));
                    LPVWT3Whole.Focus();
                }
            }
            //if (!Core.IsEmpty(LitPEFMedianWT.Text))
            //{
            //    decimal decPEFWt = decimal.Parse(LitPEFMedianWT.Text);
            //    decimal decLPVWt = decimal.Parse(MedianWeight);
            //    if (decLPVWt <= decPEFWt)
            //    {
            //        SetErrorMessage(source, arguments, "PEF भिजिटमा लिईएको तौल (" + LitPEFMedianWT.Text + ") भन्दा कम छ।  कृपया पुन: तौल लिएर​ निश्चित गर्नुहोस। <br />");
            //    }
            //}
        }
    }
    protected void CustVal_RequiredLPVDELLOCSP(object source, ServerValidateEventArgs arguments)
    {
        if (LPVDELLOC.Text == "7")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                LPVDELLOCSP.Focus();
            }
        }
        else
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVDELLOCSP.Focus();
            }
        }

        /*
        if (!Core.IsEmpty(LPVDELLOC.Text))
        {
            if (LPVDELLOC.Text == "7")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVDELLOCSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVDELLOCSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVDELLOC.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVDELLOCSP.Focus();
            }
        }
        */
    }

    protected void CustVal_RequiredLPVFACILITYSP(object source, ServerValidateEventArgs arguments)
    {
        if (LPVFACILITY.SelectedValue == "98")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                LPVFACILITYSP.Focus();
            }
        }
        else
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVFACILITYSP.Focus();
            }
        }

        /*
        if (!Core.IsEmpty(LPVFACILITY.Text))
        {
            if (LPVFACILITY.Text == "98")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVFACILITYSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVFACILITYSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVFACILITY.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVFACILITYSP.Focus();
            }
        }
        */
    }

    //section h
    protected void CustVal_HFWORRYTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVWORRYFOOD.Text))
        {
            if (LPVWORRYFOOD.Text == "0"
                || LPVWORRYFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVWORRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVWORRYTIMS.Focus();
                }
            }
            else if (LPVWORRYFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVWORRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVWORRYTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFLACKTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVLACKFOOD.Text))
        {
            if (LPVLACKFOOD.Text == "0"
                || LPVLACKFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVLACKTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVLACKTIMS.Focus();
                }
            }
            else if (LPVLACKFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVLACKTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVLACKTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFLMTTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVLMTFOOD.Text))
        {
            if (LPVLMTFOOD.Text == "0"
                || LPVLMTFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVLMTTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVLMTTIMS.Focus();
                }
            }
            else if (LPVLMTFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVLMTTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVLMTTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFRESRCTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVRESRCFOOD.Text))
        {
            if (LPVRESRCFOOD.Text == "0"
                || LPVRESRCFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVRESRCTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVRESRCTIMS.Focus();
                }
            }
            else if (LPVRESRCFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVRESRCTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVRESRCTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFSMALLTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVSMALLFOOD.Text))
        {
            if (LPVSMALLFOOD.Text == "0"
                || LPVSMALLFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVSMALLTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVSMALLTIMS.Focus();
                }
            }
            else if (LPVSMALLFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVSMALLTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVSMALLTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFFEWTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVFEWFOOD.Text))
        {
            if (LPVFEWFOOD.Text == "0"
                || LPVFEWFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVFEWTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVFEWTIMS.Focus();
                }
            }
            else if (LPVFEWFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVFEWTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVFEWTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFNOFOODTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVNOFOOD.Text))
        {
            if (LPVNOFOOD.Text == "0"
                || LPVNOFOOD.Text == "9")
            {
                if (!Core.IsEmpty(LPVNOFOODTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVNOFOODTIMS.Focus();
                }
            }
            else if (LPVNOFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVNOFOODTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVNOFOODTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFHUNGRYTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVHUNGRYFOOD.Text))
        {
            if (LPVHUNGRYFOOD.Text == "0")
            {
                if (!Core.IsEmpty(LPVHUNGRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVHUNGRYTIMS.Focus();
                }
            }
            else if (LPVHUNGRYFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVHUNGRYTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVHUNGRYTIMS.Focus();
                }
            }
        }
    }
    protected void CustVal_HFENGHTIMSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVENGHFOOD.Text))
        {
            if (LPVENGHFOOD.Text == "0")
            {
                if (!Core.IsEmpty(LPVENGHTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVENGHTIMS.Focus();
                }
            }
            else if (LPVENGHFOOD.Text == "1")
            {
                if (Core.IsEmpty(LPVENGHTIMS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVENGHTIMS.Focus();
                }
            }
        }
    }
    /*
    protected void CustVal_LPVFACILITYRequired(object source, ServerValidateEventArgs arguments)
    {
        if(LPVDELLOC.Text == "3" || LPVDELLOC.Text == "4"
            || LPVDELLOC.Text == "5" || LPVDELLOC.Text == "6")
        {
            if (LPVFACILITY.SelectedValue == "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                LPVFACILITY.Focus();
            }
        }
        else if (LPVDELLOC.Text == "1" || LPVDELLOC.Text == "2"
            || LPVDELLOC.Text == "7" || LPVDELLOC.Text == "9")
        {
            if (LPVFACILITY.SelectedValue != "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVFACILITY.Focus();
            }
        }

        /*
        if (!Core.IsEmpty(LPVDELLOC.Text))
        {
            if (LPVDELLOC.Text == "1" || LPVDELLOC.Text == "2"
             || LPVDELLOC.Text == "7" || LPVDELLOC.Text == "9")
            {
                if (!Core.IsEmpty(LPVFACILITY.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVFACILITY.Focus();
                }
            }
            else if (LPVDELLOC.Text == "3" || LPVDELLOC.Text == "4"
                  || LPVDELLOC.Text == "5" || LPVDELLOC.Text == "6")
            {
                if (Core.IsEmpty(LPVFACILITY.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVFACILITY.Focus();
                }
            }
        }
        
    }
    */
    protected void CustVal_SectionABCDGeneric(object source, ServerValidateEventArgs arguments)
    {
        if (Core.IsEmpty(arguments.Value))
        {
            if (MayFillOutInSectionABCDGeneric())
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
            }
        }
        else //Not empty
        {
            if (!MayFillOutInSectionABCDGeneric())
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
            }
        }
    }

    protected bool MayFillOutInSectionABCDGeneric()
    {
        //if ((LPVPS.SelectedValue == "1"
        //    || LPVPS.SelectedValue == "9"))
        //{
        //    return true;
        //}
        //else
        //{
        //    return false;
        //}
        return false;
    }

    protected void CustVal_AbenValidation(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVALBE.Text))
        {
            if (LPVALBE.Text == "0")
            {
                if (Core.IsEmpty(LPVALBEGIVN.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVALBEGIVN.Focus();
                }
            }
            if (LPVALBE.Text == "1" || LPVALBE.Text == "9")
            {
                if (!Core.IsEmpty(LPVALBEGIVN.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVALBEGIVN.Focus();
                }
            }
        }
    }

    protected void CustVal_CovidValidation(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVCOVID.Text))
        {
            if (LPVCOVID.Text == "1" || LPVCOVID.Text == "2" || LPVCOVID.Text == "3")
            {
                if (Core.IsEmpty(LPVCOVIDPREG.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVCOVIDPREG.Focus();
                }
            }
            if (LPVCOVID.Text == "0" || LPVCOVID.Text == "9")
            {
                if (!Core.IsEmpty(LPVCOVIDPREG.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVCOVIDPREG.Focus();
                }
            }
        }
    }

    protected void CustVal_CareLocationsA(object source, ServerValidateEventArgs arguments)
    {
        if (MayFillOutInSectionABCDGeneric() == true && LPVTREAT.Text == "1" &&
            Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
        }
        else if (MayFillOutInSectionABCDGeneric() == false || LPVTREAT.Text != "1")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
            }
        }
    }
    protected void CustVal_CareLocationsBandC(object source, ServerValidateEventArgs arguments)
    {
        if (MayFillOutInSectionABCDGeneric() == false || LPVTREAT.Text != "1")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
            }
        }
    }
    protected void CustVal_RequiredIfExperiencedSymptom(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (MayFillOutInSectionABCDGeneric() == true)
        {
            //Get the custom validator
            CustomValidator cv = (CustomValidator)source;

            //Get the num of days textbox name by dropping 'cv' at the beginning, 'TRT' at the end
            string numDaysCtrlName = cv.ID.Substring(2, (cv.ID.Length - 5));
            TextBox numDaysTextBoxCtrl = (TextBox)PanelForm.FindControl(numDaysCtrlName);

            //Make sure it is numeric.  If no, we skip validating (a separate RegEx validator should handle this)
            if (Regex.IsMatch(numDaysTextBoxCtrl.Text, "^[0-69]+$"))
            {
                Int32 numDays = Int32.Parse(numDaysTextBoxCtrl.Text);
                if (numDays > 0 && numDays <= 30)
                {
                    if (Core.IsEmpty(arguments.Value))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                        numDaysTextBoxCtrl.Focus();
                    }
                }
                else if (numDays == 0)
                {
                    if (!Core.IsEmpty(arguments.Value))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                        numDaysTextBoxCtrl.Focus();

                    }
                }
                if (numDays == 99)
                {
                    if (Core.IsEmpty(arguments.Value))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                        numDaysTextBoxCtrl.Focus();
                    }
                }
                //numDays == 99  [required to make consistent]
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));

        }
        */
    }

    protected void Validate_LPVLDINS(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (LPVPS.SelectedValue.ToString() == "1")
        {
            if (Core.IsEmpty(LPVLDINS.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                LPVLDINS.Focus();
            }
        }
        else if (LPVPS.SelectedValue.ToString() == "2")
        {
            if (!Core.IsEmpty(LPVLDINS.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVLDINS.Focus();
            }
        }
        */
    }
    protected void CustVal_ABCDuplicate(object source, ServerValidateEventArgs arguments)
    {
        /*
        CustomValidator validationObject = (CustomValidator)source;
        String textBoxAName = validationObject.ControlToValidate;
        String textBoxBName = textBoxAName.Substring(0, textBoxAName.Length - 1) + "B";
        String textBoxCName = textBoxBName.Substring(0, textBoxAName.Length - 1) + "C";
        TextBox ItemA = (TextBox)PanelForm.FindControl(textBoxAName);
        TextBox ItemB = (TextBox)PanelForm.FindControl(textBoxBName);
        TextBox ItemC = (TextBox)PanelForm.FindControl(textBoxCName);

        if ((!Core.IsEmpty(ItemA.Text) && ItemA.Text == ItemB.Text) ||
             (!Core.IsEmpty(ItemB.Text) && ItemB.Text == ItemC.Text) ||
             (!Core.IsEmpty(ItemC.Text) && ItemC.Text == ItemA.Text))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrUniqueValue"));
            arguments.IsValid = false;
        }
        */
    }
    protected void Validate_LPVPICTPAMPH(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (LPVPS.SelectedValue.ToString() == "1" ||
            LPVPS.SelectedValue.ToString() == "2")
        {
            if (Core.IsEmpty(LPVPICTPAMPH.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                LPVPICTPAMPH.Focus();
            }
        }
        */
        //else if (LPVPS.SelectedValue.ToString() == "2")
        //{
        //    if (!Core.IsEmpty(LPVLDINS.Text))
        //    {                
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
        //        LPVPICTPAMPH.Focus();
        //    }
        //}
    }

    //no needed

    protected void CustVal_LPVCALCBUYRequired(object source, ServerValidateEventArgs arguments)
    {
        /*
        if(!Core.IsEmpty(LPVCALC.Text))
        {
            if(LPVCALC.Text == "1" || LPVCALC.Text == "9")
            {                
                if(!Core.IsEmpty(LPVCALCBUY.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVCALCBUY.Focus();
                }
            }
            else
            {
                if (Core.IsEmpty(LPVCALCBUY.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVCALCBUY.Focus();
                }
            }
        }
        */
    }

    protected void Validate_LPVCBK(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (LPVPS.SelectedValue.ToString() == "1")
        {
            if (Core.IsEmpty(LPVCBK.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                LPVCBK.Focus();
            }
        }
        else if (LPVPS.SelectedValue.ToString() == "2")
        {
            if (!Core.IsEmpty(LPVCBK.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVCBK.Focus();
            }
        }
        */
    }

    protected void CustVal_RequiredIfYesBidi(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfABCDAndYesTobAlc(source, arguments, LPVBIDI.Text, LPVBIDID.Text);
    }
    protected void CustVal_RequiredIfYesChwTob(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfABCDAndYesTobAlc(source, arguments, LPVTOB.Text, LPVTOBD.Text);
    }
    protected void CustVal_RequiredIfYesJaard(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfABCDAndYesTobAlc(source, arguments, LPVJAARD.Text, LPVJAARDD.Text);
    }
    protected void CustVal_RequiredIfYesRakshi(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfABCDAndYesTobAlc(source, arguments, LPVRAKSHI.Text, LPVRAKSHID.Text);
    }

    protected void RequiredIfABCDAndYesTobAlc(object source, ServerValidateEventArgs arguments, string yesno, string numdays)
    {
        if (MayFillOutInSectionABCDGeneric())
        {
            if (yesno == "1" && numdays != "99")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                }
            }
            else if (yesno == "0" || yesno == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                }
            }
        }
        else
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
            }
        }
    }

    protected void CustVal_RequiredIfYesHealthPost(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROSUPL.Text))
        {
            if (LPVPROSUPL.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROSUPL.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROSUPL.Focus();
                }
            }
        }
    }

    protected void CustVal_RequiredIfYesProtein(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROSUPL.Text))
        {
            if (LPVPROSUPL.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROSUPL.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROSUPL.Focus();
                }
            }
        }
    }

    protected void RequiredIfYesToProtein(object source, ServerValidateEventArgs arguments, string yesno)
    {
        if (yesno == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
            }
        }
        else if ((yesno == "0" || yesno == "9") || (LPVPROSUPL.Text == "0"))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
            }
        }
    }

    protected void CustVal_RequiredIfYesProtiking(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVPROTIK.Text);
    }

    protected void CustVal_RequiredIfYesProvical(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVPROVIC.Text);
    }
    //
    protected void CustVal_RequiredIfYesExprot(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVEXPROT.Text);
    }
    protected void CustVal_RequiredIfYesEsprot(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVESPROT.Text);
    }
    protected void CustVal_RequiredIfYesSamapro(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVSAMAPRO.Text);
    }
    protected void CustVal_RequiredIfYesVitPro(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVVITPRO.Text);
    }
    protected void CustVal_RequiredIfYesVitaPro(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVVITAPRO.Text);
    }
    protected void CustVal_RequiredIfYesProPL(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVPROPL.Text);
    }
    protected void CustVal_RequiredIfYesProDK(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVPRODK.Text);
    }
    protected void CustVal_RequiredIfYesHLTHPOST(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVHLTHPOST.Text);
    }
    protected void CustVal_RequiredIfYesOthers(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesToProtein(source, arguments, LPVPROSP.Text);
    }
    protected void CustVal_WeightRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MayFillOutInSectionABCDGeneric())
        {
            //string errMsg = "";
            //if (Core.IsEmpty(LPVWTWhole.Text))
            //{                
            //    errMsg = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWTWhole");                
            //}
            //if (Core.IsEmpty(LPVWTFract.Text))
            //{                
            //    errMsg += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWTFrac");
            //}
            //if (!Core.IsEmpty(errMsg))
            //{
            //    SetErrorMessage(source, arguments, errMsg);
            //}
        }
        //else if (!Core.IsEmpty(LPVWTWhole.Text) || !Core.IsEmpty(LPVWTFract.Text))
        //{            
        //    //SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWT"));
        //}
    }

    protected void CustVal_RequiredProtikingSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROTIKADV.Text))
        {
            if (LPVPROTIKADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROTIKSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROTIKSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPROTIKADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPROTIKSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredProvicalSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROVICADV.Text))
        {
            if (LPVPROVICADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROVICSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROVICSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPROVICADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPROVICSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredExprotSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVEXPROTADV.Text))
        {
            if (LPVEXPROTADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVEXPROTSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVEXPROTSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVEXPROTADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVEXPROTSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredEsprotSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVESPROTADV.Text))
        {
            if (LPVESPROTADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVESPROTSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVESPROTSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVESPROTADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVESPROTSP.Focus();
            }
        }
    }

    protected void CustVal_RequireSamaproSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVSAMAPROADV.Text))
        {
            if (LPVSAMAPROADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVSAMAPROSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVSAMAPROSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVSAMAPROADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVSAMAPROSP.Focus();
            }
        }
    }

    protected void CustVal_RequireVitProSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVVITPROADV.Text))
        {
            if (LPVVITPROADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVVITPROSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVVITPROSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVVITPROADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVVITPROSP.Focus();
            }
        }
    }


    protected void CustVal_RequireVitaProSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVVITAPROADV.Text))
        {
            if (LPVVITAPROADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVVITAPROSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVVITAPROSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVVITAPROADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVVITAPROSP.Focus();
            }

        }
    }

    protected void CustVal_RequireProPLSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROPLADV.Text))
        {
            if (LPVPROPLADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROPLSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROPLSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPROPLADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPROPLSP.Focus();
            }
        }
    }

    protected void CustVal_RequireProDKSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPRODKADV.Text))
        {
            if (LPVPRODKADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPRODKSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPRODKSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPRODKADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPRODKSP.Focus();
            }
        }
    }

    protected void CustVal_RequireProteinSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROSPADV.Text))
        {
            if (LPVPROSPADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROSPOTHSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROSPOTHSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPROSPADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPROSPOTHSP.Focus();
            }
        }
    }

    protected void CustVal_RequireHealthPostSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVHLTHPOSTADV.Text))
        {
            if (LPVHLTHPOSTADV.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVHLTHPOSTSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVHLTHPOSTSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVHLTHPOSTADV.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVHLTHPOSTSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredLPVPROSPOTHOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPROSP.Text))
        {
            if (LPVPROSP.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPROSPOTH.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPROSPOTH.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPROSP.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPROSPOTH.Focus();
            }
        }
    }

    protected void CustVal_RequiredLPVPRODKOTHRS(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPRODK.Text))
        {
            if (LPVPRODK.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPRODKOTHRS.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPRODKOTHRS.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVPRODK.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVPRODKOTHRS.Focus();
            }
        }
    }
    protected void CustVal_LPVPRTN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVDIA2.Text))
        {
            if ((int.Parse(LPVSYS2.Text) > 140
                        || int.Parse(LPVDIA2.Text) > 90))
            {
                if (LPVPRTN.Text == "0")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "Err2Protein"));
                    LPVPRTN.Focus();
                }
            }
            else if ((int.Parse(LPVSYS2.Text) <= 140)
                   || (int.Parse(LPVDIA2.Text) <= 90))
            {
                if (LPVPRTN.Text == "1")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "Err1Protein"));
                    LPVPRTN.Focus();
                }
            }
        }
    }

    protected void CustVal_LPVPRTNRES(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVPRTN.Text))
        {
            if (LPVPRTN.Text == "1")
            {
                if (Core.IsEmpty(LPVPRTNRES.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVPRTN.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(LPVPRTNRES.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVPRTN.Focus();
                }
            }
        }
    }
    protected void CustVal_WeightFormat(object source, ServerValidateEventArgs arguments)
    {
        //Note: Validation is skipped if either field is empty
        string message = "";
        //if (MayFillOutInSectionABCDGeneric() && !Core.IsEmpty(LPVWTWhole.Text) && !Core.IsEmpty(LPVWTFract.Text))
        //{
        //    if (!Regex.IsMatch(LPVWTWhole.Text, "^(?:04[0-9]|05[0-9]|06[0-9]|07[0-9]|08[0-9]|666|999)$"))
        //    {                
        //        message = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight1");
        //    }
        //    if (!Regex.IsMatch(LPVWTFract.Text, "^[0-9]$"))
        //    {                
        //        message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight2");

        //    }
        //    if (LPVWTWhole.Text == "666" && LPVWTFract.Text != "6")
        //    {                
        //        message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrWeight9");
        //    }
        //    if (!Core.IsEmpty(message))
        //    {
        //        message.Trim();
        //        SetErrorMessage(source, arguments, message);
        //    }
        //}
    }

    protected void CustVal_BodyTemperatureRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MayFillOutInSectionABCDGeneric())
        {
            string errMsg = "";
            if (Core.IsEmpty(LPVTEMPWhole.Text))
            {
                errMsg = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTMPWhole");
            }
            if (Core.IsEmpty(LPVTEMPFract.Text))
            {
                errMsg += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTMPFrac");
            }
            if (!Core.IsEmpty(errMsg))
            {
                SetErrorMessage(source, arguments, errMsg);
            }
        }
        else if (!Core.IsEmpty(LPVTEMPWhole.Text) || !Core.IsEmpty(LPVTEMPFract.Text))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTMP"));
        }
    }
    protected void Validate_RequiredPEOTHRBEVRGSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(LPVOTHRBEVRG.Text))
        {
            if (LPVOTHRBEVRG.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrReqField"));
                    LPVOTHRBEVRG.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                    LPVOTHRBEVRG.Focus();
                }
            }
        }
        else if (Core.IsEmpty(LPVOTHRBEVRG.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrNoReqField"));
                LPVOTHRBEVRG.Focus();
            }
        }
    }
    protected void CustVal_MUACRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MayFillOutInSectionABCDGeneric())
        {
            string errMsg = "";
            //if (Core.IsEmpty(LPVMUACWhole.Text))
            //{
            //    errMsg = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUACWhole");
            //}
            //if (Core.IsEmpty(LPVMUACFract.Text))
            //{
            //    errMsg += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUACFrac");
            //}
            //if (!Core.IsEmpty(errMsg))
            //{
            //    SetErrorMessage(source, arguments, errMsg);
            //}
        }
        //else if (!Core.IsEmpty(LPVMUACWhole.Text) || !Core.IsEmpty(LPVMUACFract.Text))
        //{
        //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC"));
        //}
    }
    protected void CustVal_MUACTFormat(object source, ServerValidateEventArgs arguments)
    {
        //Note: Validation is skipped if either field is empty
        string message = "";
        //if (MayFillOutInSectionABCDGeneric() && !Core.IsEmpty(LPVMUACWhole.Text) && !Core.IsEmpty(LPVMUACFract.Text))
        //{
        //    if (!Regex.IsMatch(LPVMUACWhole.Text, "^(?:0(?:[3-7]|80)|99)$"))
        //    {
        //        message = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC1");
        //    }
        //    if (!Regex.IsMatch(LPVMUACFract.Text, "^[0-9]$"))
        //    {
        //        message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC2");

        //    }
        //    if (LPVMUACWhole.Text == "99" && LPVMUACFract.Text != "9")
        //    {
        //        message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrMUAC9");
        //    }
        //    if (!Core.IsEmpty(message))
        //    {
        //        message.Trim();
        //        SetErrorMessage(source, arguments, message);
        //    }
        //}
    }
    //protected void CustVal_BloodPressureRequired(object source, ServerValidateEventArgs arguments)
    //{
    //    if (MayFillOutInSectionABCDGeneric())
    //    {
    //        string errMsg = "";
    //        if (Core.IsEmpty(LPVSYS.Text))
    //        {                
    //            errMsg = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrSys");
    //        }
    //        if (Core.IsEmpty(LPVDIA.Text))
    //        {                
    //            errMsg += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrDia");
    //        }
    //        if (!Core.IsEmpty(errMsg))
    //        {
    //            SetErrorMessage(source, arguments, errMsg);
    //        }
    //    }
    //    else if (!Core.IsEmpty(LPVSYS.Text) || !Core.IsEmpty(LPVDIA.Text))
    //    {            
    //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrBldPre"));
    //    }
    //}
    //protected void CustVal_BloodPressureSysDiaCmp(object source, ServerValidateEventArgs arguments)
    //{
    //    //Cmp validator does not handle 999s well so using custom
    //    if (LPVSYS.Text == "999" || LPVDIA.Text == "999" ||
    //        Core.IsEmpty(LPVSYS.Text) || Core.IsEmpty(LPVDIA.Text))
    //    {
    //    }
    //    else
    //    {
    //        if (int.Parse(LPVDIA.Text) >= int.Parse(LPVSYS.Text))
    //        {
    //            arguments.IsValid = false;
    //        }
    //    }
    //}

    protected void CustVal_BodyTemperatureFormat(object source, ServerValidateEventArgs arguments)
    {
        /*
        string message = "";
        if (MayFillOutInSectionABCDGeneric() && !Core.IsEmpty(LPVTEMPWhole.Text) && !Core.IsEmpty(LPVTEMPFract.Text))
        {
            if (!Regex.IsMatch(LPVTEMPWhole.Text, "^(?:09[0-9]|10[0-7]|999|666)$"))
            {
                message = Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTemp1");
            }
            if (!Regex.IsMatch(LPVTEMPFract.Text, "^[0-9]$"))
            {
                message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTemp2");
            }
            if (LPVTEMPWhole.Text == "999" && LPVTEMPFract.Text != "9")
            {
                message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTemp9");
            }
            if (LPVTEMPWhole.Text == "666" && LPVTEMPFract.Text != "6")
            {
                message += Core.GetLocalText(Master.strLangType, "mint4", "LPVF", "ErrTemp4");
            }
            if (!Core.IsEmpty(message))
            {
                message.Trim();
                SetErrorMessage(source, arguments, message);
            }
        }
        */
    }


    private void SetErrorMessage(object source, ServerValidateEventArgs arguments, string message)
    {
        CustomValidator cv = (CustomValidator)source;
        cv.ErrorMessage = message;
        arguments.IsValid = false;
        return;
    }

    #endregion
}