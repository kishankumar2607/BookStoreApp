# 📚 BookStore ASP.NET Web Application

This repository contains an ASP.NET Web Forms-based BookStore website created as a college assignment. It includes product browsing by genre, session-based cart functionality, user login/logout, and friendly navigation with a responsive UI.

> 🎓 Developed by **Kishan Kumar Das**

---

## ✨ Features

### 🛍️ Book Shopping

- Browse books by **genre** (Genre → Books dropdown)
- View:
  - Book name
  - Short & long descriptions
  - Unit price (from database)
- Quantity selection with `+` / `−` buttons
- Add to cart and dynamically calculate **total per item**
- **Cart page**:
  - List of added books
  - Total quantity
  - 13% tax calculation
  - Remove from cart
  - Proceed to checkout

### 👤 User Login

- Clean login form with:
  - First name
  - Last name
  - Email
  - Password
- Session-based authentication
- Dynamic header navigation:
  - Shows “Login” for guests
  - Shows “Welcome, [FirstName]” with “Logout” if logged in

### 🌐 Navigation & Design

- Master Page with **Bootstrap**-styled navigation bar
- Mobile-first responsive layout
- Clean **friendly URLs**

---

## 📁 Folder Structure

```
KishanKumarDas_BookStore/
├── App_Data/
├── Models/
│   ├── Product.cs
│   └── CartItem.cs
├── Content/
│   └── Site.css
├── Image/
│   └── logo.png
├── MasterPage.master
├── Products.aspx
├── Cart.aspx
├── Login.aspx
├── Home.aspx
├── Web.config
├── README.md
```

---

## 🧮 Price Logic

| Item                     | Logic                                      |
|--------------------------|--------------------------------------------|
| Per Book Total           | `UnitPrice * Quantity`                     |
| Cart Total (Before Tax)  | Sum of all book total prices               |
| Tax Rate                 | 13%                                        |
| Final Price (After Tax)  | `CartTotal * 1.13`                         |

---

## 🗄️ Database Schema

### 📘 Table: Genre

| Column Name | Data Type   |
|-------------|-------------|
| GenreId     | INT (PK)    |
| GenreName   | VARCHAR(25) |

### 📗 Table: Books

| Column Name      | Data Type     |
|------------------|---------------|
| BookId           | INT (PK)      |
| BookName         | VARCHAR(50)   |
| ShortDescription | VARCHAR(250)  |
| LongDescription  | VARCHAR(1000) |
| UnitPrice        | FLOAT         |
| GenreId          | INT (FK)      |

---

## 🛠️ Setup Instructions

### 🔧 Prerequisites

- Visual Studio 2022 or later
- .NET Framework 4.8
- SQL Server or SQL Express
- IIS Express or IIS for testing

### ⚙️ Configuration Steps

1. **Clone the Repository**

2. **Open in Visual Studio**  
   Open the `.sln` file in Visual Studio.

3. **Update your connection string in `Web.config`:**
   ```xml
   <connectionStrings>
     <add name="ConnectionString" 
          connectionString="Data Source=.;Initial Catalog=BookStoreDB;Integrated Security=True" 
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

4. **Create the Database and Tables**

```sql
CREATE TABLE Genre (
    GenreId INT PRIMARY KEY,
    GenreName VARCHAR(25)
);

CREATE TABLE Books (
    BookId INT PRIMARY KEY,
    BookName VARCHAR(50),
    ShortDescription VARCHAR(250),
    LongDescription VARCHAR(1000),
    UnitPrice FLOAT,
    GenreId INT FOREIGN KEY REFERENCES Genre(GenreId)
);
```

5. **Insert Sample Data**

```sql
INSERT INTO Genre VALUES (1, 'Fiction'), (2, 'Non-Fiction');

INSERT INTO Books VALUES 
(1, 'Book 1', 'Short desc 1', 'Long desc 1', 19.99, 1),
(2, 'Book 2', 'Short desc 2', 'Long desc 2', 25.50, 2);
```

6. **Run the App (`F5`)**  
   Visit `Home.aspx`, `Products.aspx`, `Cart.aspx`, and `Login.aspx`

---

## 🧪 Testing

- ✅ Add books to cart via dropdown filters
- ✅ Update quantity and validate total prices
- ✅ Log in to see dynamic header changes
- ✅ Remove book from cart and recalculate
- ✅ Check total price includes 13% tax

---

## 📬 Contact

- 📧 Email: [kishank2607@gmail.com](mailto:kishank2607@gmail.com)  
- 🌐 LinkedIn: [linkedin.com/in/kishankumardas](https://www.linkedin.com/in/kishan-kumar-das/)

---

## 🚧 Future Improvements

- Add Register page with password hashing
- Make cart persistent in database
- Add search/filter for books
- Admin panel for CRUD on books/genres
- Payment gateway integration (Stripe, PayPal)
