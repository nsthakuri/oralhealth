using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_OH_IBAF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region VALIDATION
    /*************************
    *      VALIDATION       *
    *************************/
    protected void CustVal_IBAFFSRequired(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFMS.SelectedValue == "1")
        {
            if (IBAFFS.SelectedValue == "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFFS.Focus();
                return;
            }
        }
        else if (IBAFMS.SelectedValue == "2" ||
                IBAFMS.SelectedValue == "7")
        {
            if (IBAFFS.SelectedValue != "X")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFFS.Focus();
                return;
            }
        }
    }
    protected void CustVal_ValidateIBAFVSNOW(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFOUTC.Text == "1")
        {
            if (Core.IsEmpty(IBAFVSNOW.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFVSNOW.Focus();
            }
        }
        else if (IBAFOUTC.Text == "3" || IBAFOUTC.Text == "9")
        {
            if (!Core.IsEmpty(IBAFVSNOW.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFVSNOW.Focus();
            }
        }
    }
    protected void CustVal_DOBValidation(object source, ServerValidateEventArgs arguments)
    {
        /*
        MBAFTableAdapter MBAdatper = new MBAFTableAdapter();
        mint4.MBAFDataTable MBDT = new mint4.MBAFDataTable();
        MBAdatper.FillByNNIPSNUM(MBDT, NNIPSNUM.Text);
        if (MBDT.Rows.Count > 0)
        {
            mint4.MBAFRow CRow = (mint4.MBAFRow)MBDT.Rows[0];
            
            if (CRow.MBOUTCNEPDATE != DOBNep)
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrOutDateVsDOB"));
                IBAFDOBDD.Focus();
                return;
                //MBAF outcome date  and IBAF DOB  do not match.
            }

            if (IBAFCHILDNUM.Text == "1")
            {
                if (IBAFOUTC.Text != CRow.MBBABY1OUT)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFOUTC1VsMBOutC"));
                    IBAFOUTC.Focus();
                }
                if (IBAFOUTC.Text == "1")
                {
                    if (IBAFVSNOW.Text != CRow.MBBABY1CURVS)
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFVSNOW1VsMBVS"));
                        IBAFVSNOW.Focus();
                    }
                }
            }
            if (IBAFCHILDNUM.Text == "2")
            {                
                if (IBAFOUTC.Text != CRow.MBBABY2OUT)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFOUTC2VsMBOutC"));
                    IBAFOUTC.Focus();
                }
                if (IBAFOUTC.Text == "1")
                {
                    if (IBAFVSNOW.Text != CRow.MBBABY2CURVS)
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFVSNOW2VsMBVS"));
                        IBAFOUTC.Focus();
                    }
                }
            }
            if (IBAFCHILDNUM.Text == "3")
            {
                if (IBAFOUTC.Text != CRow.MBBABY3OUT)
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFOUTC3VsMBOutC"));
                    IBAFOUTC.Focus();
                }
                if (IBAFOUTC.Text == "1")
                {
                    if (IBAFVSNOW.Text != CRow.MBBABY3CURVS)
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFVSNOW3VsMBVS"));
                        IBAFOUTC.Focus();
                    }
                }
            }
        }
        */
        //if (LitMode.Text == "new")
        //{
        //    if (LitMetStatus.Text != IBAFMS.SelectedValue.ToString())
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMBMSvsIBAFMS"));
        //        IBAFMS.Focus();
        //    }
        //    if (LitFormStatus.Text != IBAFFS.SelectedValue.ToString())
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMBFSvsIBAFFS"));
        //        IBAFFS.Focus();
        //    }
        //}
    }

    protected void CustVal_ReqIfBabyLiveBirth(object source, ServerValidateEventArgs arguments)
    {
        //if (IsBabyLiveBirth())
        //{
        //    if (Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
        //    }
        //}
        //else
        //{
        //    if (!Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
        //    }
        //}
    }
    protected void CustVal_ReqIfBabyLiveBirthAndAliveNow(object source, ServerValidateEventArgs arguments)
    {
        //if (IsBabyLiveBirthAndAliveNow())
        //{
        //    if (Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
        //    }
        //}
        //else
        //{
        //    if (!Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
        //    }
        //}
    }
    protected void CustVal_ReqIfBabyStillBirth(object source, ServerValidateEventArgs arguments)
    {
        //if (IsBabyStillBirth())
        //{
        //    if (Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
        //    }
        //}
        //else
        //{
        //    if (!Core.IsEmpty(arguments.Value))
        //    {
        //        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
        //    }
        //}
    }
    protected void CustVal_RequIfBabyCaredForOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFBEFOREPLAC.Text))
        {
            if (IBAFBEFOREPLAC.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFBEFOREPLACSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFBEFOREPLACSP.Focus();
                }
            }
        }
    }
    protected void CustVal_RequIfCordOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCORDCUTINSTRM.Text))
        {
            if (IBAFCORDCUTINSTRM.Text == "5")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFCORDCUTINSTRMSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFCORDCUTINSTRMSP.Focus();
                }
            }
        }
    }
    protected void CustVal_RequiredValCord(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFAPPLCORD.Text))
        {
            if (IBAFAPPLCORD.Text == "0"
                || IBAFAPPLCORD.Text == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFAPPLCORDB.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFAPPLCORD.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFAPPLCORDB.Focus();
            }
        }
    }
    protected void CustVal_RequiredValGiven(object source, ServerValidateEventArgs arguments)
    {
        if (Core.IsEmpty(IBAFGIVENBABYA.Text) || IBAFGIVENBABYA.Text == "00")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFGIVENBABYB.Focus();
            }
        }
    }
    protected void CustVal_RequiredValSign(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFBIRTHINJ.Text == "0" || IBAFBIRTHINJ.Text == "9")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFBIRTHINJSIGNSB.Focus();
            }
        }
        else if (IBAFBIRTHINJ.Text == "1")
        {
            if (IBAFBIRTHINJSIGNSA.Text == IBAFBIRTHINJSIGNSB.Text)
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrorValues"));
                IBAFBIRTHINJSIGNSB.Focus();
            }
        }
    }
    protected void CustVal_RequiredValCry(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCRYBREATHMEAS.Text))
        {
            if (IBAFCRYBREATHMEAS.Text == "0"
                || IBAFCRYBREATHMEAS.Text == "9")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFCRYBREATHMEASB.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFCRYBREATHMEAS.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFCRYBREATHMEASB.Focus();
            }
        }
    }
    protected void CustVal_RequIfAnythingApplied(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFAPPLCORD.Text))
        {
            if (IBAFAPPLCORD.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFAPPLCORDA.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFAPPLCORDA.Focus();
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
        //        (!Core.IsEmpty(ItemB.Text) && ItemB.Text == ItemC.Text) ||
        //        (!Core.IsEmpty(ItemC.Text) && ItemC.Text == ItemA.Text))
        //{
        //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrUniqueValue"));
        //    arguments.IsValid = false;
        //}
    }
    protected void CustVal_RequIfAnythingAppliedOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFAPPLCORD.Text))
        {
            if (IBAFAPPLCORD.Text == "1")
            {
                if ((IBAFAPPLCORDA.Text == "8")
                    || (IBAFAPPLCORDB.Text == "8")
                    || (IBAFAPPLCORDC.Text == "8"))
                {
                    if (Core.IsEmpty(IBAFAPPLCORDSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                        IBAFAPPLCORDSP.Focus();
                    }
                }
                else if ((IBAFAPPLCORDA.Text != "8")
                        || (IBAFAPPLCORDB.Text != "8")
                        || (IBAFAPPLCORDC.Text != "8"))
                {
                    if (!Core.IsEmpty(IBAFAPPLCORDSP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                        IBAFAPPLCORDSP.Focus();
                    }
                }
            }
            else if (IBAFAPPLCORD.Text == "0"
                || IBAFAPPLCORD.Text == "9")
            {
                if (!Core.IsEmpty(IBAFAPPLCORDSP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFAPPLCORDSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFAPPLCORD.Text))
        {
            if (!Core.IsEmpty(IBAFAPPLCORDSP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFAPPLCORDSP.Focus();
            }
        }
    }

    protected void CustVal_RequIfBabyBreastFed(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFBREASTFED.Text))
        {
            if (IBAFBREASTFED.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFBREASTFEDWHO.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFBREASTFEDWHO.Focus();
                }
            }
        }
    }
    protected void CustVal_RequIfSignsOfInjury(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFBIRTHINJ.Text == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFBIRTHINJSIGNSA.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
            IBAFBIRTHINJSIGNSA.Focus();
        }
    }

    protected void CustVal_RequIfSignsOfInjuryOther(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFBIRTHINJ.Text == "1"
            && (IBAFBIRTHINJSIGNSA.Text == "3" ||
                IBAFBIRTHINJSIGNSB.Text == "3"))
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFBIRTHINJSIGNSP.Focus();
            }
        }
        else if (IBAFBIRTHINJ.Text == "0"
                || IBAFBIRTHINJ.Text == "9"
                || IBAFBIRTHINJSIGNSA.Text != "3"
                || IBAFBIRTHINJSIGNSB.Text != "3")
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFBIRTHINJSIGNSP.Focus();
            }
        }
    }
    protected void CustVal_RequIfCryBreathingMeas(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCRYBREATHMEAS.Text))
        {
            if (IBAFCRYBREATHMEAS.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFCRYBREATHMEASA.Focus();
                }
            }
            else if ((IBAFCRYBREATHMEAS.Text == "0")
                    || (IBAFCRYBREATHMEAS.Text == "9"))
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFCRYBREATHMEASA.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFCRYBREATHMEAS.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFCRYBREATHMEAS.Focus();
            }
        }
    }
    protected void CustVal_RequIfCryBreathingMeasOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCRYBREATHMEAS.Text))
        {
            if (IBAFCRYBREATHMEAS.Text == "1")
            {
                if ((IBAFCRYBREATHMEASA.Text == "8")
                    || (IBAFCRYBREATHMEASB.Text == "8")
                    || (IBAFCRYBREATHMEASC.Text == "8"))
                {
                    if (Core.IsEmpty(IBAFCRYBREATHMEASP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                        IBAFCRYBREATHMEASP.Focus();
                    }
                }
                else if ((IBAFCRYBREATHMEASA.Text != "8")
                        || (IBAFCRYBREATHMEASB.Text != "8")
                        || (IBAFCRYBREATHMEASC.Text != "8"))
                {
                    if (!Core.IsEmpty(IBAFCRYBREATHMEASP.Text))
                    {
                        SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                        IBAFCRYBREATHMEASP.Focus();
                    }
                }
            }
            else if (IBAFCRYBREATHMEAS.Text == "0"
                || IBAFCRYBREATHMEAS.Text == "9")
            {
                if (!Core.IsEmpty(IBAFCRYBREATHMEASP.Text))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFCRYBREATHMEASP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFCRYBREATHMEAS.Text))
        {
            if (!Core.IsEmpty(IBAFCRYBREATHMEASP.Text))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFCRYBREATHMEASP.Focus();
            }
        }

    }
    protected void CustVal_RequIfRelationshipOther(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFRESPONDREL.Text == "8")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFRESPONDRELSP.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
            IBAFRESPONDRELSP.Focus();
        }
    }
    protected void CustVal_RequIfPhysAbnAtDelivery(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFPHYSABN.Text == "1")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFABNDETAIL.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
            IBAFABNDETAIL.Focus();
        }
    }
    protected void CustVal_RequIfPhysAbnAtDeliveryOther(object source, ServerValidateEventArgs arguments)
    {
        if (IBAFABNDETAIL.Text == "4")
        {
            if (Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                IBAFABNDETAILSP.Focus();
            }
        }
        else if (!Core.IsEmpty(arguments.Value))
        {
            SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
            IBAFABNDETAILSP.Focus();
        }
    }

    protected void CustVal_RequiredIBAFCLEFTLIPSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCLEFTLIP.Text))
        {
            if (IBAFCLEFTLIP.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFCLEFTLIPSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFCLEFTLIPSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFCLEFTLIP.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFCLEFTLIPSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredIBAFEYESSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFEYES.Text))
        {
            if (IBAFEYES.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFEYESSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFEYESSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFEYES.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFEYESSP.Focus();
            }
        }
    }

    protected void CustVal_RequiredIBAFNEUTUBESP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFNEUTUBE.Text))
        {
            if (IBAFNEUTUBE.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFNEUTUBESP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFNEUTUBESP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFNEUTUBE.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFNEUTUBESP.Focus();
            }
        }
    }

    protected void CustVal_RequiredIBAFLIMBSP(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFLIMB.Text))
        {
            if (IBAFLIMB.Text == "1")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFLIMBSP.Focus();
                }
            }
            else
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFLIMBSP.Focus();
                }
            }
        }
        else if (Core.IsEmpty(IBAFLIMB.Text))
        {
            if (!Core.IsEmpty(arguments.Value))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                IBAFLIMBSP.Focus();
            }
        }
    }



    protected void CustVal_TimeCompare(object source, ServerValidateEventArgs arguments)
    {
        //if (DateAndTimeOfWeighing < DateAndTOB)
        //{
        //    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrTOBvsTOA"));
        //}
        if (!Core.IsEmpty(IBAFASSESSTIMEHH.Text) && !Core.IsEmpty(IBAFASSESSTIMEMM.Text) && IBAFASSESSTIMEAMPM.SelectedValue != "X")
        {
            if (!Core.IsValidInterviewTime(IBAFASSESSTIMEHH.Text, IBAFASSESSTIMEAMPM.SelectedValue))
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrTOA"));
                //SetErrorMessage(source, arguments, "Time of Assessment must be between 7:00 AM and 6:00 PM");
                IBAFASSESSTIMEHH.Focus();
            }
        }
    }
    protected void Validate_ValIBAFWeight(object source, ServerValidateEventArgs arguments)
    {
        //
        if (!Core.IsEmpty(IBAFWT.Text))
        {
            if (IBAFWT.Text == "0000")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFWEIGHTErr"));
                IBAFWT.Focus();
            }
            if (int.Parse(IBAFWT.Text) < 1500)
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFWEIGHT2Err"));
                IBAFWT.Focus();
            }

            if (IBAFWT.Text == "6666" || IBAFWT.Text == "8888"
                || IBAFWT.Text == "9999")
            {
                //TRUE
            }
            else if (IBAFWT.Text.Substring(3, 1) != "0")
            {
                SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrIBAFWEIGHTFRACT"));
                ////cvIBAFWEIGHTVal.ErrorMessage = "The final digit in weight measurement should always be 0.";
                IBAFWT.Focus();
            }
        }
    }
    protected void CustVal_Length1Range(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFLENGTH1Int.Text)
            && !Core.IsEmpty(IBAFLENGTH1Fract.Text))
        {
            if (IBAFLENGTH1Int.Text == "66")
            {
                if (IBAFLENGTH1Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int6"));
                    IBAFLENGTH1Int.Focus();
                }
            }
            else if (IBAFLENGTH1Int.Text == "88")
            {
                if (IBAFLENGTH1Fract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int8"));
                    IBAFLENGTH1Int.Focus();
                }
            }
            else if (IBAFLENGTH1Int.Text == "99")
            {
                if (IBAFLENGTH1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int9"));
                    IBAFLENGTH1Int.Focus();
                }
            }
        }
    }

    protected void CustVal_Length2Range(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFLENGTH2Int.Text)
            && !Core.IsEmpty(IBAFLENGTH2Fract.Text))
        {
            if (IBAFLENGTH2Int.Text == "66")
            {
                if (IBAFLENGTH2Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int6"));
                    IBAFLENGTH2Int.Focus();
                }
            }
            else if (IBAFLENGTH2Int.Text == "88")
            {
                if (IBAFLENGTH2Fract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int8"));
                    IBAFLENGTH2Int.Focus();
                }
            }
            else if (IBAFLENGTH2Int.Text == "99")
            {
                if (IBAFLENGTH2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int9"));
                    IBAFLENGTH2Int.Focus();
                }
            }
        }
    }
    protected void CustVal_Length3Range(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFLENGTH3Int.Text)
            && !Core.IsEmpty(IBAFLENGTH3Fract.Text))
        {
            if (IBAFLENGTH3Int.Text == "66")
            {
                if (IBAFLENGTH3Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int6"));
                    IBAFLENGTH3Int.Focus();
                }
            }
            else if (IBAFLENGTH3Int.Text == "88")
            {
                if (IBAFLENGTH3Fract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int8"));
                    IBAFLENGTH3Int.Focus();
                }
            }
            else if (IBAFLENGTH3Int.Text == "99")
            {
                if (IBAFLENGTH3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYLEN1Int9"));
                    IBAFLENGTH3Int.Focus();
                }
            }
        }
    }
    protected void CustVal_HeadCircumference1Range(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCIRCUMFERENCE1Int.Text)
            && !Core.IsEmpty(IBAFCIRCUMFERENCE1Fract.Text))
        {
            if (IBAFCIRCUMFERENCE1Int.Text == "66")
            {
                if (IBAFCIRCUMFERENCE1Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrHEAD1CIRCUM6"));
                    IBAFCIRCUMFERENCE1Int.Focus();
                }
            }
            else if (IBAFCIRCUMFERENCE1Int.Text == "88")
            {
                if (IBAFCIRCUMFERENCE1Fract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYHDCIRCUM1Int8"));
                    IBAFCIRCUMFERENCE1Int.Focus();
                }
            }
            else if (IBAFCIRCUMFERENCE1Int.Text == "99")
            {
                if (IBAFCIRCUMFERENCE1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrHEADCIRCUM9"));
                    IBAFCIRCUMFERENCE1Int.Focus();
                }
            }
        }
    }
    protected void CustVal_HeadCircumference2Range(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCIRCUMFERENCE2Int.Text)
            && !Core.IsEmpty(IBAFCIRCUMFERENCE2Fract.Text))
        {
            if (IBAFCIRCUMFERENCE2Int.Text == "66")
            {
                if (IBAFCIRCUMFERENCE2Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrHEAD1CIRCUM6"));
                    IBAFCIRCUMFERENCE2Int.Focus();
                }
            }
            else if (IBAFCIRCUMFERENCE2Int.Text == "88")
            {
                if (IBAFCIRCUMFERENCE2Fract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYHDCIRCUM1Int8"));
                    IBAFCIRCUMFERENCE2Int.Focus();
                }
            }
            else if (IBAFCIRCUMFERENCE2Int.Text == "99")
            {
                if (IBAFCIRCUMFERENCE2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrHEADCIRCUM9"));
                    IBAFCIRCUMFERENCE2Int.Focus();
                }
            }
        }
    }
    protected void CustVal_HeadCircumference3Range(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFCIRCUMFERENCE3Int.Text)
            && !Core.IsEmpty(IBAFCIRCUMFERENCE3Fract.Text))
        {
            if (IBAFCIRCUMFERENCE3Int.Text == "66")
            {
                if (IBAFCIRCUMFERENCE3Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrHEAD1CIRCUM6"));
                    IBAFCIRCUMFERENCE3Int.Focus();
                }
            }
            else if (IBAFCIRCUMFERENCE3Int.Text == "88")
            {
                if (IBAFCIRCUMFERENCE3Fract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrBABYHDCIRCUM1Int8"));
                    IBAFCIRCUMFERENCE3Int.Focus();
                }
            }
            else if (IBAFCIRCUMFERENCE3Int.Text == "99")
            {
                if (IBAFCIRCUMFERENCE3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrHEADCIRCUM9"));
                    IBAFCIRCUMFERENCE3Int.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate1MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFMUAC1Whole.Text) && !Core.IsEmpty(IBAFMUAC1Fract.Text))
        {
            if (IBAFMUAC1Whole.Text == "99")
            {
                if (IBAFMUAC1Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMUAC9"));
                    IBAFMUAC1Whole.Focus();
                }
            }
            if (IBAFMUAC1Whole.Text == "66")
            {
                if (IBAFMUAC1Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMUAC6"));
                    IBAFMUAC1Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate2MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFMUAC2Whole.Text) && !Core.IsEmpty(IBAFMUAC2Fract.Text))
        {
            if (IBAFMUAC2Whole.Text == "99")
            {
                if (IBAFMUAC2Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMUAC9"));
                    IBAFMUAC2Whole.Focus();
                }
            }
            if (IBAFMUAC2Whole.Text == "66")
            {
                if (IBAFMUAC2Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMUAC6"));
                    IBAFMUAC2Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_Validate3MUAC(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFMUAC3Whole.Text) && !Core.IsEmpty(IBAFMUAC3Fract.Text))
        {
            if (IBAFMUAC3Whole.Text == "99")
            {
                if (IBAFMUAC3Fract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMUAC9"));
                    IBAFMUAC3Whole.Focus();
                }
            }
            if (IBAFMUAC3Whole.Text == "66")
            {
                if (IBAFMUAC3Fract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrMUAC6"));
                    IBAFMUAC3Whole.Focus();
                }
            }
        }
    }
    protected void CustVal_TemperatureRange(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFTEMPInt.Text)
            && !Core.IsEmpty(IBAFTEMPFract.Text))
        {
            if (IBAFTEMPInt.Text == "666")
            {
                if (IBAFTEMPFract.Text != "6")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrTemp6"));
                    IBAFTEMPInt.Focus();
                }
            }
            else if (IBAFTEMPInt.Text == "888")
            {
                if (IBAFTEMPFract.Text != "8")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrTemp8"));
                    IBAFTEMPInt.Focus();
                }
            }
            else if (IBAFTEMPInt.Text == "999")
            {
                if (IBAFTEMPFract.Text != "9")
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrTemp9"));
                    IBAFTEMPInt.Focus();
                }
            }
        }
    }
    /// <summary>
    /// //
    /// </summary>
    /// <param name="source"></param>
    /// <param name="arguments"></param>


    protected void CustVal_RequIfBreastMilkAltOther(object source, ServerValidateEventArgs arguments)
    {
        if (!Core.IsEmpty(IBAFGIVENBABYA.Text))
        {
            if (IBAFGIVENBABYA.Text == "09"
                || IBAFGIVENBABYB.Text == "09"
                || IBAFGIVENBABYC.Text == "09")
            {
                if (Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrReqField"));
                    IBAFGIVENBABYSP.Focus();
                }
            }
            else if (IBAFGIVENBABYA.Text != "09"
                || IBAFGIVENBABYB.Text != "09"
                || IBAFGIVENBABYC.Text != "09")
            {
                if (!Core.IsEmpty(arguments.Value))
                {
                    SetErrorMessage(source, arguments, Core.GetLocalText(Master.strLangType, "mint4", "IBAF", "ErrNoReqField"));
                    IBAFGIVENBABYSP.Focus();
                }
            }
        }
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