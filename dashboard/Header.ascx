<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="dashboard_Header" %>

<header class="topbar d-flex align-items-center justify-content-between px-3">
    <div class="d-flex align-items-center gap-2">
      <button class="btn btn-link p-0 d-lg-none" id="sidebarToggle" aria-label="Toggle sidebar">
        <i class="bi bi-list fs-3"></i>
      </button>
      <div class="brand d-flex align-items-center gap-2">
        
          <a href="default.apsx">
          <img src="../assets/images/study_logo.png" height="60" alt="Oral Health Menu Panel"></a>
        <strong>Oral Health Admin</strong>

        <span class="brand-sub text-secondary d-none d-md-inline">/ Dashboard</span>
      </div>
    </div>
    <div class="d-flex align-items-center gap-2">
      <%--<div class="input-group input-group-sm top-search d-none d-md-flex">
        <span class="input-group-text bg-transparent border-0 ps-0"><i class="bi bi-search"></i></span>
        <input id="globalSearch" type="search" class="form-control border-0" placeholder="Search menu or content..." />
      </div>--%>
      <button class="btn btn-light btn-sm rounded-pill shadow-sm"><i class="bi bi-bell"></i></button>
      <img class="avatar" src="assets/avatar.svg" alt="User" />
    </div>
  </header>