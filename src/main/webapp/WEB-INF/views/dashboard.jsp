<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Site Survey Tool</title>
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
            transition: all 0.3s;
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

        .nav-item {
            padding: 2px 15px;
        }

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
            transition: all 0.3s;
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

        .content-body {
            padding: 40px;
        }

        /* Dashboard Cards */
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            border: none;
            box-shadow: 0 2px 10px rgba(0,0,0,0.03);
            transition: transform 0.2s, box-shadow 0.2s;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        .icon-blue { background: rgba(13, 110, 253, 0.1); color: #0d6efd; }
        .icon-purple { background: rgba(139, 92, 246, 0.1); color: #8b5cf6; }
        .icon-orange { background: rgba(249, 115, 22, 0.1); color: #f97316; }

        .btn-logout {
            color: #ef4444;
            border: 1px solid #fee2e2;
            background: #fef2f2;
            border-radius: 8px;
            padding: 6px 15px;
            font-size: 0.9rem;
            transition: all 0.2s;
        }

        .btn-logout:hover {
            background: #ef4444;
            color: white;
        }

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
                <a href="<c:url value='/dashboard'/>" class="nav-link active">
                    <i class="fas fa-chart-pie"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/property'/>" class="nav-link">
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
                <h4 class="mb-0 fw-bold text-dark">Dashboard</h4>
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
            <div class="row mb-4">
                <div class="col-12">
                    <h2 class="fw-bold">Welcome Back!</h2>
                    <p class="text-secondary">Here's what's happening with your site surveys today.</p>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-4">
                    <div class="stat-card">
                        <div>
                            <div class="stat-icon icon-blue">
                                <i class="fas fa-building"></i>
                            </div>
                            <h4 class="fw-bold mb-1">Properties</h4>
                            <p class="text-muted small mb-3">Manage all survey locations</p>
                        </div>
                        <a href="<c:url value='/property'/>" class="btn btn-primary w-100 rounded-pill">View All</a>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="stat-card">
                        <div>
                            <div class="stat-icon icon-purple">
                                <i class="fas fa-layer-group"></i>
                            </div>
                            <h4 class="fw-bold mb-1">Floor Plans</h4>
                            <p class="text-muted small mb-3">Upload and analyze layouts</p>
                        </div>
                        <a href="<c:url value='/floor'/>" class="btn btn-outline-primary w-100 rounded-pill" style="border-color: #8b5cf6; color: #8b5cf6;">Manage Floors</a>
                    </div>
                </div>

                <sec:authorize access="hasRole('ADMIN')">
                <div class="col-md-4">
                    <div class="stat-card">
                        <div>
                            <div class="stat-icon icon-orange">
                                <i class="fas fa-user-shield"></i>
                            </div>
                            <h4 class="fw-bold mb-1">Admin Panel</h4>
                            <p class="text-muted small mb-3">System & User Controls</p>
                        </div>
                        <button class="btn btn-outline-warning w-100 rounded-pill">Settings</button>
                    </div>
                </div>
                </sec:authorize>
            </div>

            <!-- Recent Activity Placeholder -->
            <div class="row mt-5">
                <div class="col-12">
                    <div class="bg-white rounded-4 p-4 shadow-sm border-0">
                        <h5 class="fw-bold mb-4">Quick Actions</h5>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="<c:url value='/property'/>" class="btn btn-light rounded-3 px-4 py-3 text-start flex-grow-1" style="border: 1px dashed #dee2e6;">
                                <i class="fas fa-plus-circle text-primary mb-2 d-block fs-4"></i>
                                <span class="fw-bold d-block">Add New Property</span>
                                <span class="text-muted small">Register a new site for survey</span>
                            </a>
                            <a href="<c:url value='/floor'/>" class="btn btn-light rounded-3 px-4 py-3 text-start flex-grow-1" style="border: 1px dashed #dee2e6;">
                                <i class="fas fa-upload text-success mb-2 d-block fs-4"></i>
                                <span class="fw-bold d-block">Upload Floor Plan</span>
                                <span class="text-muted small">Import a new layout image</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
