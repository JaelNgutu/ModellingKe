﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class AdminDetails
{
    public int adminId { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
}

public partial class Events
{
    public int eventID { get; set; }
    public string image { get; set; }
    public string description { get; set; }
}

public partial class portfolio
{
    public int portfolioID { get; set; }
    public Nullable<int> userID { get; set; }
    public string image { get; set; }
    public string description { get; set; }

    public virtual userInfo userInfo { get; set; }
}

public partial class userInfo
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public userInfo()
    {
        this.portfolio = new HashSet<portfolio>();
    }

    public int userID { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string phoneNumber { get; set; }
    public string email { get; set; }
    public string age { get; set; }
    public string gender { get; set; }
    public string activationLink { get; set; }
    public string status { get; set; }
    public string password { get; set; }
    public string photo1 { get; set; }
    public string photo2 { get; set; }
    public string photo3 { get; set; }
    public string photo4 { get; set; }
    public string bio { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<portfolio> portfolio { get; set; }
}

public partial class videos
{
    public int Id { get; set; }
    public string video { get; set; }
    public string watch { get; set; }
}

public partial class Login_Admin_Sp_Result
{
    public int adminId { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
}

public partial class Login_Check_Sp_Result
{
    public int userID { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string phoneNumber { get; set; }
    public string email { get; set; }
    public string age { get; set; }
    public string gender { get; set; }
    public string activationLink { get; set; }
    public string status { get; set; }
    public string password { get; set; }
    public string photo1 { get; set; }
    public string photo2 { get; set; }
    public string photo3 { get; set; }
    public string photo4 { get; set; }
    public string bio { get; set; }
}

public partial class userID_Check_Result
{
    public int userID { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string phoneNumber { get; set; }
    public string email { get; set; }
    public string age { get; set; }
    public string gender { get; set; }
    public string activationLink { get; set; }
    public string status { get; set; }
    public string password { get; set; }
    public string photo1 { get; set; }
    public string photo2 { get; set; }
    public string photo3 { get; set; }
    public string photo4 { get; set; }
    public string bio { get; set; }
}

public partial class userID_Check_Sp_Result
{
    public int userID { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string phoneNumber { get; set; }
    public string email { get; set; }
    public string age { get; set; }
    public string gender { get; set; }
    public string activationLink { get; set; }
    public string status { get; set; }
    public string password { get; set; }
    public string photo1 { get; set; }
    public string photo2 { get; set; }
    public string photo3 { get; set; }
    public string photo4 { get; set; }
    public string bio { get; set; }
}
