# Site Survey Tool for ISP 📡

A modern, production-ready web application designed for Internet Service Providers (ISPs) to manage site surveys, property details, and floor plan coverage analysis.

## Features ✨

*   **Authentication & Security**: Role-based access control (Admin/User) powered by Spring Security.
*   **Modern UI/UX**: Premium, responsive interfaces designed with Bootstrap 5 and custom CSS (Glassmorphism, animations).
*   **Dashboard Overview**: Quick access to statistics and recent activity for efficient management.
*   **Property Management**: Easily register and directory search for ISP survey locations.
*   **Floor Plan Analysis**: Upload and manage floor layouts for mapping signal coverage.

## Tech Stack 🛠️

**Backend:**
*   **Java 17+**
*   **Spring Boot 3.4.1**
*   Spring MVC, Spring Data JPA, Spring Security

**Frontend:**
*   **JSP (JavaServer Pages)**
*   **JSTL & Spring Security Taglibs**
*   HTML5, Vanilla CSS, Bootstrap 5.3
*   FontAwesome Icons

**Database:**
*   **MySQL 8+** (Hibernate ORM)

## Getting Started 🚀

### Prerequisites
*   [Java Development Kit (JDK) 17](https://adoptium.net/) or higher
*   [MySQL Server](https://dev.mysql.com/downloads/mysql/)
*   Maven

### Local Setup

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/pratikshamane10/SiteSurveyToolForISPApp.git
    cd SiteSurveyToolForISPApp
    ```

2.  **Database Configuration**
    Open `src/main/resources/application.properties` and update the database credentials to match your local MySQL setup:
    ```properties
    spring.datasource.url=jdbc:mysql://localhost:3306/isp_survey_db?createDatabaseIfNotExist=true
    spring.datasource.username=root
    spring.datasource.password=YourSecurePassword
    ```

3.  **Build and Run**
    Use the Maven wrapper to build and run the application:
    ```bash
    ./mvnw spring-boot:run
    ```

4.  **Access the Application**
    Open your web browser and navigate to:
    **http://localhost:9091/login**

## Screenshots 📸

*(Add screenshots of your modernized Login, Dashboard, and Property pages here by uploading them to your GitHub repository and linking them in this section).*

## License 📄
This project is open-source and available under the MIT License.