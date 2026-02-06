<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="dashboard_Index" %>
<%@ Register TagPrefix="HeaderController" TagName="HeaderRow" Src="Header.ascx" %>
<%@ Register TagPrefix="LeftMenuController" TagName="LeftMenuRow" Src="LeftMenu.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Oral Health Admin — Dashboard</title>
    <!-- Favicons -->
  <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/study_logo.png" />
  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="assets/style.css" rel="stylesheet" />  
</head>
<body>
    <form id="form1" runat="server">
        <div>
 
             <!-- Topbar -->  
        <HeaderController:HeaderRow ID="HeaderRow" runat="server" />
 
  <!-- Sidebar -->
  <aside class="sidebar" id="sidebar">
   <LeftMenuController:LeftMenuRow ID="LeftMenuRow" runat="server" /> 
  </aside>

  <!-- Main Content -->
  <main class="content">
    <div class="container-fluid py-4">

      <!-- Stat Cards -->
      <div class="row g-3">
        <div class="col-12 col-md-6 col-xl-3">
          <div class="card stat-card shadow-soft">
            <div class="stat-icon"><i class="bi bi-person-plus"></i></div>
            <div>
              <div class="stat-label">Pregnancy Enrollment</div>
              <div class="stat-value" id="statEnrollments">—</div>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-xl-3">
          <div class="card stat-card shadow-soft">
            <div class="stat-icon alt"><i class="bi bi-baby"></i></div>
            <div>
              <div class="stat-label">Birth Cases</div>
              <div class="stat-value" id="statBirths">—</div>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-xl-3">
          <div class="card stat-card shadow-soft">
            <div class="stat-icon"><i class="bi bi-emoji-smile"></i></div>
            <div>
              <div class="stat-label">Oral Cases</div>
              <div class="stat-value" id="statOral">—</div>
            </div>
          </div>
        </div>
        <div class="col-12 col-md-6 col-xl-3">
          <div class="card stat-card shadow-soft">
            <div class="stat-icon alt"><i class="bi bi-activity"></i></div>
            <div>
              <div class="stat-label">Ultrasound</div>
              <div class="stat-value" id="statUltrasound">—</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Trends -->
      <div class="row g-3 mt-1">
        <div class="col-12 col-lg-6">
          <div class="card p-3 shadow-soft">
            <h6 class="mb-3"><i class="bi bi-graph-up me-1"></i>Weekly Enrollment Trends</h6>
            <%--<canvas id="chartEnrollWeekly" height="160"></canvas>--%>
          </div>
        </div>
        <div class="col-12 col-lg-6">
          <div class="card p-3 shadow-soft">
            <h6 class="mb-3"><i class="bi bi-graph-up-arrow me-1"></i>Weekly Oral Assessment Trends</h6>
            <%--<canvas id="chartOralWeekly" height="160"></canvas>--%>
          </div>
        </div>
      </div>

      <!-- Distributions -->
      <div class="row g-3 mt-1">
        <div class="col-12 col-xl-6">
          <div class="card p-3 shadow-soft">
            <h6 class="mb-3"><i class="bi bi-bar-chart-line me-1"></i>Enrollment by Age Group</h6>
            <canvas id="chartAgeGroup" height="170"></canvas>
          </div>
        </div>
        <div class="col-12 col-xl-6">
          <div class="row g-3">
            <div class="col-12 col-md-6">
              <div class="card p-3 shadow-soft h-100">
                <h6 class="mb-3"><i class="bi bi-geo-alt me-1"></i>Place of Delivery</h6>
                <canvas id="chartPlaceDelivery" height="160"></canvas>
              </div>
            </div>
            <div class="col-12 col-md-6">
              <div class="card p-3 shadow-soft h-100">
                <h6 class="mb-3"><i class="bi bi-person-check me-1"></i>Delivery Type</h6>
                <canvas id="chartDeliveryType" height="160"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </main>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
  <script src="assets/app.js"></script>
  <script src="assets/dashboard.js"></script>

        </div>
    </form>
</body>
</html>
