<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="baitaplon.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>contact</title>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
         <div class="header">
        <div class="header__top">
            <div class="header__social"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i
                        class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a href="#"><i
                        class="fab fa-linkedin-in"></i></a><a href="#"><i class="fab fa-youtube"></i></a></div>
            <div class="header__logo"><img src="assets/image/h-logo.png" alt="logo"/></div>
            <div class="header__actions"><a href="#"><i class="fa-regular fa-heart"></i>
                    <p>Wishlist</p>
                </a><a href="#"><i class="fa-solid fa-cart-shopping"></i>
                    <p>Cart</p>
                </a><a href="#"><i class="fa-regular fa-user header__avatar"></i>
                    <p class="header__name">Account</p>
                </a></div>
            <div class="header__iconmenu"><i class="fa-solid fa-bars"></i></div>
        </div>
        <div class="header__between">
            <div class="header__search" action="#"><input type="text" placeholder="Search..."/><i
                    class="fa-solid fa-magnifying-glass"></i> </div>
        </div>
        <div class="header__bottom">
            <ul class="header__menu">
                <li class="header__menu--home"> <a href="index.aspx">Home </a></li>
                <li class="header__menu--product">Products<div class="products">
                        <div class="products__container">
                            <div class="products__content">
                                <ul class="products__item">
                                    <li><a href="couchproduct.aspx">Couch</a></li>
                                    <li>Armchair</li>
                                    <li>Chair</li>
                                    <li>Ottoman</li>
                                    <li><img src="assets/image/product-1.png" alt=""/></li>
                                </ul>
                                <ul class="products__item">
                                    <li>Coffee Table</li>
                                    <li>Dining Table</li>
                                    <li>Work Table</li>
                                    <li>Conference Table</li>
                                    <li><img src="assets/image/product-2.png" alt=""/></li>
                                </ul>
                                <ul class="products__item">
                                    <li>Regular</li>
                                    <li>Bunk Bed</li>
                                    <li>Trundle</li>
                                    <li>Four-Poster</li>
                                    <li><img src="assets/image/product-3.png" alt=""/></li>
                                </ul>
                                <ul class="products__item">
                                    <li>Table Lamp</li>
                                    <li>Desk Lamp</li>
                                    <li>Floor Lamp</li>
                                    <li>Ceiling Lighting</li>
                                    <li><img src="assets/image/product-4.png" alt=""/></li>
                                </ul>
                                <ul class="products__item">
                                    <li>Carpet</li>
                                    <li>Pillow</li>
                                    <li>Trees</li>
                                    <li>Mirror</li>
                                    <li><img src="assets/image/product-5.png" alt=""/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="header__menu--room">Rooms </li>
                <li class="header__menu--collection">Collection<div class="collection">
                        <div class="collection__container">
                            <div class="collection__content">
                                <ul class="collection__list">
                                    <li><a href="holidaycollection.aspx">Holidays</a></li>
                                    <li>Minimalism</li>
                                    <li>Modern</li>
                                    <li>Wooden</li>
                                    <li>View all <i class="fa-solid fa-chevron-right"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="header__menu--about"> <a href="about.aspx"> About </a></li>
                <li class="header__menu--contact"><a href="contact.aspx"> Contact </a> </li>
            </ul>
        </div>
    </div>
    <div class="notification">
        <p>Get 20% OFF on your first order. Subscribe to our newsletter and get your coupon! <strong> Subscribe
            </strong><i class="fa-solid fa-arrow-right"></i> </p>
    </div>
    <div class="section17">
        <div class="section17__container">
            <div class="section17__image">
                <img src="assets/image/sec17-bg.png" alt=""/>
            </div>
            <div class="section17__contact">
                <div class="section17__title">
                    <h2>Get in touch today</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit tortor eu dolorol egestas morbi sem
                        vulputate etiam facilisis pellentesque ut quis.</p>
                </div>
                <div class="section17__input">
                    <div class="section17__item">
                        <div class="section17__name">Name</div>
                        <input type="text" name="" id="" placeholder="John Carter"/>
                    </div>
                    <div class="section17__item">
                        <div class="section17__name">Email</div>
                        <input type="email" name="" id="" placeholder="example@email.com"/>
                    </div>
                </div>
                <div class="section17__input">
                    <div class="section17__item">
                        <div class="section17__name">Phone</div>
                        <input type="tel" name="" id="" placeholder="(123) 456 - 789"/>
                    </div>
                    <div class="section17__item">
                        <div class="section17__name">Company</div>
                        <input type="text" name="" id="" placeholder="Facebook"/>
                    </div>
                </div>
                <div class="section17__describe">
                    <div class="section17__name">Leave us a message</div>
                    <textarea name="" id=""></textarea>
                </div>
                <div class="section17__button"><button>send messenger</button></div>

            </div>
        </div>
    </div>
    <div class="section11">
        <div class="section11__container">
            <div class="section11__left">
                <h2 class="section11__title">Contact us</h2>
                <p class="section11__describe">Prototypes may also be exempted from some requirements that will apply to
                    the final product</p>
                <ul class="section11__contact">
                    <li> <i class="fa-solid fa-envelope"></i>contact@company.com</li>
                    <li> <i class="fa-solid fa-phone"></i>(123) 456 - 789</li>
                    <li> <i class="fa-solid fa-location-dot"></i>794 Mcallister St San Francisco, 94102</li>
                </ul>
            </div>
            <div class="section11__right"><img src="assets/image/sec11-map.png" alt=""/></div>
        </div>
    </div>
    <script src="assets/js/signin.js"></script>
    <div class="footer">
        <div class="footer__container">
            <div class="footer__top">
                <div class="footer__left">
                    <div class="footer__info">
                        <h2 class="footer__title">Company name</h2>
                        <p class="footer__describe">Lorem ipsum dolor sit amet consectetur dolol drakgonil adipiscing
                            elit aliquam mauris</p>
                        <div class="footer__submit" action="#"><input type="email" placeholder="Enter your email"/><br/>
                            <div><button>Suscribe </button></div>
                        </div>
                    </div>
                    <div class="footer__menu">
                        <h3>menu </h3>
                        <ul>
                            <li>Home</li>
                            <li>Pricing</li>
                            <li>Case studies</li>
                            <li>Features</li>
                            <li>Downloads</li>
                            <li>Updates</li>
                            <li>Changelog</li>
                        </ul>
                    </div>
                </div>
                <div class="footer__right">
                    <div class="footer__company">
                        <h3>Company </h3>
                        <ul>
                            <li>About</li>
                            <li>Contact us</li>
                            <li>Careers</li>
                            <li>Culture</li>
                            <li>Help Center</li>
                            <li>Support</li>
                            <li>Legal</li>
                        </ul>
                    </div>
                    <div class="footer__image">
                        <h3>Follow on Instagram</h3>
                        <div class="footer__image--list"><img src="assets/image/footer-img1.png" alt=""/><img
                                src="assets/image/footer-img2.png" alt=""/><img src="assets/image/footer-img3.png"
                                alt=""/><img src="assets/image/footer-img4.png" alt=""/></div>
                    </div>
                </div>
            </div>
            <div class="footer__bottom">
                <div class="footer__law">Copyright © 2023 BRIX Templates | All Rights Reserved</div>
                <div class="footer__social"><a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i
                            class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a
                        href="#"><i class="fab fa-linkedin-in"></i></a></div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
