<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="holidaycollection.aspx.cs" Inherits="baitaplon.WebForm7" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Couch</title>
        <link rel="stylesheet" href="assets/css/style.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="header">
                <div class="header__top">
                    <div class="header__social">
                        <a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i
                                class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a
                            href="#"><i class="fab fa-linkedin-in"></i></a><a href="#"><i
                                class="fab fa-youtube"></i></a>
                    </div>
                    <div class="header__logo">
                        <img src="assets/image/h-logo.png" alt="logo" />
                    </div>
                    <div class="header__actions">
                        <a href="#"><i class="fa-regular fa-heart"></i>
                            <p>Wishlist</p>
                        </a><a href="giohang.aspx"><i class="fa-solid fa-cart-shopping"></i>
                            <p>Cart</p>
                        </a><a href="#"><i class="fa-regular fa-user header__avatar"></i>
                            <p class="header__name">Account</p>
                        </a>
                    </div>
                    <div class="header__iconmenu"><i class="fa-solid fa-bars"></i></div>
                </div>
                <div class="header__between">
                    <div class="header__search" action="#">
                        <input type="text" placeholder="Search..." /><i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                </div>
                <div class="header__bottom">
                    <ul class="header__menu">
                        <li class="header__menu--home"><a href="index.aspx">Home </a></li>
                        <li class="header__menu--product">Products<div class="products">
                                <div class="products__container">
                                    <div class="products__content">
                                        <ul class="products__item">
                                            <li><a href="couchproduct.aspx">Couch</a></li>
                                            <li>Armchair</li>
                                            <li>Chair</li>
                                            <li>Ottoman</li>
                                            <li>
                                                <img src="assets/image/product-1.png" alt="" />
                                            </li>
                                        </ul>
                                        <ul class="products__item">
                                            <li>Coffee Table</li>
                                            <li>Dining Table</li>
                                            <li>Work Table</li>
                                            <li>Conference Table</li>
                                            <li>
                                                <img src="assets/image/product-2.png" alt="" />
                                            </li>
                                        </ul>
                                        <ul class="products__item">
                                            <li>Regular</li>
                                            <li>Bunk Bed</li>
                                            <li>Trundle</li>
                                            <li>Four-Poster</li>
                                            <li>
                                                <img src="assets/image/product-3.png" alt="" />
                                            </li>
                                        </ul>
                                        <ul class="products__item">
                                            <li>Table Lamp </li>
                                            <li>Desk Lamp</li>
                                            <li>Floor Lamp</li>
                                            <li>Ceiling Lighting</li>
                                            <li>
                                                <img src="assets/image/product-4.png" alt="" />
                                            </li>
                                        </ul>
                                        <ul class="products__item">
                                            <li>Carpet</li>
                                            <li>Pillow</li>
                                            <li>Trees</li>
                                            <li>Mirror</li>
                                            <li>
                                                <img src="assets/image/product-5.png" alt="" />
                                            </li>
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
                        <li class="header__menu--about"><a href="about.aspx">About </a></li>
                        <li class="header__menu--contact"><a href="contact.aspx">Contact </a></li>
                    </ul>
                </div>
            </div>
            <div class="notification">
                <p>
                    Get 20% OFF on your first order. Subscribe to our newsletter and get your coupon! <strong>Subscribe
                    </strong><i class="fa-solid fa-arrow-right"></i>
                </p>
            </div>
            <div class="section22">
                <div class="section22__left">
                    <img src="assets/image/sec22-bg1.png" />
                </div>
                <div class="section22__right">
                    <div class="section22__banner">Collection <i class="fa-solid fa-angle-right"></i>Holidays</div>
                    <div class="section22__title">
                        <p>Layer every room with joyful holiday style, from new collectibles to all
                            the festive trimmings.</p>
                    </div>
                </div>
            </div>
            <div class="title6">
                <div><i class="fa-solid fa-truck"></i> DELIVERY IN 2 WEEKS</div>
            </div>
            <div class="section20">
                <div class="section20__container">
                    <div class="section20__item">
                        <img src="assets/image/sec23-1.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-2.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-3.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-4.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-5.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-6.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-7.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-8.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-9.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-10.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-11.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-12.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-13.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-14.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                    <div class="section20__item">
                        <img src="assets/image/sec23-5.jpg" alt="" />
                        <div class="section20__info">
                            <div class="section20__name">Gather Couch</div>
                            <div class="section20__price">$1,519.00 - $2,349.00</div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="section21">
                <div class="section21__title">
                    <h1>More To Explore</h1>
                    <p></p>
                </div>
                <div class="section21__products">
                    <div class="section21__item">
                        <img src="assets/image/sec8-1.jpg" alt="" />
                        <h2>Kids lighting <i class="fa-solid fa-angle-right"></i></h2>
                    </div>
                    <div class="section21__item">
                        <img src="assets/image/sec8-2.jpg" alt="" />
                        <h2>Woven decor <i class="fa-solid fa-angle-right"></i></h2>
                    </div>
                    <div class="section21__item">
                        <img src="assets/image/sec8-3.jpg" alt="" />
                        <h2>Xmas decor <i class="fa-solid fa-angle-right"></i></h2>
                    </div>
                    <div class="section21__item">
                        <img src="assets/image/sec8-4.jpg" alt="" />
                        <h2>Halloween decor <i class="fa-solid fa-angle-right"></i></h2>
                    </div>


                </div>
            </div>

            <div class="footer">
                <div class="footer__container">
                    <div class="footer__top">
                        <div class="footer__left">
                            <div class="footer__info">
                                <h2 class="footer__title">Company name</h2>
                                <p class="footer__describe">
                                    Lorem ipsum dolor sit amet consectetur dolol drakgonil adipiscing
                                    elit aliquam mauris
                                </p>
                                <div class="footer__submit" action="#">
                                    <input type="email" placeholder="Enter your email" /><br />
                                    <div>
                                        <button>Suscribe </button>
                                    </div>
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
                                <div class="footer__image--list">
                                    <img src="assets/image/footer-img1.png" alt="" /><img
                                        src="assets/image/footer-img2.png" alt="" /><img
                                        src="assets/image/footer-img3.png" alt="" /><img
                                        src="assets/image/footer-img4.png" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer__bottom">
                        <div class="footer__law">Copyright © 2023 BRIX Templates | All Rights Reserved</div>
                        <div class="footer__social">
                            <a href="#"><i class="fab fa-facebook-f"></i></a><a href="#"><i
                                    class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a><a
                                href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

    </html>