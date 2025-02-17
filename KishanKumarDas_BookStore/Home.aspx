<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="KishanKumarDas_BookStore.Home" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="hero text-center py-5">
        <div class="container">
            <h1 class="display-4">Discover Your Next Great Read</h1>
            <p class="lead">Explore a wide collection of books across different genres.</p>
            <a class="button" href="Products">Shop Now</a>
        </div>
    </section>

    <section class="featured-books py-5 bg-light">
        <div class="container">
            <h2 class="mb-4">Featured Books</h2>
            <div class="book-container">
                <div class="card featured-book-card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-black">The Great Gatsby</h5>
                        <p class="card-text">A classic novel by F. Scott Fitzgerald.</p>
                        <p class="price mb-0">$12.99</p>
                    </div>
                </div>
                <div class="card featured-book-card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-black">Harry Potter</h5>
                        <p class="card-text px-3">The great magical journey begins.</p>
                        <p class="price mb-0">$15.99</p>
                    </div>
                </div>
                <div class="card featured-book-card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-black">Atomic Habits</h5>
                        <p class="card-text">Transform your life with small habits.</p>
                        <p class="price mb-0">$18.99</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bestsellers py-5">
        <div class="container">
            <h2 class="mb-4">Our Bestsellers</h2>
            <div class="book-container">
                <div class="card bestsellers-book-card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-black">The Alchemist</h5>
                        <p class="card-text">A journey of dreams by Paulo Coelho.</p>
                        <span class="price">$14.99</span>
                    </div>
                </div>

                <div class="card bestsellers-book-card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-black">1984</h5>
                        <p class="card-text">Dystopian classic by George Orwell.</p>
                        <span class="price">$10.99</span>
                    </div>
                </div>

                <div class="card bestsellers-book-card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold text-black">The Subtle Art</h5>
                        <p class="card-text">A fresh approach to life by Mark Manson.</p>
                        <span class="price">$16.99</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="about">
        <h2>About Our Bookstore</h2>
        <p>At My BookStore, we are passionate about books and strive to provide the best collection of novels, non-fiction, and educational books.</p>
    </section>

    <section class="reviews">
        <h2>What Our Customers Say</h2>
        <div class="review-container">
            <div class="card review-card">
                <div class="card-body">
                    <p>"Amazing collection of books! Highly recommend this store!"</p>
                    <span>- Emily R.</span>
                </div>
            </div>

            <div class="card review-card">
                <div class="card-body">
                    <p>"Fast delivery and great service. Found rare books easily!"</p>
                    <span>- Michael D.</span>
                </div>
            </div>

            <div class="card review-card">
                <div class="card-body">
                    <p>"A book lover’s paradise! Best place to buy books online."</p>
                    <span>- Sarah K.</span>
                </div>
            </div>
        </div>
    </section>

    <section class="contact py-5 bg-light">
        <div class="container">
            <h2>Contact Us</h2>
            <p><strong>📍 Address:</strong> 123 Book Street, Cambridge, Ontario, Canada</p>
            <p><strong>📧 Email:</strong> support@mybookstore.com</p>
            <p><strong>📞 Phone:</strong> (123) 456-7890</p>
        </div>
    </section>
</asp:Content>