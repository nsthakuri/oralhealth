using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_OH_PEF : System.Web.UI.Page
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
    }

    protected void CustVal_ConsentRequired(object source, ServerValidateEventArgs arguments)
    {
        if (PEVS.SelectedValue == "1") //MS Required
        {

        }
        else if (PEVS.SelectedValue == "8" || PEVS.SelectedValue == "9")
        {

        }
    }


    protected void CustVal_SubConsentRequired(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (LitMode.Text == "new")
        {

            
            if (PESUBCON.SelectedValue == "1")
            {
                SUBSTUDYTableAdapter SBTA = new SUBSTUDYTableAdapter();
                //mint4.SUBSTUDYDataTable SBDT = new mint4.SUBSTUDYDataTable();
                //SBTA.FillByNNIPSNUM(SBDT, NNIPSNUM.Text);
                //if (SBDT.Rows.Count == 0)
                //{
                int MaxRec = int.Parse(SBTA.GetMaxRecord().ToString());
                int NextCounter = MaxRec + 1;
                int remainder = NextCounter % 10;
                if (NextCounter >= 10)
                {
                    if (remainder != 0)
                    {
                        int value1 = NextCounter - remainder;
                        int value2 = NextCounter;
                        int ConsentValue = int.Parse(SBTA.GetCountConsent(value1, value2).ToString());
                        if (ConsentValue == 1)
                        {
                            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNotElig"));
                            PESUBCON.Focus();
                        }
                    }
                }
                //else
                //{
                //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNotSelect"));
                //    PESUBCON.Focus();
                //}
                // }
            }
          
    }  */
    }


    //2nd bp required
    protected void CustVal_FRSTBPRequired(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEBP2REQ.Text))
        {
            if (PESYS1.Text != "999" || PESYS1.Text != "666")
            {
                if (int.Parse(PESYS1.Text) > 140
                    || int.Parse(PEDIA1.Text) > 90)
                {
                    if (PEBP2REQ.Text == "0")
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReq2BP"));
                        PEBP2REQ.Focus();
                    }
                }
                else if (int.Parse(PESYS1.Text) < 140
                    || int.Parse(PEDIA1.Text) < 90)
                {
                    if (PEBP2REQ.Text == "1")
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNo2BP"));
                        PEBP2REQ.Focus();
                    }
                }
            }
        }
    }
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
        //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrUniqueValue"));
        //    arguments.IsValid = false;
        //}
    }

    /// --------------------------
    //sec b q=1a.
    protected void CustVal_RequiredIfAnyDaughtDied(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (Regex.IsMatch(PEDAU.Text, "^\\d\\d$"))
        {
            int locDaughtBornAlive = int.Parse(PEDAU.Text);
            if (locDaughtBornAlive == 0)
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    PEDAUDIED.Focus();
                }
            }
            else if (locDaughtBornAlive > 0 && locDaughtBornAlive <= 20)
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    PEDAUDIED.Focus();
                }
            }
            //99 is optional
        }
        else if (Core.IsEmpty(PEDAU.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                PEDAUDIED.Focus();
            }
        }
        */
    }
    protected void CustVal_ValidationPESON(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PESON.Text))
        {
            if (PEPREGN.Text == "01")
            {
                if (PEOUTC.Text == "1")
                {
                    if ((PEDAU.Text == "00") && (PESON.Text == "00"))
                    {
                        //SetErrorMessage(source, arguments, "The response of Q1 or Q2 should be non zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrPEDAU"));
                        PESON.Focus();
                    }
                }
                else if (PEOUTC.Text != "1")
                {
                    if ((PEDAU.Text != "00") || (PESON.Text != "00"))
                    {
                        //SetErrorMessage(source, arguments, "The response of Q1 and Q2 should be zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNOPEDAU"));
                        PESON.Focus();
                    }
                }
            }
        }
    }
    protected void CustVal_ValidationPESBN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PESBN.Text))
        {
            if (PEPREGN.Text == "01")
            {
                if (PEOUTC.Text == "2")
                {
                    if (PESBN.Text == "00")
                    {
                        //SetErrorMessage(source, arguments, "The response of Q3 should be non zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHASSBN"));
                        PESBN.Focus();
                    }
                }
                else if (PEOUTC.Text != "2")
                {
                    if (PESBN.Text != "00")
                    {
                        //SetErrorMessage(source, arguments, "The response of Q3 should be zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNOSBN"));
                        PESBN.Focus();
                    }
                }
            }
        }
    }
    protected void CustVal_ValidationPEMCN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEMCN.Text))
        {
            if (PEPREGN.Text == "01")
            {
                if (PEOUTC.Text == "3")
                {
                    if (PEMCN.Text == "00")
                    {
                        //SetErrorMessage(source, arguments, "The response of Q4 should be non zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHASMCN"));
                        PEMCN.Focus();
                    }
                }
                else if (PEOUTC.Text != "3")
                {
                    if (PEMCN.Text != "00")
                    {
                        //SetErrorMessage(source, arguments, "The response of Q4 should be zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNOMCN"));
                        PEMCN.Focus();
                    }
                }
            }
        }
    }

    //
    protected void CustVal_ValidationPEABORT(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEABORT.Text))
        {
            if (PEPREGN.Text == "01")
            {
                if (PEOUTC.Text == "4")
                {
                    if (PEABORT.Text == "00")
                    {
                        //SetErrorMessage(source, arguments, "The response of Q4 should be non zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHASABORT"));
                        PEABORT.Focus();
                    }
                }
                else if (PEOUTC.Text != "4")
                {
                    if (PEABORT.Text != "00")
                    {
                        //SetErrorMessage(source, arguments, "The response of Q4 should be zero based on Q5 (section A).");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNOABORT"));
                        PEABORT.Focus();
                    }
                }
            }
        }
    }

    protected void CustVal_RequiredIfEverPreg(object source, ServerValidateEventArgs arguments)
    {
        if (PEFIRSTPREG.Text == "0")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                PEPREGN.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
            PEPREGN.Focus();
        }
    }
    protected void CustVal_RequiredPETRIP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEPREGN.Text))
        {
            if (int.Parse(PEPREGN.Text) > 1)
            {
                if (PEDAU.Text == "00" && PESON.Text == "00"
                    && PESBN.Text == "00" && PEMCN.Text == "00"
                    && PETWIN.Text == "00" && PETRIP.Text == "00"
                    && PEABORT.Text == "00")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSecCQues"));
                    PETRIP.Focus();
                }
            }

            if (!Core.IsEmpty(PEDAUDIED.Text) && !Core.IsEmpty(PESONDIED.Text))
            {
                int TotBorn = int.Parse(PEDAU.Text) + int.Parse(PEDAUDIED.Text) + int.Parse(PESON.Text) + int.Parse(PESONDIED.Text) + int.Parse(PESBN.Text) + int.Parse(PEMCN.Text) + int.Parse(PEABORT.Text) + int.Parse(PETWIN.Text) + int.Parse(PETRIP.Text);
                int intPreg = int.Parse(PEPREGN.Text);
                if (TotBorn < intPreg)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrTotalBorn"));
                    PETRIP.Focus();
                }
            }
            else if (!Core.IsEmpty(PEDAUDIED.Text) && Core.IsEmpty(PESONDIED.Text))
            {
                int TotBorn = int.Parse(PEDAU.Text) + int.Parse(PEDAUDIED.Text) + int.Parse(PESON.Text) + int.Parse(PESBN.Text) + int.Parse(PEMCN.Text) + int.Parse(PEABORT.Text) + int.Parse(PETWIN.Text) + int.Parse(PETRIP.Text);
                int intPreg = int.Parse(PEPREGN.Text);
                if (TotBorn < intPreg)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrTotalBorn"));
                    PETRIP.Focus();
                }
            }
            else if (Core.IsEmpty(PEDAUDIED.Text) && !Core.IsEmpty(PESONDIED.Text))
            {
                int TotBorn = int.Parse(PEDAU.Text) + int.Parse(PESON.Text) + int.Parse(PESONDIED.Text) + int.Parse(PESBN.Text) + int.Parse(PEMCN.Text) + int.Parse(PEABORT.Text) + int.Parse(PETWIN.Text) + int.Parse(PETRIP.Text);
                int intPreg = int.Parse(PEPREGN.Text);
                if (TotBorn < intPreg)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrTotalBorn"));
                    PETRIP.Focus();
                }
            }
        }
    }
    protected void CustVal_RequiredIfAnySonsDied(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (Regex.IsMatch(PESON.Text, "^\\d\\d$"))
        {
            int locSonBornAlive = int.Parse(PESON.Text);
            if (locSonBornAlive == 0)
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    //SetErrorMessage(source, arguments, "This field should be blank (based on B2)");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                }
            }
            else if (locSonBornAlive > 0 && locSonBornAlive <= 20)
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    //SetErrorMessage(source, arguments, "This field is required (based on B2)");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                }
            }
            //99 is optional
        }
        else if (Core.IsEmpty(PESON.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                //SetErrorMessage(source, arguments, "This field should be blank (based on B2)");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
            }
        }
        */
    }
    protected void CustVal_ValidateMenstrualDateAll99orNone99(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (!Core.IsEmpty(LMPNEP))
        {
            if (PELMPNEPDay.Text != "99" && PELMPNEPMonth.Text != "99" && PELMPNEPYear.Text != "99")
            {
                if (nLMPROM == null)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMP"));
                    PELMPNEPDay.Focus();
                }
            }
            else if (PELMPNEPDay.Text == "99" && PELMPNEPMonth.Text == "99" && PELMPNEPYear.Text == "99")
            {
                // valid: no LMP date
            }
            else if (PELMPNEPYear.Text == "99")
            {
                //cvPELMPNEP.ErrorMessage = "99 is invalid for YY unless date all fields are 99";
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrInvLMP"));
                PELMPNEPDay.Focus();
            }
        }
        */
    }
    protected void CustVal_LMPDateValidation(object source, ServerValidateEventArgs arguments)
    {
        /*
        // Date Compare, Date Diff
        if (nLMPROM.HasValue)
        {
            if (!nRomDate.HasValue)
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrCompLMP"));
                PELMPNEPDay.Focus();
            }

            //Preg. Valid months = 01-04
            DateTime dateOfLMP = (DateTime)nLMPROM;
            DateTime dateOfForm = (DateTime)nRomDate;
            TimeSpan diffDate = dateOfForm.Subtract(dateOfLMP);

            int intDays = diffDate.Days;
            double ftVal = 30.00d;
            double ftLMPMon = double.Parse(intDays.ToString()) / ftVal;
            string strPregMon = ftLMPMon.ToString("00.00");
            double dblPregMon = double.Parse(ftLMPMon.ToString("00.00"));
            int intPregMon = int.Parse(Math.Ceiling(dblPregMon).ToString());

            //case-1: if Known LMP date then calculate LMP and record into the database
            //case-2: if Unknown LMP date (99-99-2077) then calculate
            //LMP RomDate would be calcualted based on 15-06-2077 nepdate (Imputed)
            //But NepLMP date would still insert origital (999977) into the database.

            if ((PEMONPREG.Text == "99")
                && (LMPNEP.Substring(2, 2) != "99"))
            {
                //The LMP date should be within 4 months (120 Days)
                if (diffDate.Days > 120)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMPDate") + " " + ftLMPMon.ToString("#00"));
                    PEMONPREG.Focus();
                    return;
                }
            }
            else if ((PEMONPREG.Text != "99")
                && (LMPNEP.Substring(2, 2) != "99"))
            {
                //Known lmp date and running pregnancy month
                //Known running pregnancy month
                if (PEMONPREG.Text == "01")
                {
                    if (intDays > 30)
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00") + " )");
                        PEMONPREG.Focus();
                    }
                }
                else if (PEMONPREG.Text == "02")
                {
                    if (intDays > 30 && intDays <= 60)
                    {
                        //valid
                    }
                    else
                    {
                        //error
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
                        PEMONPREG.Focus();
                    }
                }
                else if (PEMONPREG.Text == "03")
                {
                    if (intDays > 60 && intDays <= 90)
                    {
                        //valid
                    }
                    else
                    {
                        //error
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
                        PEMONPREG.Focus();
                    }
                }
                else if (PEMONPREG.Text == "04")
                {
                    if (intDays > 90 && intDays <= 120)
                    {
                        //valid
                    }
                    else
                    {
                        //error
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
                        PEMONPREG.Focus();
                    }
                }
            }


            /////////////
            //if ((PEMONPREG.Text == "99")
            //    && (LMPNEP.Substring(2, 2) != "99"))
            //{
            //    if (strPregMon != string.Empty)
            //    {                    
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrPregMon") + " " + strPregMon.ToString());
            //        PEMONPREG.Focus();
            //        return;
            //    }
            //    if (diffDate.Days > 150)
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMPDate"));
            //        PEMONPREG.Focus();
            //        return;
            //    }
            //}
            //else if ((PEMONPREG.Text != "99")
            //    && (LMPNEP.Substring(2, 2) == "99"))
            //{
            //     DateTime LMPRom = new DateTime();
            //     int intPregmon = int.Parse(PEMONPREG.Text);
            //     if (nRomDate.HasValue)
            //     {
            //        DateTime RomDate = (DateTime)nRomDate;
            //        LMPRom = (RomDate.AddMonths(-intPregmon));
            //     }
            //     string strLMPNepDate = Core.GetNepDateFromRomDate(LMPRom);
            //     if (strLMPNepDate != string.Empty)
            //     {                    
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMPMon") + " " + strLMPNepDate);
            //        PEMONPREG.Focus();
            //        return;
            //     }
            //}
            //else if((PEMONPREG.Text != "99")
            //    && (LMPNEP.Substring(2, 2) != "99"))
            //{
            //    if (PEMONPREG.Text == "01")
            //    {
            //        if (intDays > 30)
            //        {
            //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
            //            PEMONPREG.Focus();
            //        }
            //    }
            //    else if (PEMONPREG.Text == "02")
            //    {
            //        if (intDays > 30 && intDays <= 60)
            //        {
            //            //ok
            //        }
            //        else
            //        {
            //            //error
            //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
            //            PEMONPREG.Focus();
            //        }
            //    }
            //    else if (PEMONPREG.Text == "03")
            //    {
            //        if (intDays > 60 && intDays <= 90)
            //        {
            //            //ok
            //        }
            //        else
            //        {
            //            //error
            //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
            //            PEMONPREG.Focus();
            //        }
            //    }
            //    else if (PEMONPREG.Text == "04")
            //    {
            //        if (intDays > 90 && intDays <= 120)
            //        {
            //            //ok
            //        }
            //        else
            //        {
            //            //error
            //            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00"));
            //            PEMONPREG.Focus();
            //        }
            //    }
            //    //else if (PEMONPREG.Text == "05")
            //    //{
            //    //    if (intDays > 120 && intDays <= 150)
            //    //    {
            //    //        //ok
            //    //    }
            //    //    else
            //    //    {
            //    //        //error
            //    //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00")); SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSuggMon") + " " + intPregMon.ToString("#00") + "," + intDays.ToString());
            //    //        PEMONPREG.Focus();
            //    //    }
            //    //}
            //}
        }

        if (!Core.IsEmpty(LMPNEP))
        {
            if (LMPNEP == "999999" || (LMPNEP.Substring(0, 2) == "99" && LMPNEP.Substring(2, 2) == "99"))
            {

            }
            else
            {
                if (nLMPROM > nRomDate)
                {
                    //SetErrorMessage(source, arguments, "LMP date must be before form date.");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMPDateFormDate"));
                    PELMPNEPDay.Focus();
                }
            }
        }

        if (!Core.IsEmpty(FormDateNep) && !Core.IsEmpty(OUTCNEP) && !Core.IsEmpty(LMPNEP))
        {
            if ((LMPNEP == "99992099" || (LMPNEP.Substring(0, 2) == "99" && LMPNEP.Substring(2, 2) == "99")
                && (OUTCNEP == "99992099" || (OUTCNEP.Substring(0, 2) == "99" && OUTCNEP.Substring(2, 2) == "99"))))
            {
                //valid
            }
            else
            {
                if (OUTCNEP != "99992099")
                {
                    if (nOUTCROM <= nLMPROM)
                    {
                        //valid
                    }
                    else
                    {
                        //SetErrorMessage(source, arguments, "<br /> Last pregnancy end date must be before or on the same date of LMP date.");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMPDateOutDate"));
                        PELMPNEPDay.Focus();
                    }
                }

                //
                if (LMPNEP.Substring(0, 2) != "99")
                {
                    if (nLMPROM <= nRomDate)
                    {
                        //valid
                    }
                    else
                    {
                        //SetErrorMessage(source, arguments, "<br /> LMP date must be before or on the same date of Form date.");
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrLMPDateForm"));
                        PELMPNEPDay.Focus();
                    }
                }
            }
        }
        */
    }
    protected void CustVal_RequiredIfDelLocOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEDELLOC.Text))
        {
            if (PEDELLOC.Text == "7")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    //SetErrorMessage(source, arguments, "<br />यदि प्र नं 4 = 7 छ​ भने यो प्रश्ट​ पार्नुहोसमा डाटा भर्नुहोस।");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    PEDELLOCSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    //SetErrorMessage(source, arguments, "<br />यदि प्र नं 4 = 7 छैन​ भने यो प्रश्ट​ पार्नुहोसमा डाटा लिनु पर्दैन।");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    PEDELLOCSP.Focus();
                }
            }
        }
    }

    protected void Validate_RequiredPEOTHRBEVRGSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEOTHRBEVRG.Text))
        {
            if (PEOTHRBEVRG.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    PEOTHRBEVRGSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    PEOTHRBEVRGSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(PEOTHRBEVRG.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                PEOTHRBEVRGSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredValidationA(object source, ServerValidateEventArgs arguments)
    {
        if (PETREAT.Text == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                //SetErrorMessage(source, arguments, "<br />Field Required if treatment sought");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                PETREATA.Focus();
            }
        }
        else if (PETREAT.Text == "0")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                //SetErrorMessage(source, arguments, "<br />Field should be blank (based on C5)");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                PETREATA.Focus();
            }
        }
        //9 optional
    }
    protected void CustVal_RequiredValidation(object source, ServerValidateEventArgs arguments)
    {
        if (PETREAT.Text == "0")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                //SetErrorMessage(source, arguments, "Field should be blank (based on C5)");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                PETREATB.Focus();
            }
        }
    }
    protected void CustVal_RequiredIfExperiencedSymptom(object source, ServerValidateEventArgs arguments)
    {
        /*
        //Get the custom validator
        CustomValidator cv = (CustomValidator)source;

        //Get the num of days textbox name by dropping 'cv' at the beginning, 'TRT' at the end
        string numDaysCtrlName = cv.ID.Substring(2, (cv.ID.Length - 5));
        TextBox numDaysTextBoxCtrl = (TextBox)PanelSectionE.FindControl(numDaysCtrlName);
        //Make sure it is numeric.  If no, we skip validating (a separate RegEx validator should handle this)
        if (Regex.IsMatch(numDaysTextBoxCtrl.Text, "^[0-69]+$"))
        {
            Int32 numDays = Int32.Parse(numDaysTextBoxCtrl.Text);
            if (numDays > 0 && numDays <= 30)
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    //SetErrorMessage(source, arguments, "Field required<br />(number of days > 0)");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    numDaysTextBoxCtrl.Focus();
                }
            }
            else if (numDays == 0)
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    //SetErrorMessage(source, arguments, "Field should be blank<br />(number of days = 0)");
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    numDaysTextBoxCtrl.Focus();
                }
            }
            //numDays == 99  leave at optional
        }
        */
    }
    protected void CustVal_RequiredIfYesBidi(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesTobAlc(source, arguments, PEBIDI.Text);
    }
    protected void CustVal_RequiredIfYesChwTob(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesTobAlc(source, arguments, PETOB.Text);
    }
    protected void CustVal_RequiredIfYesJaard(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesTobAlc(source, arguments, PEJAARD.Text);
    }
    protected void CustVal_RequiredIfYesRakshi(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfYesTobAlc(source, arguments, PERAKSHI.Text);
    }
    protected void RequiredIfYesTobAlc(object source, ServerValidateEventArgs arguments, string yesno)
    {
        if (yesno == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
            }
        }
        else if (yesno == "0" || yesno == "9")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
            }
        }
    }
    protected void CustVal_Validate1SYSDIA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PESYS1.Text) && !Core.IsEmpty(PEDIA1.Text))
        {
            if (PESYS1.Text == "999")
            {
                if (PEDIA1.Text != "999")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSYSDIA9"));
                    PEDIA1.Focus();
                }
            }
            else if (PESYS1.Text == "666")
            {
                if (PEDIA1.Text != "666")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSYSDIA6"));
                    PEDIA1.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate1Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEWT1Whole.Text) && !Core.IsEmpty(PEWT1Fract.Text))
        {
            if (PEWT1Whole.Text == "99")
            {
                if (PEWT1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrWeight9"));
                    PEWT1Fract.Focus();
                }
            }
            //else if (PEWT1Whole.Text == "66")
            //{
            //    if (PEWT1Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrWeight6"));
            //        PEWT1Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate2Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEWT2Whole.Text) && !Core.IsEmpty(PEWT2Fract.Text))
        {
            if (PEWT2Whole.Text == "99")
            {
                if (PEWT2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrWeight9"));
                    PEWT2Fract.Focus();
                }
            }
            //else if (PEWT2Whole.Text == "66")
            //{
            //    if (PEWT2Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrWeight6"));
            //        PEWT2Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate3Weight(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEWT3Whole.Text) && !Core.IsEmpty(PEWT3Fract.Text))
        {
            if (PEWT3Whole.Text == "99")
            {
                if (PEWT3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrWeight9"));
                    PEWT3Fract.Focus();
                }
            }
            //else if (PEWT3Whole.Text == "66")
            //{
            //    if (PEWT3Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrWeight6"));
            //        PEWT3Fract.Focus();
            //    }
            //}
        }
    }
    /// <summary>
    /// NO LONGER NEEDED
    /// </summary>
    /// <param name="source"></param>
    /// <param name="arguments"></param>
    protected void CustVal_Validate1Height(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEHT1Whole.Text) && !Core.IsEmpty(PEHT1Fract.Text))
        {
            if (PEHT1Whole.Text == "999")
            {
                if (PEHT1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHeight9"));
                    PEHT1Fract.Focus();
                }
            }
            //else if (PEHT1Whole.Text == "666")
            //{
            //    if (PEHT1Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHeight6"));
            //        PEHT1Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate2Height(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEHT2Whole.Text) && !Core.IsEmpty(PEHT2Fract.Text))
        {
            if (PEHT2Whole.Text == "999")
            {
                if (PEHT2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHeight9"));
                    PEHT2Fract.Focus();
                }
            }
            //else if (PEHT2Whole.Text == "666")
            //{
            //    if (PEHT2Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHeight6"));
            //        PEHT2Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate3Height(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEHT3Whole.Text) && !Core.IsEmpty(PEHT3Fract.Text))
        {
            if (PEHT3Whole.Text == "999")
            {
                if (PEHT3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHeight9"));
                    PEHT3Fract.Focus();
                }
            }
            //else if (PEHT3Whole.Text == "666")
            //{
            //    if (PEHT3Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrHeight6"));
            //        PEHT3Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_ValidateBodyTemperature(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PETempWhole.Text) && !Core.IsEmpty(PETempFract.Text))
        {
            if (PETempWhole.Text == "999")
            {
                if (PETempFract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrTemp9"));
                    PETempFract.Focus();
                }
            }
            //else if (PETempWhole.Text == "666")
            //{
            //    if (PETempFract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrTemp6"));
            //        PETempFract.Focus();
            //    }
            //}
        }
    }

    protected void CustVal_Validate1MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEMUAC1Whole.Text) && !Core.IsEmpty(PEMUAC1Fract.Text))
        {
            if (PEMUAC1Whole.Text == "99")
            {
                if (PEMUAC1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrMUAC9"));
                    PEMUAC1Fract.Focus();
                }
            }
            //else if (PEMUAC1Whole.Text == "66")
            //{
            //    if (PEMUAC1Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrMUAC6"));
            //        PEMUAC1Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate2MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEMUAC2Whole.Text) && !Core.IsEmpty(PEMUAC2Fract.Text))
        {
            if (PEMUAC2Whole.Text == "99")
            {
                if (PEMUAC2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrMUAC9"));
                    PEMUAC2Fract.Focus();
                }
            }
            //else if (PEMUAC2Whole.Text == "66")
            //{
            //    if (PEMUAC2Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrMUAC6"));
            //        PEMUAC2Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate3MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEMUAC3Whole.Text) && !Core.IsEmpty(PEMUAC3Fract.Text))
        {
            if (PEMUAC3Whole.Text == "99")
            {
                if (PEMUAC3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrMUAC9"));
                    PEMUAC3Fract.Focus();
                }
            }
            //else if (PEMUAC3Whole.Text == "66")
            //{
            //    if (PEMUAC3Fract.Text != "6")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrMUAC6"));
            //        PEMUAC3Fract.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_Validate2SYSDIA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PESYS2.Text) && !Core.IsEmpty(PEDIA2.Text))
        {
            if (PESYS2.Text == "999")
            {
                if (PEDIA2.Text != "999")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSYSDIA9"));
                    PEDIA2.Focus();
                }
            }
            //else if (PESYS2.Text == "666")
            //{
            //    if (PEDIA2.Text != "666")
            //    {
            //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrSYSDIA6"));
            //        PEDIA2.Focus();
            //    }
            //}
        }
    }
    protected void CustVal_RequiredIfLMPDateRecorded(object source, ServerValidateEventArgs arguments)
    {
        /*
        // If month of LMPNEP is unknown, the LMP Nep date is basically uknown and must be imputed.
        if (!Core.IsEmpty(LMPNEP) && LMPNEP.Substring(2, 2) != "99")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                //SetErrorMessage(source, arguments, "Field required if LMP Date recorded");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
            }
        }
        else
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                //SetErrorMessage(source, arguments, "Field should be blank if LMP Date not recorded (or LMP Month = 99).");
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
            }
        }
        */
    }
    protected void CustVal_LMPNNIPSWeekValidation(object source, ServerValidateEventArgs arguments)
    {
        //if (Regex.IsMatch(LMPNEP, "^\\d{6}") && (LMPNEP.Substring(2, 2) != "99")
        //    || LMPNEP.Substring(2, 6) != "992099") //&& LMPNEP.Substring(0, 2) != "99")
        //{
        //    if (Core.CompareLMPWeekNepDate(LMPNEP, arguments.Value) == false)
        //    {
        //        arguments.IsValid = false;
        //    }
        //}
    }
    protected void CustVal_RequiredOUTCNEPDay(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfEverPregSpecField(source, arguments, "Day");
    }
    protected void CustVal_RequiredOUTCNEPMonth(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfEverPregSpecField(source, arguments, "Month");
    }
    protected void CustVal_RequiredOUTCNEPYear(object source, ServerValidateEventArgs arguments)
    {
        RequiredIfEverPregSpecField(source, arguments, "Year");
    }
    protected void RequiredIfEverPregSpecField(object source, ServerValidateEventArgs arguments, string dateField)
    {
        if (PEFIRSTPREG.Text == "0")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, dateField + " " + Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, dateField + " " + Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
        }
    }
    protected void CustVal_ValidateLastPregAll99orNone99(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (!Core.IsEmpty(OUTCNEP))
        {
            if (OutCDay.Text != "99" && OutCMonth.Text != "99" && OutCYear.Text != "99")
            {
                if (nOUTCROM == null)
                {
                    cvPEOUTCNEP.ErrorMessage = Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrOutCDate");
                    arguments.IsValid = false;
                    OutCDay.Focus();
                }
            }
            else if (OutCDay.Text == "99" && OutCMonth.Text == "99" && OutCYear.Text == "99")
            {
                // valid: no LMP date
            }
            else if (OutCYear.Text == "99")
            {
                cvPEOUTCNEP.ErrorMessage = Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrInvOutCDate");
                arguments.IsValid = false;
                OutCDay.Focus();
            }
        }
        */
    }

    protected void CustVal_PESYS2DIA(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEBP2REQ.Text))
        {
            if (PEBP2REQ.Text == "1")
            {
                if (Core.IsEmpty(PESYS2.Text) ||
                    Core.IsEmpty(PEDIA2.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    PESYS2.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(PESYS2.Text) ||
                    !Core.IsEmpty(PEDIA2.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    PESYS2.Focus();
                }
            }
        }
    }

    protected void CustVal_PETOB2AMPM(object source, ServerValidateEventArgs arguments)
    {
        /*
        if (!Core.IsEmpty(PEBP2REQ.Text))
        {
            if (PEBP2REQ.Text == "1")
            {
                if (Core.IsEmpty(PETOB2HH.Text) ||
                    Core.IsEmpty(PETOB2MM.Text) ||
                    PETOB2AMPM.SelectedValue == "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    PETOB2HH.Focus();
                }
                else
                {
                    //2nd BP should be taken after 1hr of 1st BP
                    TimeSpan TimeDiff = (DateTime)BP2TIME - (DateTime)BP1TIME;
                    double Minutes = TimeDiff.TotalMinutes;
                    if (Minutes < 60)
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrBPTIME"));
                        PETOB2HH.Focus();
                    }
                }
            }
            else
            {
                if (!Core.IsEmpty(PETOB2HH.Text) ||
                    !Core.IsEmpty(PETOB2MM.Text) ||
                    PETOB2AMPM.SelectedValue != "X")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    PETOB2HH.Focus();
                }
            }
        }
        */
    }
    protected void CustVal_PEPRTN(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEDIA2.Text))
        {
            if (PESYS2.Text != "999" || PESYS2.Text != "999")
            {
                if ((int.Parse(PESYS2.Text) > 140
                            || int.Parse(PEDIA2.Text) > 90))
                {
                    if (PEPRTN.Text == "0")
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "Err2Protein"));
                        PEPRTN.Focus();
                    }
                }
                else if ((int.Parse(PESYS2.Text) <= 140)
                       || (int.Parse(PEDIA2.Text) <= 90))
                {
                    if (PEPRTN.Text == "1")
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "Err1Protein"));
                        PEPRTN.Focus();
                    }
                }
            }
        }
    }
    protected void CustVal_PEPRTNRES(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(PEPRTN.Text))
        {
            if (PEPRTN.Text == "1")
            {
                if (Core.IsEmpty(PEPRTNRES.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrReqField"));
                    PEPRTN.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(PEPRTNRES.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "MINT4", "PEF", "ErrNoReqField"));
                    PEPRTN.Focus();
                }
            }
        }
    }
    #endregion

}