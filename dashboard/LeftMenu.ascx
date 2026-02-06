<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LeftMenu.ascx.cs" Inherits="dashboard_LeftMenu" %>

 <div class="sidebar-inner">
      <%--<div class="sidebar-header px-3 mb-2">
        <div class="searchbox">
          <i class="bi bi-search"></i>
          <input id="menuFilter" type="text" placeholder="Filter menu..." />
        </div>
      </div>--%>

      <nav>
        <ul class="sidebar-nav list-unstyled" id="menuList">
          <li class="nav-heading">Primary</li>
          <li class="nav-item"><a class="nav-link active" href="#" data-name="Dashboard"><i class="bi bi-speedometer2"></i><span>Dashboard</span></a></li>
            <li class="nav-item"><a class="nav-link" href="OH_WOMENLISTS.aspx" data-name="Weekly Visit Data"><i class="bi bi-calendar-week"></i><span>Women Lists</span></a></li>
          <%--<li class="nav-item"><a class="nav-link" href="#" data-name="Search"><i class="bi bi-search"></i><span>Search</span></a></li>--%>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Pregnancy Tracking Log"><i class="bi bi-person-heart"></i><span>Pregnancy Tracking Log</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Flow Chart"><i class="bi bi-diagram-3"></i><span>Flow Chart</span></a></li>
          <%--<li class="nav-item"><a class="nav-link" href="#" data-name="Sub-Study Data"><i class="bi bi-journal-medical"></i><span>Sub-Study Data</span></a></li>--%>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Adverse Event"><i class="bi bi-exclamation-triangle"></i><span>Adverse Event</span></a></li>
          <%--<li class="nav-item"><a class="nav-link" href="#" data-name="Schedule"><i class="bi bi-calendar-event"></i><span>Schedule</span><span class="badge bg-soft-info ms-auto">4</span></a></li>--%>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Data Log"><i class="bi bi-database"></i><span>Data Log</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Download"><i class="bi bi-download"></i><span>Export Data</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Weekly Visit Data"><i class="bi bi-calendar-week"></i><span>Monthly Visit Data</span></a></li>

          <%--<li class="nav-heading mt-3">Analysis</li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Data Analysis"><i class="bi bi-graph-up"></i><span>Data Analysis</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Pending Forms"><i class="bi bi-hourglass-split"></i><span>Pending Forms</span><span class="badge bg-soft-warning ms-auto">12</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Activity Timeline"><i class="bi bi-clock-history"></i><span>Activity Timeline</span></a></li>--%>

          <li class="nav-heading mt-3">Clinical</li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Oral Exam"><i class="bi bi-emoji-smile"></i><span>Oral Exam</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Blood Collection"><i class="bi bi-droplet-half"></i><span>Blood Collection</span></a></li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Stool Collection"><i class="bi bi-bezier"></i><span>Stool Collection</span></a></li>

          <%--<li class="nav-heading mt-3">Tools</li>
          <li class="nav-item"><a class="nav-link" href="#" data-name="Location Finder"><i class="bi bi-geo-alt"></i><span>Location Finder</span></a></li>--%>
        </ul>
      </nav>
    </div>