using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_OH_MBAF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region VALIDATION
    /*************************
    *      VALIDATION       *
    *************************/

    private void SetErrorMessage(object source, ServerValidateEventArgs arguments, string message)
    {
        CustomValidator cv = (CustomValidator)source;
        cv.ErrorMessage = message;
        arguments.IsValid = false;
        return;
    }

    //date of delivery
    protected void Validate_OutComeDate(object source, ServerValidateEventArgs arguments)
    {
        //if (nRomDate < nOutDelDateRom)
        //{
        //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrFormVsDelDate"));
        //    OutCDay.Focus();
        //    return;
        //}
        ////pef lmp date
        //PEFTableAdapter PTAdpater = new PEFTableAdapter();
        //mint4.PEFDataTable PEdt = new mint4.PEFDataTable();
        //PTAdpater.FillByNNIPSNUM(PEdt, NNIPSNUM.Text);
        //if (PEdt.Rows.Count > 0)
        //{
        //    mint4.PEFRow PERow = (mint4.PEFRow)PEdt.Rows[0];
        //    if (!PERow.IsPELMPROMNull())
        //    {
        //        if (nOutDelDateRom < PERow.PELMPROM)
        //        {
        //            SetErrorMessage(source, arguments, "<br />सङ्केत: LMP मिति: " + PERow.PELMPNEP + "<br />" + Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrDelDateVsLMP"));
        //            OutCDay.Focus();
        //        }
        //    }
        //}
    }

    protected void CustVal_RequiredMBFACILITYSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBDELLOC.Text))
        {
            if (MBFACILITY.SelectedValue == "98")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBFACILITYSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBFACILITYSP.Focus();
                }
            }
        }


        //if (MBFACILITY.SelectedValue == "98")
        //{
        //    if (Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
        //        MBFACILITYSP.Focus();
        //    }
        //}
        //else
        //{
        //    if (!Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
        //        MBFACILITYSP.Focus();
        //    }
        //}


        /*
        if (!Core.IsEmpty(MBFACILITY.Text))
        {
            if (MBFACILITY.Text == "98")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBFACILITYSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBFACILITYSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBFACILITY.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBFACILITYSP.Focus();
            }
        }
        */
    }
    protected void CustVal_ValidatePregMonWithPEF(object source, ServerValidateEventArgs arguments)
    {
        //if (LitMode.Text == "new")
        //{
        //    if (!Core.IsEmpty(MBMONTHSPREG.Text))
        //    {
        //        if (LitPEFPregMon.Text != "99")
        //        {
        //            if (int.Parse(MBMONTHSPREG.Text) < int.Parse(LitPEFPregMon.Text))
        //            {
        //                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMonPregVsOut"));
        //                MBMONTHSPREG.Focus();
        //            }
        //        }
        //    }
        //}
    }
    protected void CustVal_MBGESTAGERequired(object source, ServerValidateEventArgs arguments)
    {
        //if (!Core.IsEmpty(MBGESTAGE.Text))
        //{
        //    //UGAF WEEK DATE AND OUTCOME DATE=gest days
        //    USAFTableAdapter PTAdpater = new USAFTableAdapter();
        //    mint4.USAFDataTable PEdt = new mint4.USAFDataTable();
        //    PTAdpater.FillByNNIPSNUM(PEdt, NNIPSNUM.Text);
        //    if (PEdt.Rows.Count > 0)
        //    {
        //        mint4.USAFRow UGRow = (mint4.USAFRow)PEdt.Rows[0];
        //        if (!UGRow.IsROMDATENull())
        //        {
        //            DateTime USFormDate = UGRow.ROMDATE;
        //            if (USFormDate >= nOutDelDateRom)
        //            {
        //                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrUSDataVsOutCDate") + UGRow.NEPDATE);
        //                OutCMonth.Focus();
        //            }

        //            DateTime dateOfUSGDone = UGRow.ROMDATE;
        //            DateTime dateOfDel = (DateTime)nOutDelDateRom;
        //            TimeSpan diffDate = dateOfDel.Subtract(dateOfUSGDone);
        //            int intDays = diffDate.Days;
        //            double ftVal = 7.00d;
        //            double ftLMPMon = double.Parse(intDays.ToString()) / ftVal;
        //            int GestDay = int.Parse(Math.Round(ftLMPMon).ToString());
        //            int GetAgeInDay = GestDay + (int.Parse(UGRow.UAGA) * 7);
        //            if (GetAgeInDay.ToString("#000") != MBGESTAGE.Text)
        //            {
        //                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrGestAge") + GetAgeInDay.ToString());
        //                MBGESTAGE.Focus();
        //            }
        //        }
        //    }
        //    else
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoUSAF"));
        //        MBGESTAGE.Focus();
        //    }
        //}
    }
    //infants validation
    protected void CustVal_Infant1Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBBABYNUM.Text == "0")
        {
            if (!Core.IsEmpty(MBBABY1CRY.Text)
                || !Core.IsEmpty(MBBABY1MVE.Text)
                || !Core.IsEmpty(MBBABY1BRE.Text)
                || !Core.IsEmpty(MBBABY1OUT.Text)
                || !Core.IsEmpty(MBBABY1CURVS.Text)
                || !Core.IsEmpty(MBBABY2CRY.Text)
                || !Core.IsEmpty(MBBABY2MVE.Text)
                || !Core.IsEmpty(MBBABY2BRE.Text)
                || !Core.IsEmpty(MBBABY2OUT.Text)
                || !Core.IsEmpty(MBBABY2CURVS.Text)
                || !Core.IsEmpty(MBBABY3CRY.Text)
                || !Core.IsEmpty(MBBABY3MVE.Text)
                || !Core.IsEmpty(MBBABY3BRE.Text)
                || !Core.IsEmpty(MBBABY3OUT.Text)
                || !Core.IsEmpty(MBBABY3CURVS.Text))
            {
                //No req fields.
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBBABY1CRY.Focus();
            }
        }
        else if (MBBABYNUM.Text == "1")
        {
            if (Core.IsEmpty(MBBABY1CRY.Text)
                  || Core.IsEmpty(MBBABY1MVE.Text)
                  || Core.IsEmpty(MBBABY1BRE.Text)
                  || Core.IsEmpty(MBBABY1OUT.Text))
            {
                //No req fields.
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBBABY1CRY.Focus();
            }
        }
    }
    protected void CustVal_Infant2Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBBABYNUM.Text == "1")
        {

            if (!Core.IsEmpty(MBBABY2CRY.Text)
                || !Core.IsEmpty(MBBABY2MVE.Text)
                || !Core.IsEmpty(MBBABY2BRE.Text)
                || !Core.IsEmpty(MBBABY2OUT.Text)
                || !Core.IsEmpty(MBBABY2CURVS.Text)
                || !Core.IsEmpty(MBBABY3CRY.Text)
                || !Core.IsEmpty(MBBABY3MVE.Text)
                || !Core.IsEmpty(MBBABY3BRE.Text)
                || !Core.IsEmpty(MBBABY3OUT.Text)
                || !Core.IsEmpty(MBBABY3CURVS.Text))
            {
                //No req fields.
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNo2Infant"));
                MBBABY2CRY.Focus();
            }
        }
        else if (MBBABYNUM.Text == "2")
        {
            if (Core.IsEmpty(MBBABY1CRY.Text)
                || Core.IsEmpty(MBBABY1MVE.Text)
                || Core.IsEmpty(MBBABY1BRE.Text)
                || Core.IsEmpty(MBBABY1OUT.Text)
                || Core.IsEmpty(MBBABY1CURVS.Text)
                || Core.IsEmpty(MBBABY2CRY.Text)
                || Core.IsEmpty(MBBABY2MVE.Text)
                || Core.IsEmpty(MBBABY2BRE.Text)
                || Core.IsEmpty(MBBABY2OUT.Text)
                //|| Core.IsEmpty(MBBABY2CURVS.Text)
                || !Core.IsEmpty(MBBABY3CRY.Text)
                || !Core.IsEmpty(MBBABY3MVE.Text)
                || !Core.IsEmpty(MBBABY3BRE.Text)
                || !Core.IsEmpty(MBBABY3OUT.Text))
            //|| !Core.IsEmpty(MBBABY3CURVS.Text))
            {
                //req fields.
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReq2Infant"));
                MBBABY2CRY.Focus();
            }
        }
        else if (MBBABYNUM.Text == "3")
        {
            if (Core.IsEmpty(MBBABY1CRY.Text)
                || Core.IsEmpty(MBBABY1MVE.Text)
                || Core.IsEmpty(MBBABY1BRE.Text)
                || Core.IsEmpty(MBBABY1OUT.Text)
                || Core.IsEmpty(MBBABY1CURVS.Text)
                || Core.IsEmpty(MBBABY2CRY.Text)
                || Core.IsEmpty(MBBABY2MVE.Text)
                || Core.IsEmpty(MBBABY2BRE.Text)
                || Core.IsEmpty(MBBABY2OUT.Text)
                //|| Core.IsEmpty(MBBABY2CURVS.Text)
                || Core.IsEmpty(MBBABY3CRY.Text)
                || Core.IsEmpty(MBBABY3MVE.Text)
                || Core.IsEmpty(MBBABY3BRE.Text)
                || Core.IsEmpty(MBBABY3OUT.Text))
            //|| Core.IsEmpty(MBBABY3CURVS.Text))
            {
                //req fields.
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReq3Infant"));
                MBBABY2CRY.Focus();
            }
        }
    }

    //miscarriage/abortion validation
    protected void CustVal_MBBABY1OUTRequired(object source, ServerValidateEventArgs arguments)
    {

        if (MBBABY1OUT.Text == "9")
        {
            if (MBBABY1CRY.Text != "9"
                && MBBABY1MVE.Text != "9"
                && MBBABY1BRE.Text != "9")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYLIVEBIRTH2"));
                MBBABY1OUT.Focus();
            }
        }
        else if (MBBABY1OUT.Text == "1")
        {
            if (MBBABY1CRY.Text != "1"
                && MBBABY1MVE.Text != "1"
                && MBBABY1BRE.Text != "1")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYLIVEBIRTH"));
                MBBABY1OUT.Focus();
            }
        }
        else if (MBBABY1OUT.Text == "2")
        {
            if (MBBABY1CRY.Text != "0"
                || MBBABY1MVE.Text != "0"
                || MBBABY1BRE.Text != "0")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYMISCAR"));
                MBBABY1OUT.Focus();
            }
        }
        else if (MBBABY1OUT.Text == "3")
        {
            if (MBBABY1CRY.Text != "0"
                || MBBABY1MVE.Text != "0"
                || MBBABY1BRE.Text != "0")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrSTILLBIRTH"));
                MBBABY1OUT.Focus();
            }
        }
    }

    protected void CustVal_MBBABY2OUTRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MBBABY2OUT.Text == "9")
        {
            if (MBBABY2CRY.Text != "9"
                && MBBABY2MVE.Text != "9"
                && MBBABY2BRE.Text != "9")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYLIVEBIRTH2"));
                MBBABY2OUT.Focus();
            }
        }
        else if (MBBABY2OUT.Text == "1")
        {
            if (MBBABY2CRY.Text != "1"
                && MBBABY2MVE.Text != "1"
                && MBBABY2BRE.Text != "1")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYLIVEBIRTH"));
                MBBABY2OUT.Focus();
            }
        }
        else if (MBBABY2OUT.Text == "2")
        {
            if (MBBABY2CRY.Text != "0"
                || MBBABY2MVE.Text != "0"
                || MBBABY2BRE.Text != "0")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYMISCAR"));
                MBBABY2OUT.Focus();
            }
            if (int.Parse(MBGESTAGE.Text) >= 196)
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrSTILLBIRTH"));
                MBBABY2OUT.Focus();
            }
        }
        else if (MBBABY2OUT.Text == "3")
        {
            if (MBBABY2CRY.Text != "0"
                || MBBABY2MVE.Text != "0"
                || MBBABY2BRE.Text != "0")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYMISCAR"));
                MBBABY2OUT.Focus();
            }
            //if (int.Parse(MBGESTAGE.Text) < 196)
            //{
            //    //error
            //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrStillBirthGestAge2OUT"));
            //    MBBABY2OUT.Focus();
            //}
        }
    }
    protected void CustVal_MBBABY3OUTRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MBBABY3OUT.Text == "9")
        {
            if (MBBABY3CRY.Text != "9"
                && MBBABY3MVE.Text != "9"
                && MBBABY3BRE.Text != "9")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYLIVEBIRTH2"));
                MBBABY3OUT.Focus();
            }
        }
        else if (MBBABY3OUT.Text == "1")
        {
            if (MBBABY3CRY.Text != "1"
                && MBBABY3MVE.Text != "1"
                && MBBABY3BRE.Text != "1")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYLIVEBIRTH"));
                MBBABY3OUT.Focus();
            }
        }
        else if (MBBABY3OUT.Text == "2")
        {
            if (MBBABY3CRY.Text != "0"
                || MBBABY3MVE.Text != "0"
                || MBBABY3BRE.Text != "0")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYMISCAR"));
                MBBABY3OUT.Focus();
            }
            //if (int.Parse(MBGESTAGE.Text) >= 196)
            //{
            //    //error
            //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMisCarGestAge3OUT"));
            //    MBBABY3OUT.Focus();
            //}
        }
        else if (MBBABY3OUT.Text == "3")
        {
            if (MBBABY3CRY.Text != "0"
                || MBBABY3MVE.Text != "0"
                || MBBABY3BRE.Text != "0")
            {
                //error
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrBABYMISCAR"));
                MBBABY3OUT.Focus();
            }
            //if (int.Parse(MBGESTAGE.Text) < 196)
            //{
            //    //error
            //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrStillBirthGestAge3OUT"));
            //    MBBABY3OUT.Focus();
            //}
        }
    }
    //infant cur vs
    protected void CustVal_MBBABY1CURVSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBBABY1OUT.Text))
        {
            if (MBBABY1OUT.Text == "1"
                || MBBABY1OUT.Text == "9")
            {
                if (Core.IsEmpty(MBBABY1CURVS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqMBBABY1CURVS"));
                    MBBABY1CURVS.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(MBBABY1CURVS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoMBBABY1CURVS"));
                    MBBABY1CURVS.Focus();
                }
            }
        }
        if (!Core.IsEmpty(MBBABY1CURVS.Text))
        {
            if (MBBABY1CURVS.Text == "9")
            {
                if (MBBABY1OUT.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrCURVS"));
                    MBBABY1CURVS.Focus();
                }
            }
            else if (MBBABY1OUT.Text == "9")
            {
                if (MBBABY1CURVS.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrCURVS"));
                    MBBABY1CURVS.Focus();
                }
            }
        }
    }
    protected void CustVal_MBBABY2CURVSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBBABY2OUT.Text))
        {
            if (MBBABY2OUT.Text == "1"
                || MBBABY2OUT.Text == "9")
            {
                if (Core.IsEmpty(MBBABY2CURVS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqMBBABY1CURVS"));
                    MBBABY2CURVS.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(MBBABY2CURVS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoMBBABY1CURVS"));
                    MBBABY2CURVS.Focus();
                }
            }
        }
        if (!Core.IsEmpty(MBBABY2CURVS.Text))
        {
            if (MBBABY2CURVS.Text == "9")
            {
                if (MBBABY2OUT.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrCURVS"));
                    MBBABY2CURVS.Focus();
                }
            }
            else if (MBBABY2OUT.Text == "9")
            {
                if (MBBABY2CURVS.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrCURVS"));
                    MBBABY2CURVS.Focus();
                }
            }
        }
    }
    protected void CustVal_MBBABY3CURVSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBBABY3OUT.Text))
        {
            if (MBBABY3OUT.Text == "1"
                || MBBABY3OUT.Text == "9")
            {
                if (Core.IsEmpty(MBBABY3CURVS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqMBBABY1CURVS"));
                    MBBABY3CURVS.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(MBBABY3CURVS.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoMBBABY1CURVS"));
                    MBBABY3CURVS.Focus();
                }
            }
        }
        if (!Core.IsEmpty(MBBABY3CURVS.Text))
        {
            if (MBBABY3CURVS.Text == "9")
            {
                if (MBBABY3OUT.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrCURVS"));
                    MBBABY3CURVS.Focus();
                }
            }
            else if (MBBABY3OUT.Text == "9")
            {
                if (MBBABY3CURVS.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrCURVS"));
                    MBBABY3CURVS.Focus();
                }
            }
        }
    }
    //form consent
    protected void CustVal_MBFSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MBVS.SelectedValue == "1")
        {
            if (MBMS.SelectedValue == "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqMS"));
                MBMS.Focus();
            }
            if (MBMS.SelectedValue == "1"
                || MBMS.SelectedValue == "2")
            {
                if (MBFS.SelectedValue == "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqFS"));
                    MBFS.Focus();
                }
            }
            else if (MBMS.SelectedValue == "3" ||
                    MBMS.SelectedValue == "7")
            {
                if (MBFS.SelectedValue != "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqFS"));
                    MBFS.Focus();
                }
            }
        }
        else if (MBVS.SelectedValue == "8" ||
                    MBVS.SelectedValue == "9")
        {
            if (MBMS.SelectedValue != "X" ||
                MBFS.SelectedValue != "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqMS"));
                MBMS.Focus();
            }
        }
    }

    //section a
    //Q1.
    protected void CustVal_VaginalBleedingRequired(object source, ServerValidateEventArgs arguments)
    {
        if (MBVAGBLD30.Text == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBVAGBLD7.Focus();
            }
        }
        else if (MBVAGBLD30.Text == "0" || MBVAGBLD30.Text == "9")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBVAGBLD7.Focus();
            }
        }
    }

    //protected void CustVal_RequiredIfVagBld30(object source, ServerValidateEventArgs arguments)
    //{
    //    if (MBVAGBLD30.Text == "1" || MBVAGBLD30.Text == "9")
    //    {
    //        if (Core.IsEmpty(arguments.Value))
    //        {
    //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqMBVBLDD30"));
    //            MBVAGBLD30.Focus();
    //        }
    //    }
    //    else if (MBVAGBLD30.Text == "0")
    //    {
    //        if (!Core.IsEmpty(arguments.Value))
    //        {
    //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqMBVBLDD30"));
    //            MBVAGBLD30.Focus();
    //        }
    //    }
    //}
    protected void CustVal_RequiredIfVagBld7(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBVBLDD30.Text))
        {
            if (Core.IsEmpty(MBVBLDD7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBVBLDD7.Focus();
            }
        }
        else if (Core.IsEmpty(MBVBLDD30.Text))
        {
            if (!Core.IsEmpty(MBVBLDD7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBVBLDD7.Focus();
            }
        }
    }
    protected void CustVal_RequiredIfVagBld7b(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBVBLDLAP30.Text))
        {
            if (MBVBLDLAP30.Text == "1")
            {
                if (Core.IsEmpty(MBVBLDLAP7.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBVBLDLAP7.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(MBVBLDLAP7.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBVBLDLAP7.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBVBLDLAP30.Text))
        {
            if (!Core.IsEmpty(MBVBLDLAP7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBVBLDLAP7.Focus();
            }
        }
    }

    //2
    protected void CustVal_MBCONV7Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBCONV30.Text == "1")
        {
            if (Core.IsEmpty(MBCONV7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBCONV7.Focus();
            }
        }
        else if (MBCONV30.Text == "0" || MBCONV30.Text == "9")
        {
            if (!Core.IsEmpty(MBCONV7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBCONV7.Focus();
            }
        }
    }
    //3
    protected void CustVal_MBFVR7Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBFVR30.Text == "1")
        {
            if (Core.IsEmpty(MBFVR7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBFVR7.Focus();
            }
        }
        else if (MBFVR30.Text == "0" || MBFVR30.Text == "9")
        {
            if (!Core.IsEmpty(MBFVR7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBFVR7.Focus();
            }
        }
    }
    //4
    protected void CustVal_MBSWELL7Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBSWELL30.Text == "1")
        {
            if (Core.IsEmpty(MBSWELL7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBSWELL7.Focus();
            }
        }
        else if (MBSWELL30.Text == "0" || MBSWELL30.Text == "9")
        {
            if (!Core.IsEmpty(MBSWELL7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBSWELL7.Focus();
            }
        }
    }
    //5
    protected void CustVal_MBHEAD7Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBHEAD30.Text == "1")
        {
            if (Core.IsEmpty(MBHEAD7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBHEAD7.Focus();
            }
        }
        else if (MBHEAD30.Text == "0" || MBHEAD30.Text == "9")
        {
            if (!Core.IsEmpty(MBHEAD7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBHEAD7.Focus();
            }
        }
    }
    //6
    protected void CustVal_MBACCINJ7Required(object source, ServerValidateEventArgs arguments)
    {
        if (MBACCINJ30.Text == "1")
        {
            if (Core.IsEmpty(MBACCINJ7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBACCINJ7.Focus();
            }
        }
        else if (MBACCINJ30.Text == "0" || MBACCINJ30.Text == "9")
        {
            if (!Core.IsEmpty(MBACCINJ7.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBACCINJ7.Focus();
            }
        }
    }
    //6sp
    protected void CustVal_RequiredIfAccident(object source, ServerValidateEventArgs arguments)
    {
        if (MBACCINJ30.Text == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBACCINJSP.Focus();
            }
        }
        else if (MBACCINJ30.Text == "0" || MBACCINJ30.Text == "9")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBACCINJSP.Focus();
            }
        }
    }

    //section b
    protected bool IsMiscarriageOrAbortion()
    {
        //MBBABY1OUT /MBBABYNUM = 2 // Miscarriage or Abortaion
        return ((MBBABY1OUT.Text == "2" || MBBABY2OUT.Text == "2" || MBBABY3OUT.Text == "2"))
                 || (MBBABYNUM.Text == "0");
    }

    protected void CustVal_MBBABYNUMValidation(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBBABYNUM.Text))
        {
            int intGA = int.Parse(MBGESTAGE.Text);
            if (intGA >= 196 && MBBABYNUM.Text == "0")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrGestAgeVSOutcome"));
                MBGESTAGE.Focus();
                return;
            }
        }
    }
    protected void CustVal_WaterBreakVal(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBWHNWTRBRK.Text))
        {
            if (MBWHNWTRBRK.Text == "1")
            {
                //if (WATERBREAKTIME < CONTRACTTIME)
                //{
                //    //
                //}
                //else
                //{
                //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErroWaterBreak"));
                //    MBWHNWTRBRK.Focus();
                //    return;
                //}
            }
            else if (MBWHNWTRBRK.Text == "2")
            {
                //if (CONTRACTTIME < WATERBREAKTIME)
                //{
                //    //
                //}
                //else
                //{
                //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErroWaterBreak"));
                //    MBWHNWTRBRK.Focus();
                //    return;
                //}
            }
            else if (MBWHNWTRBRK.Text == "3")
            {
                //if (CONTRACTTIME == WATERBREAKTIME)
                //{
                //    //
                //}
                //else
                //{
                //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErroContraWater"));
                //    MBWHNWTRBRK.Focus();
                //    return;
                //}
            }
        }

    }
    //1
    protected void CustVal_RequiredIfMiscarriageOrAbortion(object source, ServerValidateEventArgs arguments)
    {
        if (!IsMiscarriageOrAbortion())
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
        }
    }
    //delivered in health post/hospital
    protected bool IsDeliveryLocInsideFacility()
    {
        return (MBDELLOC.Text == "3" || MBDELLOC.Text == "4");
    }

    protected void CustVal_RequiredFacility(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (IsDeliveryLocInsideFacility())
        {
            if (MBFACILITY.SelectedValue == "X")
            //if (MBFACILITY.SelectedIndex.ToString() == "0")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
            }
        }
        else if (MBFACILITY.SelectedValue != "X")
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
        }
        */
    }
    protected void CustVal_RequiredIfInsideFacility(object source, ServerValidateEventArgs arguments)
    {
        if (IsDeliveryLocInsideFacility())
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
        }
    }

    //check duplicate value
    protected void CustVal_ABCDuplicate(object source, ServerValidateEventArgs arguments)
    {
        CustomValidator validationObject = (CustomValidator)source;
        String textBoxAName = validationObject.ControlToValidate;
        String textBoxBName = textBoxAName.Substring(0, textBoxAName.Length - 1) + "B";
        String textBoxCName = textBoxBName.Substring(0, textBoxAName.Length - 1) + "C";
        //TextBox ItemA = (TextBox)PanelForm.FindControl(textBoxAName);
        //TextBox ItemB = (TextBox)PanelForm.FindControl(textBoxBName);
        //TextBox ItemC = (TextBox)PanelForm.FindControl(textBoxCName);

        //if ((!Core.IsEmpty(ItemA.Text) && ItemA.Text == ItemB.Text) ||
        //     (!Core.IsEmpty(ItemB.Text) && ItemB.Text == ItemC.Text) ||
        //     (!Core.IsEmpty(ItemC.Text) && ItemC.Text == ItemA.Text))
        //{
        //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrUniqueValue"));
        //    arguments.IsValid = false;
        //}
    }
    //3sp
    protected void CustVal_RequiredIfDelLocReasonOther(object source, ServerValidateEventArgs arguments)
    {
        if (MBREASONA.Text == "5" || MBREASONB.Text == "5" || MBREASONC.Text == "5")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBREASONSP.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
            MBREASONSP.Focus();
        }
    }

    //section c
    //1a
    protected void CustVal_RequiredMBWHYCSEC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBDELTYP.Text))
        {
            if (MBDELTYP.Text == "1") //go to q2
            {
                if (!Core.IsEmpty(MBWHYCSEC.Text)
                    || !Core.IsEmpty(MBWHYCSECSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBWHYCSEC.Focus();
                }
            }
            else //go to q1a
            {
                if (Core.IsEmpty(MBWHYCSEC.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBWHYCSEC.Focus();
                }
            }
        }
    }
    protected void CustVal_RequiredMBWHYCSECSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBWHYCSEC.Text))
        {
            if (MBWHYCSEC.Text == "8")
            {
                if (Core.IsEmpty(MBWHYCSECSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBWHYCSECSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(MBWHYCSECSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBWHYCSECSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBWHYCSEC.Text))
        {
            if (!Core.IsEmpty(MBWHYCSECSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBWHYCSECSP.Focus();
            }
        }
    }

    //1b
    protected void CustVal_RequiredMBWHOCSEC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBDELTYP.Text))
        {
            if (MBDELTYP.Text == "1") //go to q2
            {
                if (!Core.IsEmpty(MBWHOCSEC.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBWHOCSEC.Focus();
                }
            }
            else //
            {
                if (Core.IsEmpty(MBWHOCSEC.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBWHOCSEC.Focus();
                }
            }
        }
    }
    //2a
    protected void CustVal_RequiredIfOutsideFacilityDelComp(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBCOMP.Text))
        {
            if (MBCOMP.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBCOMPA.Focus();
                }
            }
            else if ((MBCOMP.Text == "0")
                    || (MBCOMP.Text == "9"))
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBCOMPA.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBCOMP.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBCOMPA.Focus();
            }
        }
    }
    protected void CustVal_RequiredReason(object source, ServerValidateEventArgs arguments)
    {
        if (MBDELLOC.Text == "1" || MBDELLOC.Text == "2" ||
            MBDELLOC.Text == "5" || MBDELLOC.Text == "6")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBREASONB.Focus();
            }
        }
    }

    protected void CustVal_RequiredValInject(object source, ServerValidateEventArgs arguments)
    {
        if (MBPLACHELPA.Text == "5" ||
            MBPLACHELPB.Text == "5" ||
            MBPLACHELPC.Text == "5")
        {
            //done
        }
        else
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACINJC.Focus();
            }
        }
    }

    protected void CustVal_RequiredValidation(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBCOMP.Text))
        {
            if (MBCOMP.Text == "0"
                || MBCOMP.Text == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBCOMPB.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBCOMP.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBCOMPB.Focus();
            }
        }
    }

    //2a
    protected void CustVal_RequiredIfFacilityCompOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBCOMP.Text))
        {
            if (MBCOMP.Text == "1")
            {
                if ((MBCOMPA.Text == "6")
                    || (MBCOMPB.Text == "6")
                    || (MBCOMPC.Text == "6"))
                {
                    if (Core.IsEmpty(MBCOMPSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                        MBCOMPSP.Focus();
                    }
                }
                else if ((MBCOMPA.Text != "6")
                        || (MBCOMPB.Text != "6")
                        || (MBCOMPC.Text != "6"))
                {
                    if (!Core.IsEmpty(MBCOMPSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                        MBCOMPSP.Focus();
                    }
                }
            }
            else if (MBCOMP.Text == "0"
                || MBCOMP.Text == "9")
            {
                if (!Core.IsEmpty(MBCOMPSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBCOMPSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBCOMP.Text))
        {
            if (!Core.IsEmpty(MBCOMPSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBCOMPSP.Focus();
            }
        }
    }

    //4
    protected void CustVal_ValidateContractDate(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLBRPAIN.Text))
        {
            if (MBLBRPAIN.Text == "1"
                || MBLBRPAIN.Text == "2")
            {
                if (Core.IsEmpty(MBLBRPAINDay.Text)
                    || Core.IsEmpty(MBLBRPAINMonth.Text)
                    || Core.IsEmpty(MBLBRPAINYear.Text)
                    || Core.IsEmpty(MBTOLPHH.Text)
                    || Core.IsEmpty(MBTOLPMM.Text)
                    || MBTOLPAMPM.SelectedValue == "X")
                {
                    //req contract date time
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqContractDate"));
                    MBLBRPAINDay.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(MBLBRPAINDay.Text)
                    || !Core.IsEmpty(MBLBRPAINMonth.Text)
                    || !Core.IsEmpty(MBLBRPAINYear.Text)
                    || !Core.IsEmpty(MBTOLPHH.Text)
                    || !Core.IsEmpty(MBTOLPMM.Text)
                    || MBTOLPAMPM.SelectedValue != "X")
                {
                    //empty contract date time
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoContractDate"));
                    MBLBRPAINDay.Focus();
                }
            }
        }

        //if (!Core.IsEmpty(CONTRACTNEPDATE))
        //{
        //    if (MBLBRPAINDay.Text != "99" && MBLBRPAINMonth.Text != "99" && MBLBRPAINYear.Text != "99")
        //    {
        //        if (nCONTRACTROM == null)
        //        {
        //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrContrtVsDelDate"));
        //            MBLBRPAINDay.Focus();
        //        }
        //    }
        //    else if (MBLBRPAINDay.Text == "99" && MBLBRPAINMonth.Text == "99" && MBLBRPAINYear.Text == "99")
        //    {
        //        // valid: no Contractions date
        //    }
        //    else if (MBLBRPAINYear.Text == "99")
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrInvContrt"));
        //        MBLBRPAINDay.Focus();
        //    }

        //    //the contraction start date should be before outcomedate
        //    if (nCONTRACTROM > nOutDelDateRom)
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrContrtVsDelDate"));
        //        MBLBRPAINYear.Focus();
        //    }
        //}
    }


    //7
    protected void CustVal_ValidateWaterBreakTime(object source, ServerValidateEventArgs arguments)
    {
        //if (!Core.IsEmpty(WATERBREAKNEPDATE))
        //{
        //    if (MBWTRBRKDay.Text != "99" && MBWTRBRKMonth.Text != "99" && MBWTRBRKYear.Text != "99")
        //    {
        //        if (nWATERBREAKROM == null)
        //        {
        //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWaterBrkDateVsDelDate"));
        //            MBWTRBRKDay.Focus();
        //        }
        //    }
        //    else if (MBWTRBRKDay.Text == "99" && MBWTRBRKMonth.Text == "99" && MBWTRBRKYear.Text == "99")
        //    {
        //        // valid: no WaterBrk date
        //    }
        //    else if (MBWTRBRKYear.Text == "99")
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrInvWaterBrk"));
        //        MBWTRBRKYear.Focus();
        //    }
        //    //the waterbreak date should be before outcomedate
        //    if (nWATERBREAKROM > nOutDelDateRom)
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWaterBrkDateVsDelDate"));
        //        MBWTRBRKDay.Focus();
        //    }
        //}
    }

    protected void CustVal_ValidateQuesTen(object source, ServerValidateEventArgs arguments)
    {
        if (MBLBRPAIN.Text == "2"
            || MBWTRBRK.Text == "2")
        {
            if (Core.IsEmpty(MBLPHOME.Text)
                || Core.IsEmpty(MBLPMSG.Text)
                || Core.IsEmpty(MBLPABDN.Text)
                || Core.IsEmpty(MBLPMISPTRL.Text)
                || Core.IsEmpty(MBLPINJ.Text)
                || Core.IsEmpty(MBLPINDUCOTH.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqQuesTen"));
                MBLPHOME.Focus();
            }
        }
        else if (MBLBRPAIN.Text != "2"
             || MBWTRBRK.Text != "2")
        {
            if (!Core.IsEmpty(MBLPHOME.Text)
               || !Core.IsEmpty(MBLPWHOHOME.Text)
               || !Core.IsEmpty(MBLPMSG.Text)
               || !Core.IsEmpty(MBLPWHOMSG.Text)
               || !Core.IsEmpty(MBLPABDN.Text)
               || !Core.IsEmpty(MBLPWHOABDN.Text)
               || !Core.IsEmpty(MBLPMISPTRL.Text)
               || !Core.IsEmpty(MBLPWHOMISPTRL.Text)
               || !Core.IsEmpty(MBLPINJ.Text)
               || !Core.IsEmpty(MBLPWHOINJ.Text)
               || !Core.IsEmpty(MBLPINJGIVN.Text)
               || !Core.IsEmpty(MBLPINDUCOTH.Text)
               || !Core.IsEmpty(MBLPWHOINDUCOTH.Text)
               || !Core.IsEmpty(MBLPINDUCSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoQuesTen"));
                MBLPHOME.Focus();
            }
        }
    }
    //10i
    protected void CustVal_RequiredMBLPWHOHOME(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPHOME.Text))
        {
            if (MBLPHOME.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPWHOHOME.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPWHOHOME.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPHOME.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPWHOHOME.Focus();
            }
        }
    }

    //ii
    protected void CustVal_RequiredMBLPWHOMSG(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPHOME.Text))
        {
            if (MBLPMSG.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPWHOMSG.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPWHOMSG.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPHOME.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPWHOMSG.Focus();
            }
        }
    }
    //iii
    protected void CustVal_RequiredMBLPWHOABDN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPABDN.Text))
        {
            if (MBLPABDN.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPWHOABDN.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPWHOABDN.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPABDN.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPWHOABDN.Focus();
            }
        }
    }
    //iv
    protected void CustVal_RequiredMBLPWHOMISPTRL(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPMISPTRL.Text))
        {
            if (MBLPMISPTRL.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPWHOMISPTRL.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPWHOMISPTRL.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPMISPTRL.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPWHOMISPTRL.Focus();
            }
        }
    }
    //v
    protected void CustVal_RequiredMBLPWHOINJ(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPINJ.Text))
        {
            if (MBLPINJ.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPWHOINJ.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPWHOINJ.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPINJ.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPWHOINJ.Focus();
            }
        }
    }
    //v-c
    protected void CustVal_RequiredMBLPINJGIVN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPINJ.Text))
        {
            if (MBLPINJ.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPINJGIVN.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPINJGIVN.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPINJ.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPINJGIVN.Focus();
            }
        }
    }
    //vi
    protected void CustVal_RequiredMBLPWHOINDUCOTH(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPINDUCOTH.Text))
        {
            if (MBLPINDUCOTH.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPWHOINDUCOTH.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPWHOINDUCOTH.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPINDUCOTH.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPWHOINDUCOTH.Focus();
            }
        }
    }
    //vi-sp
    protected void CustVal_RequiredMBLPINDUCSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBLPINDUCOTH.Text))
        {
            if (MBLPINDUCOTH.Text == "1")
            {
                if (Core.IsEmpty(MBLPINDUCSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBLPINDUCSP.Focus();
                }
            }
            else if (MBLPINDUCOTH.Text != "1")
            {
                if (!Core.IsEmpty(MBLPINDUCSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBLPINDUCSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBLPINDUCOTH.Text))
        {
            if (!Core.IsEmpty(MBLPINDUCSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBLPINDUCSP.Focus();
            }
        }
    }
    //11b
    protected void CustVal_RequiredMBASSTDEL(object source, ServerValidateEventArgs arguments)
    {
        if (MBASSTDELA.Text == "0")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBASSTDELB.Focus();
            }
        }
    }
    //14sp
    protected void CustVal_RequiredIfWtrColorOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBWTRBRCOLOR.Text))
        {
            if (MBWTRBRCOLOR.Text == "4")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBWTRBRCOLORSP.Focus();
                }
            }
            else if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBWTRBRCOLORSP.Focus();
            }
        }
        else if (Core.IsEmpty(MBWTRBRCOLOR.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBWTRBRCOLORSP.Focus();
            }
        }
    }
    //18
    //i
    protected void CustVal_RequiredMBALWHOHOME(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALHOME.Text))
        {
            if (MBALHOME.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOHOME.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOHOME.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALHOME.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOHOME.Focus();
            }
        }
    }
    //ii
    protected void CustVal_RequiredMBALWHOMSG(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALMSG.Text))
        {
            if (MBALMSG.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOMSG.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOMSG.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALMSG.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOMSG.Focus();
            }
        }
    }
    //iii
    protected void CustVal_RequiredMBALWHOABDN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALABDN.Text))
        {
            if (MBALABDN.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOABDN.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOABDN.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALABDN.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOABDN.Focus();
            }
        }
    }
    //iv
    protected void CustVal_RequiredMBWHOFORCEP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBFORCEP.Text))
        {
            if (MBFORCEP.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBWHOFORCEP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBWHOFORCEP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBFORCEP.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBWHOFORCEP.Focus();
            }

        }
    }
    //v
    protected void CustVal_RequiredMBWHOVCUM(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBVCUM.Text))
        {
            if (MBVCUM.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBWHOVCUM.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBWHOVCUM.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBVCUM.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBWHOVCUM.Focus();
            }
        }
    }
    //vi
    protected void CustVal_RequiredMBALWHOMISPTRL(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALMISPTRL.Text))
        {
            if (MBALMISPTRL.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOMISPTRL.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOMISPTRL.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALMISPTRL.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOMISPTRL.Focus();
            }
        }
    }
    //vii
    protected void CustVal_RequiredMBALWHOINJ(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALINJ.Text))
        {
            if (MBALINJ.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOINJ.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOINJ.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALINJ.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOINJ.Focus();
            }
        }
    }
    //vii-c
    protected void CustVal_RequiredMBALINJGIVN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALWHOINJ.Text))
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBALINJGIVN.Focus();
            }
        }
        else
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALINJGIVN.Focus();
            }
        }
    }
    //viii
    protected void CustVal_RequiredMBALWHOEPSTMY(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALEPSTMY.Text))
        {
            if (MBALEPSTMY.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOEPSTMY.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOEPSTMY.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALEPSTMY.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOEPSTMY.Focus();
            }
        }
    }
    //ix
    protected void CustVal_RequiredMBALWHOINDUCOTH(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALINDUCOTH.Text))
        {
            if (MBALINDUCOTH.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALWHOINDUCOTH.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALWHOINDUCOTH.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALINDUCOTH.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALWHOINDUCOTH.Focus();
            }
        }
    }
    //ix-sp
    protected void CustVal_RequiredMBALINDUCSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBALINDUCOTH.Text))
        {
            if (MBALINDUCOTH.Text == "1")
            {
                if (Core.IsEmpty(MBALINDUCSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBALINDUCSP.Focus();
                }
            }
            else if (MBALINDUCOTH.Text != "1")
            {
                if (!Core.IsEmpty(MBALINDUCSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBALINDUCSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBALINDUCOTH.Text))
        {
            if (!Core.IsEmpty(MBALINDUCSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBALINDUCSP.Focus();
            }
        }
    }
    //19a

    protected void CustVal_RequiredIfBabyGivenOral(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBORAL.Text))
        {
            if (MBORAL.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBORALA.Focus();
                }
            }
            else if ((MBORAL.Text == "0")
                    || (MBORAL.Text == "9"))
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBORALA.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBORAL.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBORALA.Focus();
            }
        }
    }

    protected void CustVal_RequiredValORAL(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBORAL.Text))
        {
            if (MBORAL.Text == "0"
                || MBORAL.Text == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBORALB.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBORAL.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBORALB.Focus();
            }
        }
    }
    protected void CustVal_RequiredIfBabyGivenOralOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBORAL.Text))
        {
            if (MBORAL.Text == "1")
            {
                if ((MBORALA.Text == "4")
                    || (MBORALB.Text == "4")
                    || (MBORALC.Text == "4"))
                {
                    if (Core.IsEmpty(MBORALSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                        MBORALSP.Focus();
                    }
                }
                else if ((MBORALA.Text != "4")
                        || (MBORALB.Text != "4")
                        || (MBORALC.Text != "4"))
                {
                    if (!Core.IsEmpty(MBORALSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                        MBORALSP.Focus();
                    }
                }
            }
            else if (MBORAL.Text == "0"
                || MBORAL.Text == "9")
            {
                if (!Core.IsEmpty(MBORALSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBORALSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBORAL.Text))
        {
            if (!Core.IsEmpty(MBORALSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBORALSP.Focus();
            }
        }
    }

    //20a
    protected void CustVal_RequiredMBPLACHELPA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBPLACENTA.Text))
        {
            if (MBPLACENTA.Text == "0")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBPLACHELPA.Focus();
                }
            }
            else if ((MBPLACENTA.Text == "1")
                    || (MBPLACENTA.Text == "9"))
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBPLACHELPA.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBPLACENTA.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACHELPA.Focus();
            }
        }
    }

    protected void CustVal_RequiredValPlacenta(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBPLACENTA.Text))
        {
            if (MBPLACENTA.Text == "1"
                || MBPLACENTA.Text == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBPLACHELPB.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBPLACENTA.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACHELPB.Focus();
            }
        }
    }
    protected void CustVal_RequiredMBPLACHELPSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBPLACENTA.Text))
        {
            if (MBPLACENTA.Text == "0")
            {
                if ((MBPLACHELPA.Text == "8")
                    || (MBPLACHELPB.Text == "8")
                    || (MBPLACHELPC.Text == "8"))
                {
                    if (Core.IsEmpty(MBPLACHELPSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                        MBPLACHELPSP.Focus();
                    }
                }
                else if ((MBPLACHELPA.Text != "8")
                        || (MBPLACHELPB.Text != "8")
                        || (MBPLACHELPC.Text != "8"))
                {
                    if (!Core.IsEmpty(MBPLACHELPSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                        MBPLACHELPSP.Focus();
                    }
                }
            }
            else if (MBPLACENTA.Text == "1"
                || MBPLACENTA.Text == "9")
            {
                if (!Core.IsEmpty(MBPLACHELPSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                    MBPLACHELPSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(MBPLACENTA.Text))
        {
            if (!Core.IsEmpty(MBPLACHELPSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACHELPSP.Focus();
            }
        }
    }

    //20b
    protected void CustVal_RequiredIfPlacentaInj(object source, ServerValidateEventArgs arguments)
    {
        if (MBPLACENTA.Text == "0")
        {
            if (MBPLACHELPA.Text == "5"
                || MBPLACHELPB.Text == "5"
                || MBPLACHELPC.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                    MBPLACINJA.Focus();
                }
            }
            else if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACINJA.Focus();
            }
        }
        else if (MBPLACENTA.Text == "1" || MBPLACENTA.Text == "9")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACINJA.Focus();
            }
        }
    }
    //20b-sp
    protected void CustVal_RequiredIfPlacentaInjOther(object source, ServerValidateEventArgs arguments)
    {
        if (MBPLACINJA.Text == "6"
            || MBPLACINJB.Text == "6"
            || MBPLACINJC.Text == "6")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBPLACINJSP.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
            MBPLACINJSP.Focus();
        }
        else if (Core.IsEmpty(MBPLACINJA.Text) &&
            Core.IsEmpty(MBPLACINJB.Text) &&
            Core.IsEmpty(MBPLACINJC.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrNoReqField"));
                MBPLACINJSP.Focus();
            }
        }
    }
    //21
    protected void CustVal_ValidatePlacenta99(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBPLACHRS.Text) && !Core.IsEmpty(MBPLACMIN.Text))
        {
            if ((MBPLACHRS.Text == "99" && MBPLACMIN.Text != "99") ||
                (MBPLACHRS.Text != "99" && MBPLACMIN.Text == "99"))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrReqField"));
                MBPLACHRS.Focus();
            }
        }
    }
    protected void CustVal_Validate1Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBWT1Whole.Text) && !Core.IsEmpty(MBWT1Fract.Text))
        {
            if (MBWT1Whole.Text == "99")
            {
                if (MBWT1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWeight9"));
                    MBWT1Whole.Focus();
                }
            }
            //if (MBWT1Whole.Text == "66")
            //{
            //    if (MBWT1Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWeight6"));
            //        MBWT1Whole.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate2Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBWT2Whole.Text) && !Core.IsEmpty(MBWT2Fract.Text))
        {
            if (MBWT2Whole.Text == "99")
            {
                if (MBWT2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWeight9"));
                    MBWT2Whole.Focus();
                }
            }
            //if (MBWT2Whole.Text == "66")
            //{
            //    if (MBWT2Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWeight6"));
            //        MBWT2Whole.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate3Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBWT3Whole.Text) && !Core.IsEmpty(MBWT3Fract.Text))
        {
            if (MBWT3Whole.Text == "99")
            {
                if (MBWT3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWeight9"));
                    MBWT3Whole.Focus();
                }
            }
            //if (!Core.IsEmpty(LitLPVMedianWT.Text))
            //{
            //    if ((LitLPVMedianWT.Text != "99.9" || LitLPVMedianWT.Text != "66.6")
            //        || (MedianWeight != "99.9" || MedianWeight != "66.6"))
            //    {
            //        //
            //    }
            //    else
            //    {
            //        decimal decLPVWt = decimal.Parse(LitLPVMedianWT.Text);
            //        decimal decMBAFWt = decimal.Parse(MedianWeight);
            //        if ((decMBAFWt - decLPVWt) > 5)
            //        {
            //            SetErrorMessage(source, arguments, "LPVF भिजिटमा लिईएको तौल (" + LitLPVMedianWT.Text + ") भन्दा धेरै बढी छ।  कृपया पुन: तौल लिएर​ निश्चित गर्नुहोस। <br />");
            //        }
            //    }
            //}

            //if (MBWT3Whole.Text == "66")
            //{
            //    if (MBWT3Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrWeight6"));
            //        MBWT3Whole.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate1MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBMUAC1Whole.Text) && !Core.IsEmpty(MBMUAC1Fract.Text))
        {
            if (MBMUAC1Whole.Text == "99")
            {
                if (MBMUAC1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMUAC9"));
                    MBMUAC1Whole.Focus();
                }
            }
            //if (MBMUAC1Whole.Text == "66")
            //{
            //    if (MBMUAC1Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMUAC6"));
            //        MBMUAC1Whole.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate2MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBMUAC2Whole.Text) && !Core.IsEmpty(MBMUAC2Fract.Text))
        {
            if (MBMUAC2Whole.Text == "99")
            {
                if (MBMUAC2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMUAC9"));
                    MBMUAC2Whole.Focus();
                }
            }
            //if (MBMUAC2Whole.Text == "66")
            //{
            //    if (MBMUAC2Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMUAC6"));
            //        MBMUAC2Whole.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate3MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBMUAC3Whole.Text) && !Core.IsEmpty(MBMUAC3Fract.Text))
        {
            if (MBMUAC3Whole.Text == "99")
            {
                if (MBMUAC3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMUAC9"));
                    MBMUAC3Whole.Focus();
                }
            }

            //if (!Core.IsEmpty(LitLPVMedianMUAC.Text))
            //{
            //    if ((LitLPVMedianMUAC.Text != "99.9" || LitLPVMedianMUAC.Text != "66.6")
            //        || (MedianMUAC != "99.9" || MedianMUAC != "66.6"))
            //    {
            //        //
            //    }
            //    else
            //    {
            //        decimal decLPVMUAC = decimal.Parse(LitLPVMedianMUAC.Text);
            //        decimal decMBAFMUAC = decimal.Parse(MedianMUAC);
            //        if ((decMBAFMUAC - decLPVMUAC) > 3)
            //        {
            //            SetErrorMessage(source, arguments, "LPVF भिजिटमा लिईएको पाखुराको गोलाई  (" + LitLPVMedianMUAC.Text + ") भन्दा धेरै बढी छ।  कृपया पुन: नाप लिएर​ निश्चित गर्नुहोस। <br />");
            //        }

            //        decimal decLPVMUAC2 = decimal.Parse(LitLPVMedianMUAC.Text);
            //        decimal decMBAFMUAC2 = decimal.Parse(MedianMUAC);
            //        if ((decLPVMUAC2 - decMBAFMUAC2) > 2)
            //        {
            //            SetErrorMessage(source, arguments, "LPVF भिजिटमा लिईएको पाखुराको गोलाई  (" + LitLPVMedianMUAC.Text + ") भन्दा कम छ।  कृपया पुन: नाप लिएर​ निश्चित गर्नुहोस। <br />");
            //        }
            //    }
            //}

            //if (MBMUAC3Whole.Text == "66")
            //{
            //    if (MBMUAC3Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrMUAC6"));
            //        MBMUAC3Whole.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_ValidateBodyTemperature(object source, ServerValidateEventArgs arguments)
    {   //Note: Validation is skipped if either field is empty
        string message = "";
        if (!Core.IsEmpty(MBTEMPWhole.Text) && !Core.IsEmpty(MBTEMPFract.Text))
        {
            //if (!Regex.IsMatch(MBTEMPWhole.Text, "^(?:09[0-9]|10[0-7]|999|666)$"))
            //{
            //    message = "Whole part of temperature must be three<br>numeric digits between 090-107, 666, or 999. ";
            //    message = Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrTemp1");
            //}
            //if (!Regex.IsMatch(MBTEMPFract.Text, "^[0-9]$"))
            //{
            //    message += "Fraction part of temperature must be 1<br>numeric digit betwen 0 and 9. ";
            //    message += Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrTemp2");
            //}
            //if (MBTEMPWhole.Text == "999" && MBTEMPFract.Text != "9")
            //{
            //    message += "If whole part of temperature is '999'<br>then fraction part must be '9'. ";
            //    message += Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrTemp9");
            //}
            //if (MBTEMPWhole.Text == "666" && MBTEMPFract.Text != "6")
            //{
            //    message += "If whole part of temperature is '666'<br>then fraction part must be '6'. ";
            //    message += Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrTemp4");
            //}
            //if (!Core.IsEmpty(message))
            //{
            //    message.Trim();
            //    SetErrorMessage(source, arguments, message);
            //}
        }
    }
    protected void CustVal_BloodPressureSysDia(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(MBSYS.Text) && !Core.IsEmpty(MBDIA.Text))
        {
            if (MBSYS.Text == "999")
            {
                if (MBDIA.Text != "999")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrSYSDIA9"));
                    MBSYS.Focus();
                }
            }
            if (MBSYS.Text == "666")
            {
                if (MBDIA.Text != "666")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "MBAF", "ErrSYSDIA6"));
                    MBSYS.Focus();
                }
            }
        }
    }
    #endregion
}