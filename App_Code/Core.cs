using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using maharishiTableAdapters;
using OralHealthTableAdapters;
using employeeTableAdapters;
using System.Web.UI.WebControls;

public class Core
{
    public Core()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    
    public static string HashSHA1(string value)
    {
        var sha1 = System.Security.Cryptography.SHA1.Create();
        var inputBytes = System.Text.Encoding.ASCII.GetBytes(value);
        var hash = sha1.ComputeHash(inputBytes);

        var sb = new System.Text.StringBuilder();
        for (var i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString();
    }
    public static bool IsValidInterviewTime(string strHH, string strAMPM)
    {
        bool boolReturn = false;
        int intHH = int.Parse(strHH);
        if (strAMPM == "1")
        {
            // AM
            if (intHH > 7 && intHH < 12)
            {
                // Valid AM Range 08-11
                boolReturn = true;
            }
        }
        else
        {
            //PM
            if (intHH == 12 || (intHH > 0 && intHH < 7))
            {
                // Valid PM Range 01-06 (and 12)
                boolReturn = true;
            }
        }
        return boolReturn;
    }

    public static Dictionary<string, string> GetDateElements(DateTime RomDate)
    {
        Dictionary<string, string> dict = new Dictionary<string, string>();
        NepDateTableAdapter NA = new NepDateTableAdapter();
        maharishi.NepDateDataTable DT = new maharishi.NepDateDataTable();
        NA.FillByRomdate(DT, RomDate);
        if (DT.Rows.Count > 0)
        {
            maharishi.NepDateRow NRow = (maharishi.NepDateRow)DT.Rows[0];
            dict["Romdate"] = NRow.Romdate.ToString();
            dict["Week"] = NRow.Week;
            dict["DayOfWeek"] = NRow.DayOfWeek;
            dict["Nepdate"] = NRow.Nepdate;
            dict["NepdateDay"] = NRow.Nepdate.Substring(0, 2);
            dict["NepdateMonth"] = NRow.Nepdate.Substring(2, 2);
            dict["NepdateYear2"] = NRow.Nepdate.Substring(6, 2);
            dict["NepdateYear4"] = NRow.Nepdate.Substring(4, 2);
        }
        return dict;
    }

    public static string[] GetAddressUunit(string strAddress)
    {
        List<string> data = new List<string>();
        View_AddressUnitTableAdapter TA = new View_AddressUnitTableAdapter();
        OralHealth.View_AddressUnitDataTable DT = new OralHealth.View_AddressUnitDataTable();
        TA.FillByAddress(DT, strAddress);
        if (DT.Rows.Count > 0)
        {
            OralHealth.View_AddressUnitRow CRow = (OralHealth.View_AddressUnitRow)DT.Rows[0];
            data.Add(CRow.CAAddress);
            data.Add(CRow.CAMapUnit);
            //data.Add(CRow.CAHOHFNames.Trim());
            //data.Add(CRow.CAHOHLName.Trim());
            if(CRow.LAT != null)
            {
                data.Add(CRow.LAT.ToString());
                data.Add(CRow.LONG.ToString());
            }
            
        }
        return data.ToArray();
    }
    public static String GetLocalText(string strLangID, string strStudy, string strPage, string strItem)
    {
        //1=NEPALI | 2=ENGLISH
        LanguageTableAdapter LangTA = new LanguageTableAdapter();
        maharishi.LanguageDataTable LangDT = new maharishi.LanguageDataTable();
        LangTA.FillByItemID(LangDT, strStudy, strPage, strItem);
        foreach (maharishi.LanguageRow LangRow in LangDT.Rows)
        {
            if (strLangID == "1")
            {
                return LangRow.LGNEPALI;
            }
            else if (strLangID == "2")
            {
                return LangRow.LGENGLISH;
            }
        }
        return string.Empty;
    }
    public static string[] GetWeekDate(DateTime RomDate)
    {
        List<string> data = new List<string>();
        NepDateTableAdapter NA = new NepDateTableAdapter();
        maharishi.NepDateDataTable DT = new maharishi.NepDateDataTable();
        NA.FillByRomdate(DT, RomDate);
        if (DT.Rows.Count > 0)
        {
            maharishi.NepDateRow CRow = (maharishi.NepDateRow)DT.Rows[0];
            data.Add(CRow.Week); 
            data.Add(CRow.Nepdate);                         
            data.Add(CRow.Romdate.ToString());
        }
        return data.ToArray();
    }
    public static string[] GetPersonFromNNIPS(string strNNIPSNum)
    {
        List<string> data = new List<string>();
        maharishiTableAdapters.NNIPSTableAdapter NBAdapter = new maharishiTableAdapters.NNIPSTableAdapter();
        maharishi.NNIPSDataTable NDT = new maharishi.NNIPSDataTable();
        NBAdapter.FillByNNIPSnum(NDT, strNNIPSNum);
        if (NDT.Rows.Count == 0)
        {
            maharishi.NNIPSRow NRow = (maharishi.NNIPSRow)NDT.Rows[0];
            data.Add(NRow.FirstNames);
            data.Add(NRow.LastName);
            data.Add(NRow.Sex);
            data.Add(NRow.DOBNep);
            data.Add(NRow.DOBRom.ToString());
        }
        return data.ToArray();
    }
    public static DateTime? GetRomDateFromNepDate(String strNepDate, bool boolImputeDayMonth)
    {
        NepDateTableAdapter NepTable = new NepDateTableAdapter();
        maharishi.NepDateDataTable NDDT = new maharishi.NepDateDataTable();
        if (strNepDate != "")
        {
            if (boolImputeDayMonth)
            {
                strNepDate = FixNepDate(strNepDate);
            }
            NepTable.FillByNepDate(NDDT, strNepDate);
            foreach (maharishi.NepDateRow NNDR in NDDT.Rows)
            {
                return NNDR.Romdate;
            }
        }
        return null;
    }
     
    public static string FixNepDate(string strNepDate)
    {
        if (strNepDate.Length == 8)
        {
            if (strNepDate.Substring(4, 4) == "2099")
            {
                //whole date unknown
                // no estimatation
                return strNepDate;
            }
            if (strNepDate.Substring(0, 2) == "99")
            {
                strNepDate = "15" + strNepDate.Substring(2, 6);
            }
            if (strNepDate.Substring(2, 2) == "99")
            {
                strNepDate = strNepDate.Substring(0, 2) + "06" + strNepDate.Substring(4);
            }
        }
        return strNepDate;
    }

    public static string GetNepWeekAndDate()
    {
        string strWeekAndDate = "";
        string strSQL = "SELECT Nepdate, Week, DayOfWeek FROM NepDate WHERE (GETDATE() > Romdate) AND (GETDATE() < Romdate + 1)";
        string strConn = ConfigurationManager.ConnectionStrings["maharishiConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(strConn);

        //Create the Command object
        SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
        objConnection.Open();
        SqlDataReader objDataReader = default(SqlDataReader);
        objDataReader = objCommand.ExecuteReader();

        while (objDataReader.Read())
        {
            strWeekAndDate = objDataReader["Week"].ToString();
            strWeekAndDate += objDataReader["NepDate"].ToString();
            strWeekAndDate += objDataReader["DayOfWeek"].ToString();
        }

        //Close the datareader/dbconnection
        objDataReader.Close();
        objConnection.Close();
        return strWeekAndDate;
    }

    public static Dictionary<string, string> GetUser(string WORKERID)
    {
        Dictionary<string, string> Dict = new Dictionary<string, string>();

        STAFFTableAdapter TA = new STAFFTableAdapter();
        employee.STAFFDataTable DT = new employee.STAFFDataTable();

        TA.FillByActiveWorkerID(DT, WORKERID);
        if (DT.Rows.Count > 0)
        {
            employee.STAFFRow URow = (employee.STAFFRow)DT.Rows[0];
            Dict.Add("WORKERID", WORKERID);
            Dict.Add("SFFIRSTNAMES", URow.SFFIRSTNAMES);
            Dict.Add("SFLASTNAME", URow.SFLASTNAME);
            Dict.Add("SFTITLE", URow.SFTITLE);
            Dict.Add("SFMOBILE", URow.SFMOBILE);
            Dict.Add("SFADMIN", URow.SFADMIN);
            if (!URow.IsSFROLENull())
            {
                Dict.Add("SFROLE", URow.SFROLE);
            }
            else
            {
                Dict.Add("SFROLE", "0");
            }
        }
        return Dict;
    }
    public static void InsertDataEntryLogWorkerID(string strWorkerID)
    {
        string FileName = GetCurrentPageName();
        LogDataEntryTableAdapter LogAdapter = new LogDataEntryTableAdapter();
        LogAdapter.Insert(FileName, strWorkerID, DateTime.Now);
    }
    public static string GetCurrentPageName()
    {
        string sPath = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
        System.IO.FileInfo oInfo = new System.IO.FileInfo(sPath);
        string sRet = oInfo.Name;
        return sRet;
    }
    public static string CleanText(string input)
    {
        return string.IsNullOrWhiteSpace(input)
            ? null
            : input.Trim().ToUpper();
    }
    public static bool IsEmpty(string strIn)
    {
        return string.IsNullOrWhiteSpace(strIn);
    }
    public static string BuildNepaliDate(string day, string month, string year)
    {
        if (string.IsNullOrWhiteSpace(day) ||
            string.IsNullOrWhiteSpace(month) ||
            string.IsNullOrWhiteSpace(year))
            return null;

        return day.Trim() + month.Trim() + "20" + year.Trim();
    }
    public static string BuildAddress(string muniId, string ward, string hh)
    {
        if (string.IsNullOrWhiteSpace(muniId) ||
            string.IsNullOrWhiteSpace(ward) ||
            string.IsNullOrWhiteSpace(hh))
            return null;

        return muniId.Trim() + ward.Trim() + hh.Trim();
    }


    public static string GetROLEName(string ROLEID)
    {
        switch (ROLEID)
        {
            case "1":
                {
                    return "Administrator";
                }

            case "2":
                {
                    return "DEO";
                }

            case "3":
                {
                    return "Tablet Data Collector";
                }
            case "4":
                {
                    return "Ultrasound Team";
                }
            case "5":
                {
                    return "Investigator";
                }
            case "6":
                {
                    return "Super Administrator";
                }
            case "7":
                {
                    return "Oral Health Team";
                }
            default:
                {
                    return "No Role assigned";
                }
        }
    }

    public static string GetDEO()
    {
        return (HttpContext.Current.User.Identity.Name);
    }

    public static string generateNNIPSnumber()
    {
        int NewNNIPSnum = 0;
        string strSQL = "SELECT MAX(NNIPSnum) AS MaxNNIPSnum FROM NNIPS";
        string strConn = ConfigurationManager.ConnectionStrings["maharishiConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(strConn);

        //Create the Command object
        SqlCommand objCommand = new SqlCommand(strSQL, objConnection);
        objConnection.Open();
        SqlDataReader objDataReader = default(SqlDataReader);
        objDataReader = objCommand.ExecuteReader();

        while (objDataReader.Read())
        {
            NewNNIPSnum = int.Parse(objDataReader["MaxNNIPSnum"].ToString()) + 1;
        }

        //Close the datareader/dbconnection
        objDataReader.Close();
        objConnection.Close();
        return NewNNIPSnum.ToString();

    }

    public static void InsertPersonNNIPS(string NNIPSnum, string FirstNames, string LastName, string DOBNep, string Sex, string VS, string Address)
    {
        string strConn = ConfigurationManager.ConnectionStrings["maharishiConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(strConn);
        SqlCommand objCommand = new SqlCommand("sp_InsertNNIPS", objConnection);
        objCommand.CommandType = CommandType.StoredProcedure;
        objConnection.Open();
        objCommand.Parameters.AddWithValue("@NNIPSnum", NNIPSnum);
        objCommand.Parameters.AddWithValue("@FirstNames", FirstNames);
        objCommand.Parameters.AddWithValue("@LastName", LastName);
        objCommand.Parameters.AddWithValue("@DOBNep", DOBNep);
        objCommand.Parameters.AddWithValue("@DOBCode", DBNull.Value);
        objCommand.Parameters.AddWithValue("@Sex", Sex);
        objCommand.Parameters.AddWithValue("@VS", VS);
        objCommand.Parameters.AddWithValue("@Address", Address);
        objCommand.Parameters.AddWithValue("@UPDATE", DateTime.Now);
        objCommand.ExecuteNonQuery();
        objConnection.Close();
        objConnection.Dispose();
    }
    public static void UpdateInsertNNIPSWomen(string WomanNNIPSnum, string HusNNIPSnum)
    {
        string strConn = ConfigurationManager.ConnectionStrings["maharishiConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(strConn);
        SqlCommand objCommand = new SqlCommand("UpdateInsertNNIPSWomen", objConnection);
        objCommand.CommandType = CommandType.StoredProcedure;
        objConnection.Open();

        objCommand.Parameters.AddWithValue("@Nnum", WomanNNIPSnum);
        objCommand.Parameters.AddWithValue("@HusbNum", HusNNIPSnum);

        objCommand.ExecuteNonQuery();
        objConnection.Close();
    }

    

}