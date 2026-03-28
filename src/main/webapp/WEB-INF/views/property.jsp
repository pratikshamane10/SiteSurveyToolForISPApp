<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Properties - ISP Survey Tool</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #0d6efd;
            --sidebar-width: 260px;
            --top-bar-height: 70px;
            --sidebar-bg: #1e293b;
            --content-bg: #f8fafc;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--content-bg);
            margin: 0;
            overflow-x: hidden;
        }

        /* Sidebar Styling */
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background-color: var(--sidebar-bg);
            color: white;
            z-index: 1000;
        }

        .sidebar-brand {
            height: var(--top-bar-height);
            display: flex;
            align-items: center;
            padding: 0 25px;
            font-weight: 700;
            font-size: 1.25rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-brand i {
            color: var(--primary-color);
            margin-right: 12px;
        }

        .nav-list {
            padding: 20px 0;
            list-style: none;
            margin: 0;
        }

        .nav-item { padding: 2px 15px; }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: rgba(255,255,255,0.7);
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.2s;
        }

        .nav-link:hover, .nav-link.active {
            color: white;
            background-color: rgba(255,255,255,0.1);
        }

        .nav-link i {
            width: 24px;
            margin-right: 12px;
            font-size: 1.1rem;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: var(--sidebar-width);
            min-height: 100vh;
        }

        .top-bar {
            height: var(--top-bar-height);
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 900;
        }

        .content-body { padding: 40px; }

        /* Table Styling */
        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.03);
        }

        .table thead th {
            background-color: #f8fafc;
            border-top: none;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.5px;
            color: #64748b;
            padding: 15px;
        }

        .table tbody td {
            padding: 15px;
            vertical-align: middle;
            color: #334155;
            border-bottom: 1px solid #f1f5f9;
        }

        .badge-property {
            padding: 6px 12px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.8rem;
        }

        .badge-residential { background: rgba(34, 197, 94, 0.1); color: #16a34a; }
        .badge-commercial { background: rgba(59, 130, 246, 0.1); color: #2563eb; }

        .btn-action {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            border: 1px solid #e2e8f0;
            background: white;
            color: #64748b;
        }

        .btn-action:hover {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .btn-logout {
            color: #ef4444;
            border: 1px solid #fee2e2;
            background: #fef2f2;
            border-radius: 8px;
            padding: 6px 15px;
            font-size: 0.9rem;
        }

        .btn-logout:hover {
            background: #ef4444;
            color: white;
        }

        /* Modal Customization */
        .modal-content { border-radius: 16px; border: none; }
        .modal-header { border-bottom: 1px solid #f1f5f9; padding: 20px 30px; }
        .modal-body { padding: 30px; }
        .form-label { font-weight: 500; color: #475569; }
        .form-control, .form-select { border-radius: 8px; padding: 10px 15px; }

        @media (max-width: 991.98px) {
            .sidebar { left: -var(--sidebar-width); }
            .main-content { margin-left: 0; }
            .sidebar.show { left: 0; }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-brand">
            <i class="fas fa-tower-broadcast"></i>
            <span>ISP Survey Tool</span>
        </div>
        <ul class="nav-list">
            <li class="nav-item">
                <a href="<c:url value='/dashboard'/>" class="nav-link">
                    <i class="fas fa-chart-pie"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/property'/>" class="nav-link active">
                    <i class="fas fa-building"></i>
                    <span>Properties</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/floor'/>" class="nav-link">
                    <i class="fas fa-layer-group"></i>
                    <span>Floor Plans</span>
                </a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="d-flex align-items-center">
                <button class="btn d-lg-none me-3" onclick="document.getElementById('sidebar').classList.toggle('show')">
                    <i class="fas fa-bars"></i>
                </button>
                <h4 class="mb-0 fw-bold text-dark">Properties</h4>
            </div>
            <div class="d-flex align-items-center">
                <div class="me-4 d-none d-md-block">
                    <span class="text-muted small">Welcome,</span>
                    <span class="fw-semibold ms-1"><sec:authentication property="principal.username"/></span>
                </div>
                <form action="<c:url value='/logout'/>" method="post" class="m-0">
                    <button type="submit" class="btn-logout">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </button>
                </form>
            </div>
        </div>

        <!-- Content Body -->
        <div class="content-body">
            <div class="row align-items-center mb-4">
                <div class="col-md-6">
                    <h2 class="fw-bold mb-1">Property Directory</h2>
                    <p class="text-secondary">Manage and organize all survey site locations.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <button class="btn btn-primary rounded-pill px-4 py-2" data-bs-toggle="modal" data-bs-target="#addPropertyModal">
                        <i class="fas fa-plus me-2"></i>Add New Property
                    </button>
                </div>
            </div>

            <!-- Table Container -->
            <div class="table-container shadow-sm border-0">
                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead>
                            <tr>
                                <th class="ps-4"># ID</th>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Type</th>
                                <th class="text-end pe-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="prop" items="${properties}">
                                <tr>
                                    <td class="ps-4"><span class="badge bg-light text-dark border">#${prop.id}</span></td>
                                    <td>
                                        <div class="fw-bold text-dark">${prop.name}</div>
                                    </td>
                                    <td>
                                        <div class="text-secondary small">
                                            <i class="fas fa-map-marker-alt text-danger me-1"></i>${prop.location}
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge badge-property ${prop.type == 'RESIDENTIAL' ? 'badge-residential' : 'badge-commercial'}">
                                            ${prop.type}
                                        </span>
                                    </td>
                                    <td class="text-end pe-4">
                                        <a href="<c:url value='/floor?propertyId=${prop.id}'/>" class="btn btn-action" title="View Floors">
                                            <i class="fas fa-layer-group"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty properties}">
                                <tr>
                                    <td colspan="5" class="text-center py-5">
                                        <div class="text-muted">
                                            <i class="fas fa-folder-open fs-1 d-block mb-3 opacity-25"></i>
                                            No properties found.
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Property Modal -->
    <div class="modal fade" id="addPropertyModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content shadow-lg border-0">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold">New Property</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="<c:url value='/property'/>" method="post">
                        <div class="mb-4">
                            <label class="form-label">Property Name</label>
                            <input type="text" name="name" class="form-control" placeholder="e.g. Skyline Towers" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Location Address</label>
                            <input type="text" name="location" class="form-control" placeholder="123 Street Name, City" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Property Type</label>
                            <select name="type" class="form-select" required>
                                <option value="RESIDENTIAL">Residential</option>
                                <option value="COMMERCIAL">Commercial</option>
                            </select>
                        </div>
                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary w-100 py-2 rounded-pill fw-bold">Save Property</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
