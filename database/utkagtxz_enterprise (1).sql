-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 12, 2025 at 01:40 AM
-- Server version: 10.6.20-MariaDB-cll-lve-log
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utkagtxz_enterprise`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Utkal Enterprises', '9845219237', 1, 'def.png', 'support@utkalenterprises.net', NULL, '$2y$10$mDpopTm877gTxJn96wLlguTLdjWEubeQcHIE3H80UIzjydhiDuQaq', 'aBy6AVPw6wqXz9BpEz4mPFktjhneOwCYER8xejDZKFuQVeChBlGufdDfk2lT', '2023-05-29 16:53:15', '2023-05-29 16:53:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 1550, 0, NULL, '2023-06-05 20:19:15', 0.00, 500.00, 0.00, 0.00),
(2, 1, 0, 0, '2023-05-29 16:53:15', '2023-05-29 16:53:15', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'LED LIGHT RED', '2023-06-03 14:37:52', '2023-06-05 16:56:48'),
(2, 'LED LIGHT BLUE', '2023-06-05 16:57:09', '2023-06-05 16:57:09'),
(3, 'LED LIGHT GREEN', '2023-06-05 16:57:22', '2023-06-05 16:57:22'),
(4, 'SEAT COVER BLACK', '2023-06-05 17:09:50', '2023-06-05 17:09:50'),
(5, 'SEAT COVER BROWN', '2023-06-05 17:11:11', '2023-06-05 17:11:11'),
(6, 'SEAT COVER OFFWHITE', '2023-06-05 17:11:41', '2023-06-05 17:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(1, '2023-05-30-64758f0c287d9.png', 'Main Banner', 1, '2023-05-30 15:22:12', '2023-05-30 15:22:39', 'https://utkalenterprises.net/', 'product', NULL),
(2, '2023-05-30-647595eaa2c3f.png', 'Main Banner', 1, '2023-05-30 15:51:30', '2023-05-30 15:52:10', 'https://utkalenterprises.net/', 'product', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tata Motors', '2023-05-29-647480bb12ffd.png', 1, '2023-05-29 20:08:51', '2023-05-29 20:08:51'),
(2, 'TOYOTA', '2023-05-29-6474811af3e69.png', 1, '2023-05-29 20:10:27', '2023-05-29 20:10:27'),
(3, 'Tesla', '2023-05-29-6474814703af3.png', 1, '2023-05-29 20:11:11', '2023-05-29 20:11:11'),
(4, 'Honda', '2023-05-29-6474816e0e1e0.png', 1, '2023-05-29 20:11:50', '2023-05-29 20:11:50'),
(5, 'Mercedes-Benz', '2023-05-29-647481a0a73af.png', 1, '2023-05-29 20:12:40', '2023-05-29 20:12:40'),
(6, 'Jeep', '2023-05-29-647481ce7695c.png', 1, '2023-05-29 20:13:26', '2023-05-29 20:13:26'),
(7, 'Kia', '2023-05-29-647481f0c74b7.png', 1, '2023-05-29 20:14:00', '2023-05-29 20:14:00'),
(8, 'Maruti Suzuki', '2023-05-29-6474821e448b2.png', 1, '2023-05-29 20:14:46', '2023-05-29 20:14:46'),
(9, 'Audi', '2023-05-29-64748249cbba9.png', 1, '2023-05-29 20:15:29', '2023-05-29 20:15:29'),
(10, 'Renault', '2023-05-29-6474827c08804.png', 1, '2023-05-29 20:16:20', '2023-05-29 20:16:20'),
(11, 'Higer Bus', '2023-05-29-647482ab29ac6.png', 1, '2023-05-29 20:17:07', '2023-05-29 20:17:07'),
(12, 'Volvo Buses', '2023-05-29-647482c32cd85.png', 1, '2023-05-29 20:17:31', '2023-05-29 20:17:31'),
(13, 'Scania', '2023-05-29-6474830b862f5.png', 1, '2023-05-29 20:18:43', '2023-05-29 20:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '3', '2020-10-11 07:43:44', '2023-05-29 16:59:57'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-06-10 21:16:25'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2023-01-10 05:51:56'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2023-01-10 05:51:56'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '9845219237', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Utkal Enterprises', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2023-06-14-64895e2e7dcce.png', NULL, '2023-06-14 15:59:02'),
(13, 'company_mobile_logo', '2023-06-14-64895e2e7ef34.png', NULL, '2023-06-14 15:59:02'),
(14, 'terms_condition', '<ol>\r\n	<li>\r\n	<p>General Terms:</p>\r\n\r\n	<ul>\r\n		<li>Clarify that by using Utkal Enterprise&#39;s website or purchasing products from us, customers agree to be bound by these terms and conditions.</li>\r\n		<li>Specify that these terms and conditions may be updated or modified by Utkal Enterprise without prior notice.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Product Information and Compatibility:</p>\r\n\r\n	<ul>\r\n		<li>Emphasize that it is the customer&#39;s responsibility to ensure the compatibility of the parts with their specific vehicle make, model, and year.</li>\r\n		<li>Clarify that Utkal Enterprise provides product information to the best of its knowledge and abilities, but it is not liable for any inaccuracies or errors in the provided information.</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>\r\n	<ul>\r\n		<li>\r\n		<p>Please note that these terms and conditions are a general outline and may need to be customized to fit the specific practices and requirements of Utkal Enterprise. It&#39;s advisable to consult with legal professionals or adapt the terms and conditions provided by a legal expert to ensure compliance with applicable laws and regulations in your jurisdiction.</p>\r\n		</li>\r\n		<li>\r\n		<p>Pricing and Payments:</p>\r\n\r\n		<ul>\r\n			<li>Specify that all prices listed on the website are in the applicable currency and exclude any applicable taxes, fees, or shipping charges.</li>\r\n			<li>Clarify that Utkal Enterprise reserves the right to change prices at any time without prior notice.</li>\r\n			<li>Specify the accepted payment methods and any related terms or conditions, such as credit card verification or billing address verification.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Ordering and Shipping:</p>\r\n\r\n		<ul>\r\n			<li>Provide information on the ordering process, including how to place an order, order confirmation, and order cancellation policies.</li>\r\n			<li>Specify the shipping methods available, estimated delivery times, and any associated costs or restrictions.</li>\r\n			<li>Clarify that Utkal Enterprise is not responsible for any delays, damages, or losses incurred during the shipping process.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Returns and Refunds:</p>\r\n\r\n		<ul>\r\n			<li>Outline the conditions and procedures for returning or exchanging parts, including eligibility requirements, timeframes, and return shipping responsibilities.</li>\r\n			<li>Specify any restocking fees, return shipping fees, or other applicable charges.</li>\r\n			<li>Clarify the refund options available, such as refunds to the original payment method or store credit.</li>\r\n			<li>Provide information on the processing time for returns and refunds.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Warranty:</p>\r\n\r\n		<ul>\r\n			<li>Explain any warranties provided by Utkal Enterprise or the manufacturers, if applicable.</li>\r\n			<li>Specify the duration and coverage of the warranty, as well as any limitations or exclusions.</li>\r\n			<li>Clarify the process for making warranty claims and obtaining replacements or repairs.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Intellectual Property:</p>\r\n\r\n		<ul>\r\n			<li>Highlight that all intellectual property rights, including trademarks, logos, and content, belong to Utkal Enterprise and its licensors.</li>\r\n			<li>Specify that customers are prohibited from using, reproducing, or modifying any intellectual property without prior written consent.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Limitation of Liability:</p>\r\n\r\n		<ul>\r\n			<li>Clarify that Utkal Enterprise is not liable for any direct, indirect, incidental, or consequential damages arising from the use of the products or the website.</li>\r\n			<li>Specify that the maximum liability of Utkal Enterprise is limited to the purchase price of the product in question.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Governing Law and Jurisdiction:</p>\r\n\r\n		<ul>\r\n			<li>Specify the governing law that applies to these terms and conditions.</li>\r\n			<li>Clarify the jurisdiction in which any disputes or legal actions must be resolved.</li>\r\n		</ul>\r\n		</li>\r\n		<li>\r\n		<p>Severability:</p>\r\n\r\n		<ul>\r\n			<li>Clarify that if any provision of these terms and conditions is found to be invalid or unenforceable, it will not affect the validity or enforceability of the remaining provisions.</li>\r\n		</ul>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n</ul>', NULL, '2023-06-06 19:23:22'),
(15, 'about_us', '<p>Welcome to Utkal Enterprise!</p>\r\n\r\n<p>At Utkal Enterprise, we are passionate about providing high-quality car and bus interior and exterior parts to our valued customers. With years of experience in the industry, we have established ourselves as a trusted supplier known for our exceptional products and outstanding customer service.</p>\r\n\r\n<p>Our mission is to be the go-to destination for all your car and bus parts needs. We understand the importance of reliable and top-notch parts when it comes to maintaining and enhancing the performance, comfort, and aesthetics of your vehicles. That&#39;s why we strive to offer a comprehensive range of parts that meet the highest standards of quality and compatibility.</p>\r\n\r\n<p>We take pride in our extensive product range, which includes a wide selection of interior and exterior parts for cars and buses of various makes and models. Whether you need replacement parts, upgrades, or accessories, we&#39;ve got you covered. From upholstery and trim pieces to lighting, mirrors, and body panels, we aim to provide everything you need to keep your vehicles in top shape.</p>\r\n\r\n<p>Quality is our top priority. We work closely with trusted manufacturers and suppliers who share our commitment to excellence. All our parts undergo strict quality control processes to ensure they meet or exceed industry standards. This allows us to offer parts that are not only reliable but also provide a perfect fit and finish, making your vehicles look and perform their best.</p>\r\n\r\n<p>At Utkal Enterprise, we believe that exceptional customer service is key to building long-lasting relationships with our customers. Our knowledgeable and friendly team is here to assist you every step of the way. We understand that finding the right parts can be overwhelming, so we&#39;re dedicated to helping you make informed decisions. Whether you need guidance in selecting the right part or require assistance with any inquiries or concerns, we&#39;re here to provide expert advice and reliable support.</p>\r\n\r\n<p>As industry enthusiasts, we stay up-to-date with the latest trends, technologies, and innovations in car and bus parts. We continuously expand our knowledge to ensure we offer the most cutting-edge products to our customers. Through our blog posts, guides, and resources, we aim to empower you with valuable information that helps you make the best choices for your vehicles.</p>\r\n\r\n<p>At Utkal Enterprise, we are committed to environmental responsibility. We actively promote sustainable practices and offer eco-friendly options whenever possible. We believe that we have a responsibility to protect our planet, and we strive to minimize waste and promote recycling in our operations.</p>\r\n\r\n<p>We are proud to be a part of our community and actively engage in community initiatives. We support local events, sponsorships, and charitable organizations that align with our values. Giving back to the community is an integral part of our business philosophy, and we are dedicated to making a positive impact.</p>\r\n\r\n<p>Thank you for choosing Utkal Enterprise as your trusted source for car and bus interior and exterior parts. We are here to serve you and ensure your complete satisfaction. Please feel free to contact us via phone, email, or visit our website for any inquiries or assistance.</p>\r\n\r\n<p>Drive with confidence and style with Utkal Enterprise!</p>', NULL, '2023-06-06 19:17:38'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'support@utkalenterpises.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#1b7fed\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2023-06-21 14:25:51'),
(19, 'company_footer_logo', '2023-06-14-64895e2e7fc4e.png', NULL, '2023-06-14 15:59:02'),
(20, 'company_copyright_text', '© 2023 Utkal Enterprises.', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2023-06-21-649282d78aa8b.png', '2020-10-11 13:53:02', '2023-06-21 14:25:51'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '0', NULL, '2023-05-29 16:57:56'),
(35, 'pnc_language', '[\"en\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<ol>\r\n	<li>\r\n	<p>Introduction:</p>\r\n\r\n	<ul>\r\n		<li>Provide a brief introduction to the privacy policy, explaining its purpose and importance in relation to the collection and use of personal information.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Information Collection:</p>\r\n\r\n	<ul>\r\n		<li>Clarify the types of personal information collected by Utkal Enterprise, such as name, contact details, shipping address, and payment information.</li>\r\n		<li>Specify that this information is obtained through various channels, including the website, customer inquiries, and order processing.</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please note that this is a sample privacy policy and should be customized to reflect the specific practices and requirements of Utkal Enterprise. It&#39;s advisable to consult with legal professionals or adapt the privacy policy provided by a legal expert to ensure compliance with applicable privacy laws and regulations in your jurisdiction.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Use of Information:</p>\r\n\r\n	<ul>\r\n		<li>Explain how Utkal Enterprise uses the collected personal information, such as order processing, product delivery, customer support, and communication regarding orders or promotions.</li>\r\n		<li>Clarify that the information may also be used for internal purposes, such as analyzing customer preferences, improving products and services, and conducting market research.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Information Sharing:</p>\r\n\r\n	<ul>\r\n		<li>State that Utkal Enterprise may share personal information with trusted third-party service providers involved in order fulfillment, payment processing, shipping, and customer support.</li>\r\n		<li>Specify that these third parties are contractually obligated to protect the personal information and are prohibited from using it for any other purpose.</li>\r\n		<li>Clarify that Utkal Enterprise does not sell or disclose personal information to third parties for their marketing purposes.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Data Security:</p>\r\n\r\n	<ul>\r\n		<li>Explain the measures taken by Utkal Enterprise to protect the personal information collected, such as encryption, secure servers, firewalls, and regular security audits.</li>\r\n		<li>Highlight that Utkal Enterprise implements industry-standard security practices to safeguard personal information but cannot guarantee absolute security due to the inherent risks associated with data transmission over the internet.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Cookies and Tracking Technologies:</p>\r\n\r\n	<ul>\r\n		<li>Explain the use of cookies and similar tracking technologies on the Utkal Enterprise website.</li>\r\n		<li>Clarify the purpose of these technologies, such as enhancing website functionality, analyzing user behavior, and personalizing the user experience.</li>\r\n		<li>Provide information on how users can manage or disable cookies through their browser settings.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Third-Party Links:</p>\r\n\r\n	<ul>\r\n		<li>Clarify that the Utkal Enterprise website may contain links to third-party websites or services that have their own privacy policies.</li>\r\n		<li>Advise users to review the privacy policies of any third-party websites visited through Utkal Enterprise&#39;s website.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Children&#39;s Privacy:</p>\r\n\r\n	<ul>\r\n		<li>Specify that Utkal Enterprise does not knowingly collect personal information from individuals under the age of 18 without parental consent.</li>\r\n		<li>Advise parents or guardians to contact Utkal Enterprise if they believe personal information of a minor has been inadvertently collected.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Changes to the Privacy Policy:</p>\r\n\r\n	<ul>\r\n		<li>Clarify that Utkal Enterprise reserves the right to update or modify the privacy policy at any time.</li>\r\n		<li>Specify that changes will be effective upon posting the revised policy on the website.</li>\r\n		<li>Encourage users to periodically review the privacy policy for any updates or changes.</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Contact Information:</p>\r\n\r\n	<ul>\r\n		<li>Provide contact information for users to reach out to Utkal Enterprise with any questions, concerns, or requests regarding their personal information.</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-06 19:24:36'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2023-01-10 05:51:56'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":null,\"color\":null,\"text_color\":null,\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":\"1\",\"site_key\":null,\"secret_key\":null}', '2023-05-29 16:54:51', '2023-05-29 16:54:51'),
(67, 'seller_pos', '0', NULL, '2023-05-29 16:58:02'),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2023-01-10 05:51:56'),
(70, 'refund_day_limit', '7', NULL, NULL),
(71, 'business_mode', 'single', NULL, '2023-05-29 16:58:00'),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'Shanmukhi Tower,  #15 A.M.Road, New Kalasipalyam Exension, Banglore 560002', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '1', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '1', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '1', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(87, 'refund-policy', '{\"status\":1,\"content\":\"<ol>\\r\\n\\t<li>\\r\\n\\t<p>Eligibility for Refunds:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Clearly define the conditions under which customers are eligible for a refund.<\\/li>\\r\\n\\t\\t<li>Specify that refunds are typically applicable for unused, undamaged parts that are returned within a certain timeframe.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refund Requests:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Instruct customers on how to initiate a refund request, such as by contacting customer support or filling out a refund request form.<\\/li>\\r\\n\\t\\t<li>Provide the necessary information customers need to include in their refund request, such as order details, reason for refund, and proof of purchase.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refund Processing Timeframe:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Outline the expected timeframe for processing refund requests.<\\/li>\\r\\n\\t\\t<li>Inform customers that the actual refund may take additional time to reflect in their account depending on the payment method and banking processes.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refund Methods:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain the available refund methods, such as returning the funds to the original payment method or offering store credit.<\\/li>\\r\\n\\t\\t<li>State any limitations or exclusions on refund methods, if applicable.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Return Shipping Costs:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Clarify who is responsible for covering the shipping costs associated with returning the parts.<\\/li>\\r\\n\\t\\t<li>Specify if the seller will provide a prepaid shipping label or if customers need to arrange and pay for return shipping themselves.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refund Amount and Deductions:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain how the refund amount will be calculated, including any deductions for restocking fees, return shipping costs, or other applicable charges.<\\/li>\\r\\n\\t\\t<li>Provide transparency in the calculation process and ensure it aligns with the terms and conditions previously outlined.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Non-Refundable Items:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Specify any items or scenarios that are non-refundable, such as custom-made or special-order parts, or parts that have been used, damaged, or modified.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refunds for Warranty Claims:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Describe the process for refunds related to warranty claims.<\\/li>\\r\\n\\t\\t<li>Outline any additional requirements or documentation needed to process refunds for warranty claims.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Communication and Updates:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain how customers will be informed about the status of their refund requests.<\\/li>\\r\\n\\t\\t<li>Provide contact information for customers to inquire about the progress or updates regarding their refund requests.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Dispute Resolution:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Mention the steps to resolve any disputes related to refund requests, such as through negotiation, mediation, or arbitration.<\\/li>\\r\\n\\t\\t<li>Indicate the governing law and jurisdiction for resolving disputes if necessary.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\\r\\n\\r\\n<p>Remember, this is a general outline and may need to be customized to fit the specific practices and requirements of the car and bus part sale business. It&#39;s advisable to consult with legal professionals or adapt the refund policy provided by a legal expert to ensure compliance with applicable laws and regulations in your jurisdiction.<\\/p>\"}', NULL, '2023-06-06 19:13:06'),
(88, 'return-policy', '{\"status\":1,\"content\":\"<ol>\\r\\n\\t<li>\\r\\n\\t<p>Eligibility for Returns:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Clearly define the conditions under which customers are eligible to return the purchased parts.<\\/li>\\r\\n\\t\\t<li>Specify that returns are typically applicable for unused, undamaged parts that are returned within a certain timeframe.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Return Requests:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Instruct customers on how to initiate a return request, such as by contacting customer support or filling out a return request form.<\\/li>\\r\\n\\t\\t<li>Provide the necessary information customers need to include in their return request, such as order details, reason for return, and proof of purchase.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Return Timeframe:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Specify the timeframe within which customers must initiate the return request after receiving the parts.<\\/li>\\r\\n\\t\\t<li>Clearly state the deadline for returning the parts to the seller.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Return Condition:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain that the parts must be returned in their original condition, including packaging, labels, and any accompanying accessories or documentation.<\\/li>\\r\\n\\t\\t<li>Clarify that any signs of use, damage, or modification may affect the eligibility for return or the refund amount.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Return Shipping and Costs:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Clarify who is responsible for covering the shipping costs associated with returning the parts.<\\/li>\\r\\n\\t\\t<li>Specify if the seller will provide a prepaid shipping label or if customers need to arrange and pay for return shipping themselves.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refund or Exchange Options:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain the available options for returns, such as a refund, store credit, or exchange for a different part.<\\/li>\\r\\n\\t\\t<li>Indicate any limitations or exclusions on refund or exchange options, if applicable.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Return Processing Timeframe:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Outline the expected timeframe for processing returns and issuing refunds or exchanges.<\\/li>\\r\\n\\t\\t<li>Inform customers that the actual return processing time may vary depending on factors such as shipping, inspection, and refund method.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Non-Returnable Items:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Specify any items or scenarios that are non-returnable, such as custom-made or special-order parts, or parts that have been used, damaged, or modified.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Communication and Updates:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain how customers will be informed about the status of their return requests.<\\/li>\\r\\n\\t\\t<li>Provide contact information for customers to inquire about the progress or updates regarding their return requests.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Dispute Resolution:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Mention the steps to resolve any disputes related to return requests, such as through negotiation, mediation, or arbitration.<\\/li>\\r\\n\\t\\t<li>Indicate the governing law and jurisdiction for resolving disputes if necessary.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\\r\\n\\r\\n<p>Remember, this is a general outline and may need to be customized to fit the specific practices and requirements of the car and bus part sale business. It&#39;s advisable to consult with legal professionals or adapt the return policy provided by a legal expert to ensure compliance with applicable laws and regulations in your jurisdiction.<\\/p>\"}', NULL, '2023-06-06 19:14:16'),
(89, 'cancellation-policy', '{\"status\":1,\"content\":\"<ol>\\r\\n\\t<li>\\r\\n\\t<p>Eligibility for Cancellation:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Clearly define the conditions under which customers are eligible to cancel their orders.<\\/li>\\r\\n\\t\\t<li>Specify the timeframe within which cancellations can be requested, considering factors such as order processing and shipping preparation.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Cancellation Requests:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Instruct customers on how to initiate a cancellation request, such as by contacting customer support or submitting a cancellation form.<\\/li>\\r\\n\\t\\t<li>Provide the necessary information customers need to include in their cancellation request, such as order details and reason for cancellation.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Cancellation Deadline:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Specify the deadline by which customers must submit their cancellation requests.<\\/li>\\r\\n\\t\\t<li>Clearly state that cancellation requests made after the deadline may not be accommodated.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Refund for Canceled Orders:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain the refund process for canceled orders, including the timeframe for issuing refunds.<\\/li>\\r\\n\\t\\t<li>Clarify any deductions for processing fees, restocking fees, or other applicable charges.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Order Status:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Describe the impact of order status on cancellation eligibility.<\\/li>\\r\\n\\t\\t<li>Specify that cancellations may not be possible once the order has been shipped or if it is already in transit.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Communication and Updates:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Explain how customers will be informed about the status of their cancellation requests.<\\/li>\\r\\n\\t\\t<li>Provide contact information for customers to inquire about the progress or updates regarding their cancellation requests.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Non-Cancelable Items:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Specify any items or scenarios that are non-cancelable, such as custom-made or special-order parts, or items that have already been shipped.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Partial Cancellations:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Clarify if partial cancellations are allowed, where customers can cancel specific parts or quantities within their order.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Dispute Resolution:<\\/p>\\r\\n\\r\\n\\t<ul>\\r\\n\\t\\t<li>Mention the steps to resolve any disputes related to cancellation requests, such as through negotiation, mediation, or arbitration.<\\/li>\\r\\n\\t\\t<li>Indicate the governing law and jurisdiction for resolving disputes if necessary.<\\/li>\\r\\n\\t<\\/ul>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\\r\\n\\r\\n<p>Remember, this is a general outline and may need to be customized to fit the specific practices and requirements of the car and bus part sale business. It&#39;s advisable to consult with legal professionals or adapt the cancellation policy provided by a legal expert to ensure compliance with applicable laws and regulations in your jurisdiction.<\\/p>\"}', NULL, '2023-06-06 19:15:29'),
(90, 'offline_payment', '{\"status\":0}', NULL, '2023-03-04 06:25:36'),
(91, 'temporary_close', '{\"status\":0}', NULL, '2023-03-04 06:25:36'),
(92, 'vacation_add', '{\"status\":0,\"vacation_start_date\":null,\"vacation_end_date\":null,\"vacation_note\":null}', NULL, '2023-03-04 06:25:36'),
(93, 'cookie_setting', '{\"status\":0,\"cookie_text\":null}', NULL, '2023-03-04 06:25:36'),
(94, 'currency_symbol_position', 'left', '2023-05-29 17:23:21', '2023-05-29 17:23:21'),
(95, 'timezone', 'Asia/Calcutta', NULL, NULL),
(96, 'default_location', '{\"lat\":\"12.958954\",\"lng\":\"77.580070\"}', NULL, NULL),
(97, 'loader_gif', '2023-06-21-649282d78b577.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `product_type`, `digital_product_type`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `tax_model`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(6, 3, '3-2ZOeR-1728378392', 17, 'physical', NULL, NULL, '[]', '[]', '', 1, 60, 3, 6, 'exclude', 'test1-JEmdtG', 'test1', '2024-02-05-65c0acb28204c.png', 1, 'admin', '2024-10-08 18:36:32', '2024-10-08 18:36:32', 'Utkal Enterprises', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(6, '3-2ZOeR-1728378392', 9, 100.00, '2024-10-08 18:36:49', '2024-10-08 18:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'Car Accessories', 'car-accessories', '2023-05-29-647474a5733a4.png', 0, 0, '2023-05-29 19:17:17', '2023-05-29 19:17:17', 0, 0),
(2, 'Bus Accessories', 'bus-accessories', '2023-05-29-647475369ac54.png', 0, 0, '2023-05-29 19:19:42', '2023-05-29 19:19:42', 0, 1),
(3, 'Interior Accessories', 'interior-accessories', NULL, 1, 1, '2023-05-31 16:01:40', '2023-05-31 16:01:40', 0, 1),
(4, 'Exterior Accessories', 'exterior-accessories', NULL, 1, 1, '2023-05-31 16:02:36', '2023-05-31 16:02:51', 0, 1),
(5, 'Seat covers', 'seat-covers', NULL, 3, 2, '2023-05-31 16:05:48', '2023-05-31 16:05:48', 0, 1),
(6, 'Interior lighting upgrades', 'interior-lighting-upgrades', NULL, 3, 2, '2023-05-31 16:50:32', '2023-05-31 16:50:32', 0, 2),
(7, 'Sunshades', 'sunshades', NULL, 3, 2, '2023-05-31 17:06:59', '2023-05-31 17:06:59', 0, 3),
(8, 'Window tints', 'window-tints', NULL, 3, 2, '2023-05-31 18:28:14', '2023-05-31 18:28:31', 0, 3),
(10, 'Body kits', 'body-kits', NULL, 4, 2, '2023-05-31 18:34:30', '2023-05-31 18:34:30', 0, 2),
(11, 'Grille guards', 'grille-guards', NULL, 4, 2, '2023-05-31 18:52:45', '2023-05-31 18:52:45', 0, 2),
(12, 'Interior Accessories', 'interior-accessories', NULL, 2, 1, '2023-05-31 21:45:59', '2023-05-31 21:45:59', 0, 1),
(15, 'Exterior Accessories', 'exterior-accessories', NULL, 2, 1, '2023-05-31 22:29:47', '2023-05-31 22:29:47', 0, NULL),
(16, 'Cargo carriers', 'cargo-carriers', NULL, 15, 2, '2023-05-31 22:30:57', '2023-05-31 22:30:57', 0, NULL),
(17, 'Safety Accessories', 'safety-accessories', NULL, 2, 1, '2023-06-01 13:37:41', '2023-06-01 13:37:41', 0, 2),
(19, 'Seating Accessories', 'seating-accessories', NULL, 12, 2, '2023-06-01 13:49:27', '2023-06-01 13:49:27', 0, 3),
(20, 'Electical Accessories', 'electical-accessories', NULL, 2, 1, '2023-06-01 14:31:47', '2023-06-01 14:31:47', 0, 3),
(21, 'Alternator & Parts', 'alternator-parts', NULL, 20, 2, '2023-06-01 14:35:03', '2023-06-01 14:35:03', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2023-05-29 19:31:58', '2023-05-29 19:31:58'),
(2, 0, 2, 0.00, NULL, '2023-05-29 19:31:58', '2023-05-29 19:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'swamy', 'ampletechnoplast@gmail.com', '9845133577', 'order', 'hi', 0, '0', '2023-06-19 22:10:02', '2023-06-19 22:10:02', NULL),
(2, 'RobertGex', 'alfredegov@gmail.com', '87166274945', 'Aloha    write about   the price', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2023-07-18 21:38:30', '2023-07-18 21:38:30', NULL),
(3, 'Malissa Ross', 'malissa.ross@yahoo.com', '(07) 4574 7008', 'Hi utkalenterprises.net Administrator!', 'Submit your site http://utkalenterprises.net to our free business directory here: http://submityoursitefree.12com.xyz/', 0, '0', '2023-07-22 13:02:29', '2023-07-22 13:02:29', NULL),
(4, 'Julieta Bachus', 'bachus.julieta@googlemail.com', '719-404-5215', 'Hello utkalenterprises.net Owner!', 'I love the look and feel of your site, you should submit it in our free directory here: http://submityoursitefree.12com.xyz/', 0, '0', '2023-08-07 07:04:28', '2023-08-07 07:04:28', NULL),
(5, 'RobertGex', 'alfredegov@gmail.com', '86249958746', 'Hello    write about     price', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2023-08-07 15:07:48', '2023-08-07 15:07:48', NULL),
(6, 'Georgeskibe', 'no.reply.ChristianFrangois@gmail.com', '88194926375', 'Do you want to bring in more customers for your business?', 'Good morning! utkalenterprises.net \r\n \r\nDid you know that it is possible to send business offers lawfully? We are offering a novel way of sending letters through feedback forms. Feedback forms like these can be found on many webpages. \r\nWhen such messages are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals securely. Because of their importance, messages sent via Feedback Forms are not labeled as spam. \r\nWe provide you with the opportunity to test our service free of charge. \r\nWe shall send up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', 0, '0', '2023-08-22 10:58:07', '2023-08-22 10:58:07', NULL),
(7, 'RobertGex', 'alfredegov@gmail.com', '84933571234', 'Hallo, i am writing about     prices', 'Hi, I wanted to know your price.', 0, '0', '2023-08-28 09:53:45', '2023-08-28 09:53:45', NULL),
(8, 'Anna Wilson', 'annawilson.web@gmail.com', '1201201200', 'Re: Improve your website traffic and SEO', 'Hi,\r\n\r\nI came across your Website, when searching on Google and noticed that you do not show in the organic listings.\r\n\r\nOur main focus will be to help generate more sales & online traffic.\r\n\r\nWe can place your website on Google\'s 1st page. We will improve your website’s position on Google and get more traffic.\r\n\r\nIf interested, kindly provide me your name, phone number, and email.\r\n\r\nYour sincerely,\r\nAnna Wilson', 0, '0', '2023-09-01 20:39:54', '2023-09-01 20:39:54', NULL),
(9, 'Tommie Isom', 'tommie.isom@googlemail.com', '077 6402 8927', 'Hello utkalenterprises.net Owner.', 'I have a question. You just read this message right? That means you\'re now a potential customer and I can do the same thing for your business. I can blast YOUR ad to 1 million websites just like I did to yours for just $98. More pricing plans are also available, contact me on Skype for details. Here\'s my id : live:.cid.aebc78a94c13344c', 0, '0', '2023-09-14 05:49:49', '2023-09-14 05:49:49', NULL),
(10, 'RobertGex', 'alfredegov@gmail.com', '84596398417', 'Aloha    write about your the prices', 'Ciao, volevo sapere il tuo prezzo.', 0, '0', '2023-09-15 10:35:13', '2023-09-15 10:35:13', NULL),
(11, 'Williamfek', 'yasen.krasen.13+91427@mail.ru', '85341558613', 'Oiijifekdswdeijfeij jrifwodwodkwifjeikfo jkowkdwkdwfjejfiwkdwdkw jidwoqaskwojefhfisdfjei', 'Mfhfujfehfueh ifwjifjeighufijsdh uidfsjkdokwefuhgedjij idoweweureiurioweiidkjsdj iwjdsksosjfeihfiwskdoakd ijwdiwdowjfihefiwjdiwhfgue utkalenterprises.net', 0, '0', '2023-09-17 06:08:16', '2023-09-17 06:08:16', NULL),
(12, 'RaymondJoxia', 'no.reply.JohanMichel@gmail.com', '83727961772', 'Make your products and services stand out with the best advertising!', 'Hi-ya! utkalenterprises.net \r\n \r\nDid you know that it is possible to send appeals legally and legitimately? We offer a legitimate and legal way of sending business offers through feedback forms. A plethora of websites offer such forms. \r\nWhen such messages are sent, no personal data is used, and messages are sent to forms specifically designed to receive, process, and respond to messages and appeals. Messages from Feedback Forms are not viewed as spam since they are classified as essential. \r\nWe gіve уou the chance to test our service for nothing! \r\nWe will transmit up to 50,000 messages to you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', 0, '0', '2023-09-19 13:15:42', '2023-09-19 13:15:42', NULL),
(13, 'Damion Ratliff', 'ratliff.damion@yahoo.com', 'Hulyufct I Jm', 'To the utkalenterprises.net Administrator!', 'Looking for unique advertising that doesn\'t cost thousands of dollars to deliver mediocre results? How about contact form blasting? This is how I\'m reaching out to you right now! Cost is less than a hundred dollars to send to a million forms. For more info hit me up on Skype here: live:.cid.dd8a3501619891fe', 0, '0', '2023-09-20 02:57:51', '2023-09-20 02:57:51', NULL),
(14, 'PhilGex', 'draikkimr976@gmail.com', '85364713917', 'Aloha, i wrote about your   prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2023-09-24 06:39:29', '2023-09-24 06:39:29', NULL),
(15, 'Andre Clarke', 'arreola.wilda@msn.com', '01.23.05.82.08', 'Quick question', 'Hey there,\r\n\r\nWas looking at your site today and I thought this would probably interest you.\r\n\r\nAre you tired of traditional virtual assistants who lack the expertise to handle complex tasks? Feeling overwhelmed by the thought of diving into generative AI? We\'ve got the game-changing solution you\'ve been waiting for: Myaa\'s AI-Powered Personal Support Agents.\r\n\r\nImagine the best of both worlds: a personal assistant who\'s a live professional expert at leveraging the power of thousands of AI Agents. That\'s exactly what you get with Myaa. Our AI-Powered Personal Support Agents are trained to perfection in writing excellent prompts and harnessing the capabilities of our AI Agents.\r\n\r\nBut here\'s the best part: we\'re offering a one-week free trial for you to experience the transformative capabilities of our agents firsthand. No obligations, no strings attached. Just a chance to see how our AI-Powered Personal Support Agents, the experts in leveraging AI technology, can revolutionize the way you manage your business.\r\n\r\nDon\'t miss out on this exclusive opportunity. Click below to schedule a call and claim your one-week free trial:\r\n\r\nhttps://bit.ly/Free-AI-Powered-Support-Agent\r\n\r\nDuring the call, our experts will guide you through the process and pair you with the perfect Myaa AI-Powered Personal Support Agent for your business. Say goodbye to inefficiency and hello to expert assistance.\r\n\r\nGet started now and unlock the full potential of generative AI with Myaa\'s AI-Powered Personal Support Agents.\r\n\r\nCheers,\r\n\r\nAndre Clarke\r\nBusiness Development\r\nMyaa', 0, '0', '2023-09-26 20:04:02', '2023-09-26 20:04:02', NULL),
(16, 'Mike Taft', 'mikeEngella@gmail.com', '85429687274', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\n \r\nRegards \r\nMike Taft\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-09-27 01:48:59', '2023-09-27 01:48:59', NULL),
(17, 'James Farrell', 'inficteam@gmail.com', '81136573478', 'Unlock your potential with funding.', 'Attention: President/CEO \r\n \r\nOur worldwide lending network is here for you. Whether it\'s an ongoing or new project that requires funding, we\'ve got you covered. We offer investment from $1M to 3B with competitive interest rates of 2.5% to 4% over a 10-years term, including a 2-year grace period. Don\'t hesitate to get in touch for more information. \r\n \r\nBest Regards, \r\nJames Farrell \r\nJames.farrell@inficsa.co.za \r\nPortfolio Manager \r\nhttp://www.inficza.com/', 0, '0', '2023-09-27 17:13:27', '2023-09-27 17:13:27', NULL),
(18, 'Shaunte Kirton', 'shaunte.kirton@hotmail.com', '519-474-7207', 'Dear utkalenterprises.net Owner!', 'I just left you this message on your website contact form at utkalenterprises.net and I have also sent it to millions of other sites. I get new customers every day using this method and so can you! For just under a hundred bucks you can reach 1 million websites! For more info and pricing, just reach out to me via Skype here: live:.cid.303294bd15a81bc7', 0, '0', '2023-09-29 19:49:34', '2023-09-29 19:49:34', NULL),
(19, 'Jimmy Newsom', 'newsom.juli@hotmail.com', '1237152844', 'To the utkalenterprises.net Owner!', 'Hi there,\r\nMonthly Seo Services - Professional/ Affordable Seo Services\r\nHire the leading seo marketing company and get your website ranked on search engines. Are you looking to rank your website on search engines? Contact us now to get started - https://digitalpromax.co/la/  Today!\r\n\r\nPsst.. we will also do web design and build complete website. Wordpress and Ecommerce sites development. Click here: https://wpexpertspro.co/website/', 0, '0', '2023-09-30 20:02:38', '2023-09-30 20:02:38', NULL),
(20, 'Mike Webster', 'mikeenasia@gmail.com', '86395579622', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Webster\r\n \r\nMonkey Digital', 0, '0', '2023-10-03 08:51:21', '2023-10-03 08:51:21', NULL),
(21, 'Mike Farrell', 'peterrobe@gmail.com', '85151417261', 'Whitehat SEO for utkalenterprises.net', 'Hello \r\n \r\nI have just verified your SEO on  utkalenterprises.net for its SEO metrics and saw that your website could use an upgrade. \r\n \r\nWe will increase your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Farrell\r\nDigital X SEO Experts', 0, '0', '2023-10-04 02:14:10', '2023-10-04 02:14:10', NULL),
(22, 'Michael Sinclair', 'msinclair.hivemailers@gmail.com', '916-903-7141', 'I have a question', 'Hello,\r\n  \r\nI was looking at your site and wanted to ask if you would be interested in getting one-hundred thousand emails sent out within 48 hours for just $48 - we call it our 48-Special.\r\n \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n- We make changes to the list and content until we get results.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!!!! We will send one hundred thousand emails for just $48 \r\n  \r\nBook a 10 min call with me now: https://bit.ly/hive-48-special\r\n\r\nNOTE: To buy an email list and hire an in-house email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $48. So, you save over $3,450.\r\n\r\nThis offer is good for the first 20 clients, don’t miss out.  Book appointment now: https://bit.ly/hive-48-special\r\n\r\nSincerely,\r\nMichael', 0, '0', '2023-10-04 03:04:37', '2023-10-04 03:04:37', NULL),
(23, 'Tigran Ayrapetyan', 'ujn2esbgakah@opayq.com', '89915974157', 'Capital Business Funding', 'Hello, \r\n \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. We are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nWe would like to review your business plan or executive summary to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\n \r\nI hope to hear back from you soon. \r\n \r\nSincerely, \r\n \r\nTigran Ayrapetyan \r\nInvestment Director \r\nDevcorp International W.L.L. \r\nP.O Box 10236 Shop No. 305 \r\nFlr 3 Manama Centre, Bahrain \r\nEmail: tigran.a@devcorpinternational.com', 0, '0', '2023-10-04 23:38:25', '2023-10-04 23:38:25', NULL),
(24, 'Nishant Sharma', 'nishant.developer22@gmail.com', '1234567890', 'Re: Website Design & development service for utkalenterprises.net', 'Hi utkalenterprises.net,\r\n\r\nI am Nishant, Do you want to build/redesign your online business website?\r\n\r\nWe offer comprehensive solutions at a reasonable price.\r\n\r\nWeb design and development (E-Commerce Website, Magneto, Word Press, CI, Laravel, Core PHP) etc.\r\n\r\nIf interested. May I send you a package/proposal?\r\n\r\nThanks & Regards,\r\nNishant', 0, '0', '2023-10-06 03:44:14', '2023-10-06 03:44:14', NULL),
(25, 'Hayley Book', 'hayley.book@gmail.com', '718-819-0609', 'Hello utkalenterprises.net Administrator!', 'Is this your website? utkalenterprises.net? I just sent you a message via the contact form on your site and was wondering if you wanted to try some unique advertising that reaches business owners worldwide? How do we do it? Well you just witnessed our process. We send your ad text to contact forms on websites worldwide. Plans start at a hundred dollars for posting your ad to one million sites. Reach out to me via Email and let\'s dicuss what we can do for your business. My Skype ID is:  live:.cid.303294bd15a81bc7', 0, '0', '2023-10-06 06:36:00', '2023-10-06 06:36:00', NULL),
(26, 'RobertGex', 'alfredegov@gmail.com', '88594541518', 'Hallo, i write about your the price for reseller', 'Sawubona, bengifuna ukwazi intengo yakho.', 0, '0', '2023-10-06 10:50:36', '2023-10-06 10:50:36', NULL),
(27, 'Mike Bawerman', 'mikeSpeeliGala@gmail.com', '81948771639', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\nThanks and regards \r\nMike Bawerman', 0, '0', '2023-10-11 10:30:01', '2023-10-11 10:30:01', NULL),
(28, 'Mike Jerome', 'mikeel@gmail.com', '82754547614', 'NEW: Semrush Backlinks', 'Hi \r\n \r\nThis is Mike Jerome\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Jerome\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-10-13 00:59:21', '2023-10-13 00:59:21', NULL),
(29, 'PhilGex', 'osend5462@gmail.com', '86925287671', 'Hallo, i write about your the price', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2023-10-15 02:33:46', '2023-10-15 02:33:46', NULL),
(30, 'Jere Dudgeon', 'jere.dudgeon@gmail.com', '613-476-6629', 'Dear utkalenterprises.net Administrator!', 'Quick question to ask you... Are you aware that by reading this message you just proved that contact form marketing works? That\'s right, and we can get eyeballs on your offer too! Pricing starts at just $100 to blast YOUR ad message to 1 MILLION contact forms on websites just like yours worldwide. Contact me on Email and let\'s discuss what will work for your product/service. My Skype Address is: live:.cid.303294bd15a81bc7 this message was sent to your website contact form at: utkalenterprises.net', 0, '0', '2023-10-16 05:58:18', '2023-10-16 05:58:18', NULL),
(31, 'Mike Dean', 'mikeAmorpApercebiony@gmail.com', '83375177119', 'Improve local visibility for utkalenterprises.net', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Dean\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-10-18 02:05:27', '2023-10-18 02:05:27', NULL),
(32, 'Max Horn', 'max.horn@gmail.com', '03.88.29.93.89', 'Dear utkalenterprises.net Webmaster.', 'want to get an alert when your website is down? then use our 24on7 web monitor - it\'s absolutely free! \r\nvisit https://t.ly/cQQMm?utkalenterprises.net   for more info', 0, '0', '2023-10-22 10:30:25', '2023-10-22 10:30:25', NULL),
(33, 'Michael Sinclair', 'klara.bollinger@msn.com', '04.20.47.93.10', 'I have a question', 'Hello,\r\n  \r\nI was looking at your site and wanted to ask if you would be interested in getting one-hundred thousand emails sent out within 48 hours for just $48 - we call it our 48-Special.\r\n \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n- We make changes to the list and content until we get results.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!!!! We will send one hundred thousand emails for just $48 \r\n  \r\nBook a 10 min call with me now: https://bit.ly/hive-48-special\r\n\r\nNOTE: To buy an email list and hire an in-house email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $48. So, you save over $3,450.\r\n\r\nThis offer is good for the first 20 clients, don’t miss out.  Book appointment now: https://bit.ly/hive-48-special\r\n\r\nSincerely,\r\nMichael', 0, '0', '2023-10-23 04:06:44', '2023-10-23 04:06:44', NULL),
(34, 'RobertGex', 'alfredegov@gmail.com', '83311137334', 'Aloha,   write about your the price', 'Ciao, volevo sapere il tuo prezzo.', 0, '0', '2023-10-24 07:31:39', '2023-10-24 07:31:39', NULL),
(35, 'Amelia Suckley', 'wayne.hayley@googlemail.com', '602-589-0330', '������ Unlock Success on Exam Day with CertBlaster! Save $10 Today! ������', 'Hey there! ������\r\n\r\nI hope you\'re doing great. My name is Amelia Suckley, and I\'m reaching out on behalf of dti Publishing Corp. We have an exciting product that will change the way you prepare for your certification exams, ensuring you pass with confidence.\r\n\r\nIntroducing CertBlaster - the ultimate solution for young software designers and IT professionals like you who are determined to succeed on their certification exams. ������\r\n\r\nWith CertBlaster, you can access high-quality content, an extensive database of practice questions, and the most sophisticated exam simulation available. We provide engaging, informative, and exam-specific materials that have received a stellar 4-star rating on Trustpilot. ✨\r\n\r\nFor a limited time, you can save $10 when you sign up for CertBlaster. Simply use the special offer code \"SAVE10\" at checkout to take advantage of this fantastic deal. ������\r\n\r\nReady to unlock your potential? Click the link below to visit our website and secure your spot:\r\n\r\nhttps://bit.ly/certblaster\r\n\r\nRemember, this offer won\'t last forever, so act fast to save $10 and prepare to conquer your certification exam with confidence. ⏰\r\n\r\nThank you for considering CertBlaster, and we can\'t wait to support you on your journey to success. ������\r\n\r\nBest regards,\r\n\r\nAmelia Suckley\r\ndti Publishing Corp.\r\n\r\nP.S. Read testimonials on our website to see how CertBlaster has helped countless IT professionals like yourself achieve their', 0, '0', '2023-10-25 15:35:07', '2023-10-25 15:35:07', NULL),
(36, 'Mike Bootman', 'mikeEngella@gmail.com', '88764561568', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\n \r\nRegards \r\nMike Bootman\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-10-25 19:25:07', '2023-10-25 19:25:07', NULL),
(37, 'RobertGex', 'alfredegov@gmail.com', '87272145414', 'Hallo,   write about   the price', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2023-10-26 19:22:33', '2023-10-26 19:22:33', NULL),
(38, 'Cornell Lucia', 'cornell.lucia@outlook.com', '06-51347997', 'Hi utkalenterprises.net Webmaster.', 'want to get an alert when your website is down? then signup to our 24on7 web monitor - it\'s absolutely free! \r\nvisit https://t.ly/hCFIP?utkalenterprises.net   for more info', 0, '0', '2023-10-27 11:50:02', '2023-10-27 11:50:02', NULL),
(39, 'MiltonTep', 'yasen.krasen.13+97598@mail.ru', '89964499529', 'Mfheidjwhfuh HUJUHGUJH djwidjwfhuefejjifeh NUHUUUhufhedjefheuhufheudhuwfhu', 'Nguheidjiwfefhei ijiwdwjurFEJDKWIJFEIF аоушвцшургаруш ШОРГПГОШРГРПГОГРГ iryuieoieifegjejj bvncehfedjiehfu utkalenterprises.net', 0, '0', '2023-10-28 00:41:29', '2023-10-28 00:41:29', NULL),
(40, 'TobiasIcody', 'no.reply.ThijsVisser@gmail.com', '86837829179', 'Are you attempting to gain more customers for your business?', 'Howdy-ho! utkalenterprises.net \r\n \r\nDid you know that it is possible to send request completely legitimately? We suggest a new legal way of sending appeals through contact forms. These kinds of feedback forms can be located on lots of webpages. \r\nWhen such proposals are submitted, no personal information is utilized, and messages are routed to forms specifically configured to receive messages and appeals securely. Since Feedback Forms messages are deemed important, they won\'t be labeled as junk. \r\nGive it a go – our service is free! \r\nOur service can offer up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', 0, '0', '2023-10-28 22:31:42', '2023-10-28 22:31:42', NULL),
(41, 'MisSaulp', 'ecollinge@duckctr.com', '89171535849', 'Secret SEO service invitation - Revolutionize Your SEO with Duckctr.com', 'Hello. I hope this message finds you well. I am reaching out to introduce you to a ground-breaking service that is set to redefine the SEO landscape: duckctr.com. \r\nMany platforms claim to enhance website positioning, but their results often fall short or only offer superficial metrics that don\'t translate to genuine growth. \r\n \r\nHere\'s what sets us apart: \r\n1. Instantaneous Impact: Users witness immediate improvements in website rankings. No more waiting for months to see tangible progress. \r\n2. Permanent Domain Authority Boost: With our unique methodology, your domain\'s authority will see a consistent upsurge. \r\n3. Strategic Suggestions: Our platform doesn\'t just enhance positioning; it offers actionable insights and suggestions for sustained growth. \r\n4. Additional Link Creation: Generate high-quality backlinks organically. \r\n5. Knowledge Panels: Enhance your online visibility with the spawning of knowledge panels. \r\n \r\nBut what truly differentiates duckctr.com? We\'re the only service of our kind available publicly worldwide. If you\'re serious about elevating your SEO strategy for 2023 and beyond, this is a unique opportunity that shouldn\'t be missed. \r\nA Few Things to Note: \r\n- This isn\'t just another tool for generating numbers on Google Search Console or Google Analytics. Our service guarantees real results within days of launching a campaign. \r\n- For critical clients, even a single campaign can significantly boost the domain authority for a modest investment. For highly competitive keywords, our regular campaigns can be a game-changer. \r\nImagine the value proposition you could present to your clients by being one of the few to harness the power of duckctr.com. \r\nSeats are filling up rapidly. If you\'re keen on collaborating with us and accessing the most advanced SEO techniques of 2023, I urge you to register today. \r\nLet\'s redefine SEO success together. \r\n \r\nEnter duckctr.com community.', 0, '0', '2023-10-29 08:00:40', '2023-10-29 08:00:40', NULL),
(42, 'Ahmedkef', 'grand7222@gmail.com', '81119223355', 'The Key to Success: Earning $30,000 per Month in Email Marketing', 'Earning $30,000 per Month in Email Marketing: Your Success Awaits http://marketing-56533512.dantojochilango.com/price?55021', 0, '0', '2023-10-30 14:14:33', '2023-10-30 14:14:33', NULL),
(43, 'Ahmedkef', 'grand7222@gmail.com', '86917356332', 'The Key to Success: Earning $30,000 per Month in Email Marketing', 'Earning $30,000 per Month in Email Marketing: Your Success Awaits http://marketing-56533512.dantojochilango.com/price?55021', 0, '0', '2023-10-30 14:14:36', '2023-10-30 14:14:36', NULL),
(44, 'Ahmedkef', 'grand7222@gmail.com', '85154417327', 'The Key to Success: Earning $30,000 per Month in Email Marketing', 'Earning $30,000 per Month in Email Marketing: Your Success Awaits http://marketing-56533512.dantojochilango.com/price?55021', 0, '0', '2023-10-30 14:14:38', '2023-10-30 14:14:38', NULL),
(45, 'Ahmedkef', 'grand7222@gmail.com', '81294257148', 'The Key to Success: Earning $30,000 per Month in Email Marketing', 'Earning $30,000 per Month in Email Marketing: Your Success Awaits http://marketing-56533512.dantojochilango.com/price?55021', 0, '0', '2023-10-30 14:14:41', '2023-10-30 14:14:41', NULL),
(46, 'Ahmedkef', 'grand7222@gmail.com', '82687798837', 'The Key to Success: Earning $30,000 per Month in Email Marketing', 'Earning $30,000 per Month in Email Marketing: Your Success Awaits http://marketing-56533512.dantojochilango.com/price?55021', 0, '0', '2023-10-30 14:14:43', '2023-10-30 14:14:43', NULL),
(47, 'Michael Sinclair', 'rocky.denny@hotmail.com', '437 73 038', 'I have a question', 'Hello,\r\n  \r\nI was looking at your site and wanted to ask if you would be interested in getting one-hundred thousand emails sent out within 48 hours for just $48 - we call it our 48-Special.\r\n \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n- We make changes to the list and content until we get results.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!!!! We will send one hundred thousand emails for just $48 \r\n  \r\nBook a 10 min call with me now: https://bit.ly/hive-48-special\r\n\r\nNOTE: To buy an email list and hire an in-house email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $48. So, you save over $3,450.\r\n\r\nThis offer is good for the first 20 clients, don’t miss out.  Book appointment now: https://bit.ly/hive-48-special\r\n\r\nSincerely,\r\nMichael', 0, '0', '2023-10-30 15:54:44', '2023-10-30 15:54:44', NULL),
(48, 'Mike Hill', 'mikeenasia@gmail.com', '86474583922', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Hill\r\n \r\nMonkey Digital', 0, '0', '2023-11-02 00:49:15', '2023-11-02 00:49:15', NULL),
(49, 'Mike Nash', 'peterrobe@gmail.com', '89767751435', 'Whitehat SEO for utkalenterprises.net', 'Hi \r\n \r\nI have just checked  utkalenterprises.net for its SEO Trend and saw that your website could use an upgrade. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Nash\r\nDigital X SEO Experts', 0, '0', '2023-11-02 02:57:41', '2023-11-02 02:57:41', NULL),
(50, 'Julie Maggard', 'maggard.julie31@yahoo.com', '077 4268 5920', 'Hello utkalenterprises.net Administrator.', 'Add your site to 1000 directories with one simple click here-> http://webdirectorylisting.rt32.xyz', 0, '0', '2023-11-02 14:02:33', '2023-11-02 14:02:33', NULL),
(51, 'Donaldcam', 'jfbarnes16@optusnet.com.au', '85529384241', 'Earnings from $30,000 Per Day: The Ultimate Income Solution', 'EARNINGS FROM $30,000 PER DAY: YOUR TICKET TO PROSPERITY http://email-marketing-24257275.todosignificados.com/offer?55039', 0, '0', '2023-11-02 18:27:21', '2023-11-02 18:27:21', NULL),
(52, 'Donaldcam', 'jfbarnes16@optusnet.com.au', '86758666146', 'Earnings from $30,000 Per Day: The Ultimate Income Solution', 'EARNINGS FROM $30,000 PER DAY: YOUR TICKET TO PROSPERITY http://email-marketing-24257275.todosignificados.com/offer?55039', 0, '0', '2023-11-02 18:27:24', '2023-11-02 18:27:24', NULL),
(53, 'Donaldcam', 'jfbarnes16@optusnet.com.au', '84413391483', 'Earnings from $30,000 Per Day: The Ultimate Income Solution', 'EARNINGS FROM $30,000 PER DAY: YOUR TICKET TO PROSPERITY http://email-marketing-24257275.todosignificados.com/offer?55039', 0, '0', '2023-11-02 18:27:26', '2023-11-02 18:27:26', NULL),
(54, 'Donaldcam', 'jfbarnes16@optusnet.com.au', '87799517722', 'Earnings from $30,000 Per Day: The Ultimate Income Solution', 'EARNINGS FROM $30,000 PER DAY: YOUR TICKET TO PROSPERITY http://email-marketing-24257275.todosignificados.com/offer?55039', 0, '0', '2023-11-02 18:27:29', '2023-11-02 18:27:29', NULL),
(55, 'Donaldcam', 'jfbarnes16@optusnet.com.au', '88164336163', 'Earnings from $30,000 Per Day: The Ultimate Income Solution', 'EARNINGS FROM $30,000 PER DAY: YOUR TICKET TO PROSPERITY http://email-marketing-24257275.todosignificados.com/offer?55039', 0, '0', '2023-11-02 18:27:32', '2023-11-02 18:27:32', NULL),
(56, 'Kim Wheatley', 'kcreativeart@googlemail.com', '980 32 284', 'Real quick question for you', 'Hey there,\r\n\r\nStruggling to attract clients and grow your business? Tired of blending in with the competition? My name is Mr. Kim Wheatley and I have the solution for you.\r\n\r\nIntroducing our “15 Minutes a Day, 5-Day Business Growth Accelerator” program. It\'s time to rise above and position yourself as the go-to expert in your industry. Imagine effortlessly attracting high-quality clients who value your worth and are willing to pay a premium.\r\n\r\nHere\'s the problem: many believe price is the only factor clients care about. But we know better. Our program shows you how to effectively communicate your unique value proposition, leaving your competitors in the dust.\r\n\r\nThe best part? You\'ll see results almost immediately. Our proven strategies deliver tangible growth from day one. No more wasted time and money on ineffective tactics.\r\n\r\nBut hurry - limited spots available. Don\'t miss out on this exclusive opportunity to transform your business and secure your future.\r\n\r\nClick below to secure your spot in our Business Growth Accelerator program:\r\n\r\nClick here: --> https://bit.ly/bg-accelerator \r\n\r\nBreak free from the struggle and unlock your business growth potential.\r\n\r\nTo your unstoppable growth,\r\n\r\nMr. Kim Wheatley\r\n\r\nP.S. Don\'t miss your chance to stand out from the competition. Click below to secure your spot:\r\n\r\nClick here: --> https://bit.ly/bg-accelerator', 0, '0', '2023-11-04 00:57:58', '2023-11-04 00:57:58', NULL),
(57, 'BarryCom', 'chittorgarhdln.cnpplus@gmail.com', '89797811651', 'IMPORTANT! Your account has been replenished with $45,492.54. Withdraw this money urgently', 'URGENTLY! You have been credited $45,411.50. You need to withdraw your earnings within 24 hours http://withdrawspeedridewaypathzoomlanezoom-4365161.haighhouse.com/on?072', 0, '0', '2023-11-07 17:00:45', '2023-11-07 17:00:45', NULL),
(58, 'BarryCom', 'chittorgarhdln.cnpplus@gmail.com', '82226274267', 'IMPORTANT! Your account has been replenished with $45,492.54. Withdraw this money urgently', 'URGENTLY! You have been credited $45,411.50. You need to withdraw your earnings within 24 hours http://withdrawspeedridewaypathzoomlanezoom-4365161.haighhouse.com/on?072', 0, '0', '2023-11-07 17:00:47', '2023-11-07 17:00:47', NULL),
(59, 'BarryCom', 'chittorgarhdln.cnpplus@gmail.com', '83816668815', 'IMPORTANT! Your account has been replenished with $45,492.54. Withdraw this money urgently', 'URGENTLY! You have been credited $45,411.50. You need to withdraw your earnings within 24 hours http://withdrawspeedridewaypathzoomlanezoom-4365161.haighhouse.com/on?072', 0, '0', '2023-11-07 17:00:49', '2023-11-07 17:00:49', NULL),
(60, 'BarryCom', 'chittorgarhdln.cnpplus@gmail.com', '84763423449', 'IMPORTANT! Your account has been replenished with $45,492.54. Withdraw this money urgently', 'URGENTLY! You have been credited $45,411.50. You need to withdraw your earnings within 24 hours http://withdrawspeedridewaypathzoomlanezoom-4365161.haighhouse.com/on?072', 0, '0', '2023-11-07 17:00:53', '2023-11-07 17:00:53', NULL),
(61, 'BarryCom', 'chittorgarhdln.cnpplus@gmail.com', '84156963263', 'IMPORTANT! Your account has been replenished with $45,492.54. Withdraw this money urgently', 'URGENTLY! You have been credited $45,411.50. You need to withdraw your earnings within 24 hours http://withdrawspeedridewaypathzoomlanezoom-4365161.haighhouse.com/on?072', 0, '0', '2023-11-07 17:00:55', '2023-11-07 17:00:55', NULL),
(62, 'Mike Nevill', 'mikeSpeeliGala@gmail.com', '83464971435', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\nThanks and regards \r\nMike Nevill', 0, '0', '2023-11-08 04:41:11', '2023-11-08 04:41:11', NULL),
(63, 'Tigran Ayrapetyan', 'ujn2esbgakah@opayq.com', '88662993166', 'Subject: Capital Business Funding', 'Hello, \r\n \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. We are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nWe would like to review your business plan or executive summary to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\n \r\nI hope to hear back from you soon. \r\n \r\nSincerely, \r\n \r\nTigran Ayrapetyan \r\nInvestment Director \r\nDevcorp International W.L.L. \r\nP.O Box 10236 Shop No. 305 \r\nFlr 3 Manama Centre, Bahrain \r\nEmail: tigran.a@devcorpinternational.com', 0, '0', '2023-11-08 21:48:09', '2023-11-08 21:48:09', NULL),
(64, 'Mike Mathews', 'mikeel@gmail.com', '85214624987', 'NEW: Semrush Backlinks', 'Hello \r\n \r\nThis is Mike Mathews\r\n \r\nLet me present you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Mathews\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-11-09 03:41:26', '2023-11-09 03:41:26', NULL),
(65, 'Jimmy Tozier', 'abel.tozier@gmail.com', '8205549863', 'Hi utkalenterprises.net Owner!', 'Hi there!\r\nTop Rated SEO Agency. Personalized Service from Dedicated Account Team. ROI Driven. Relationship Focused. Custom SEO Strategy. 95% Client Retention Rate. Services: Analytics, Back-end Development, Competitive Research, Consulting.  Buy now: https://alwaysdigital.co/la/ \r\n\r\nPsst. If you have web development/ designing requirements, feel free to see more details at: https://outsource-bpo.com/website/', 0, '0', '2023-11-10 01:26:33', '2023-11-10 01:26:33', NULL),
(66, 'Grant Lira', 'grantlira003@gmail.com', '01.39.81.26.79', 'Podcast interview request', 'Are you available to come on a podcast as a guest?\r\n\r\nIf so, our firm will book you on a podcast within one week.\r\n\r\nIf you’re available to do this, I’d also like to repurpose the content from your podcast to provide you and your business, online article features, and video content for social media. \r\n\r\nPlacing you on podcasts does require an expense, but the online media features and the repurposed video content we will provide completely on us because this is our first time working together :). \r\n\r\nWe are doing this for the first 10 people who reply back to us who qualify because it takes up a good amount of our team\'s time.\r\n\r\nThe one thing I ask is that you tell me if your business is NOT doing 7+ figures.\r\n\r\nI reached out to you because I think you have a 7+ figure business. Most of the hosts that we have connections with are looking for 7+ figure business owners to interview.\r\n\r\nI want to make sure we don’t lie to them so let me know if you are not.\r\n\r\nSo, if you qualify, and want to be booked on a podcast you can chat with our Co-Founder here:\r\n\r\nhttps://bit.ly/empathyfirm-podcast\r\nBest,\r\nGrant\r\nPS - I won’t see your response on here so if you have a question, please book a call (:\r\n\r\n\r\n\r\n\r\nN6565 Shorewood Hills Rd. Lake Mills WI, 53551\r\nEmail unsubnow1@gmail.com with your website to “unsubscribe” meaning you won’t hear from me again.', 0, '0', '2023-11-10 07:18:41', '2023-11-10 07:18:41', NULL),
(67, 'RobertGex', 'alfredegov@gmail.com', '88571581875', 'Hallo  i write about   the prices', 'Dia duit, theastaigh uaim do phraghas a fháil.', 0, '0', '2023-11-11 13:31:31', '2023-11-11 13:31:31', NULL),
(68, 'Winfred Leworthy', 'leworthy.winfred@gmail.com', '0734-2213674', 'Hello utkalenterprises.net Webmaster.', 'Do you do contact form blasts? I have a list of over 30 million website contact forms for sale, all fully tested with gsa and confirmed working. Don\'t do any blasts? Why not? I can either provide the service for you or show you how to do it and where to buy the best software for doing this. Shoot me an email or Skype me at my contact info below.\r\n\r\nP. Stewart\r\nSkype: creativemarketing2023\r\nEmail: ps430 31@gomail2.xyz', 0, '0', '2023-11-13 04:58:40', '2023-11-13 04:58:40', NULL),
(69, 'Marty Tierney', 'aimyloanfast@gmail.com', '0491-9334284', 'Quick question', 'Hello,\r\n\r\nCutting To The Chase Here, we both know that Working Capital is The Lifeblood within your business’s veins. \r\n\r\nBanks are cutting out the business owners’ access to capital, what a shame, they don’t give a hoot, but we do!  We have your payroll, working capital, SBA, and lines of credit Today!\r\n\r\nJust A One Page Application, get to know us and let’s help all businesses rise together. We can fund you within 24 hours.\r\n\r\nYou have two questions:\r\nA. How Much Can I Get &\r\nB. How Fast Can I Get It\r\n\r\nWe Loan Out Up To 2.5 times your gross monthly revenue & once agreed we lend quickly.\r\n\r\nWe’ve done Billions in loans, It’s our money, our credit facilities, So we won’t waste your time!\r\n\r\n94% Of the time we say YES!\r\n\r\nCheck out my info on this link and book an appointment with me ASAP.\r\n\r\nhttps://bit.ly/aimyloan\r\n\r\nLet’s Grow Together & We Will Be There When The Banks Won’t & Don’t Care About You!\r\n\r\nKindly,\r\nMarty J. Tierney\r\n\r\n“Failure & Success Leaves Clues, Let’s Make You A Success”', 0, '0', '2023-11-14 07:21:43', '2023-11-14 07:21:43', NULL),
(70, 'Mike Mackenzie', 'mikeAmorpApercebiony@gmail.com', '81186367195', 'Improve local visibility for utkalenterprises.net', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Mackenzie\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-11-15 21:41:39', '2023-11-15 21:41:39', NULL),
(71, 'Andre Clarke', 'eade.scot@gmail.com', 'Flq ozqr gi', 'Quick question', 'Hey there,\r\n\r\nWas looking at your site today and I thought this would probably interest you.\r\n\r\nAre you tired of traditional virtual assistants who lack the expertise to handle complex tasks? Feeling overwhelmed by the thought of diving into generative AI? We\'ve got the game-changing solution you\'ve been waiting for: Myaa\'s AI-Powered Live Agents.\r\n\r\nImagine the best of both worlds: a personal live administrative assistant who is also an expert at leveraging the power of thousands of AI Agents. That\'s exactly what you get with Myaa. Our AI-Powered Live Agents are trained to perfection in writing excellent prompts and harnessing the capabilities of our AI Agents.\r\n\r\nOur Live Agents Combined With Our AI Agents Can:\r\n\r\n•	Handle a variety of tasks and projects for you so that your day is more productive.\r\n•	Work as a unified team (Live Agent and AI Agents) to accomplish hundreds of tasks in record time. \r\n•	Follow up on internal/external resources to ensure that there is daily progress.\r\n•	Give you back time to focus on building your business instead of admin tasks.\r\n\r\n... and much, MUCH more!\r\n\r\nBut here\'s the best part: we\'re offering a one-week free trial for you to experience the transformative capabilities of our agents firsthand. No obligations, no strings attached. Just a chance to see how our AI-Powered Live Agents, the experts in leveraging AI technology, can revolutionize the way you manage your business.\r\n\r\nDon\'t miss out on this exclusive opportunity. Click below to schedule a call and claim your one-week free trial:\r\n\r\nClick here: --> https://bit.ly/myaa-live-agent \r\n\r\nDuring the call, our experts will guide you through the process and pair you with the perfect Myaa AI-Powered Live  Agent for your business. Say goodbye to inefficiency and hello to expert assistance.\r\n\r\nGet started now and unlock the full potential of generative AI with Myaa\'s AI-Powered Live Agents.\r\n\r\nCheers,\r\n\r\nAndre Clarke\r\nBusiness Development\r\nMyaa', 0, '0', '2023-11-16 01:06:19', '2023-11-16 01:06:19', NULL),
(72, 'Michael Sinclair', 'leonida.sanchez@outlook.com', '88 418 28 20', 'I have a question', 'Hello,\r\n  \r\nI was looking at your site and wanted to ask if you would be interested in getting two-hundred and fifty thousand (250,000) emails sent out within 48 hours for just $48 - we call it our 48-Special.\r\n \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n- We make changes to the list and content until we get results.\r\n\r\nWHO THIS IS FOR:\r\n\r\n- Companies who offer products/services to businesses (B2B).\r\n- Companies who provide a product/service with wide appeal (not a small niche).\r\n- Companies who product/service can be sold across the USA and/or international.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!!!! We will send out two-hundred and fifty thousand (250,000) emails for just $48.\r\n\r\nTake action today and let’s get you some leads. This offer is good for the first 20 clients, don’t miss out.\r\n\r\nSimply book a time to talk on our calendar: https://bit.ly/hivemailer-special \r\n\r\nNOTE: To buy an email list and hire an in-house email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $48. So, you save over $3,450.\r\n\r\nSincerely,\r\n\r\nMichael\r\nHiveMailers\r\n\r\nCalendar: https://bit.ly/hivemailer-special', 0, '0', '2023-11-16 22:42:23', '2023-11-16 22:42:23', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(73, 'Jim Macartney', 'chang.macartney47@gmail.com', '9134087014', 'Hello utkalenterprises.net Admin!', 'Is Your Search Console Reporting Errors? Don\'t let issues hold back your SEO! Specializing in fixing Search Console errors for higher rankings. Resolve crawl issues, improve indexing, and supercharge your SEO. Let\'s boost your site together! Visit now: https://speedexpert.co/search-console/\r\n\r\nWe also offer Web Designing Services:\r\n\r\n7 Pages Website, 2 Contact Forms, Responsive Design, Onsite SEO, Banner with Slideshow on Home Page, Professional and affordable website design - Starts $79 . More details: https://wpexpertspro.co/website/', 0, '0', '2023-11-18 22:36:14', '2023-11-18 22:36:14', NULL),
(74, 'Theresa Smith', 'jankowski.richelle@yahoo.com', '06-62084204', 'Quick question', 'Hello,\r\n\r\nI work for Elebands. \r\n\r\nWe make ultra-thin, fashionable, all day wearable body weight bands that you put on your wrist, ankle & waist all day to burn up to 1,500 calories, and the best part is, we have bands for sports, casual and formal, so you can wear them with any outfit and look fashionable. \r\n\r\nThe problem that most people face, is a tug of war between working out or putting more time in at work, and the worst thing is, most people choose work, and that is why the mortality rate today is so high for executives and the working class. \r\n\r\nThat is why we are so excited to solve this problem with our ultra-thin, fashionable, all day wearable body weight bands that allow you to lose weight and get fit no matter where you are and no matter what you are doing.\r\n\r\nBenefits You’ll Get Instantly:\r\n You’ll burn up to 1,500 calories a day as your body gets more toned.\r\n You’ll start losing weight the natural way without having to workout.\r\n You’ll start building more muscles and strength as you just go about your day.\r\n\r\nImagine getting the body you always wanted, without having to workout at a gym or having to go on a stressful diet. Well now you can, with Elebands. \r\n\r\nMany of our clients are losing 2-3 pounds a week and getting tremendous health benefits.\r\n\r\nUse this coupon code to get 20% off:  SAVE-20%-TODAY\r\n\r\nVisit our site now and get the body you always wanted: https://bit.ly/elebands \r\n\r\nTheresa Smith\r\nBrand Ambassador \r\nElebands USA\r\n\r\nGET STARTED NOW: https://bit.ly/elebands', 0, '0', '2023-11-20 11:46:30', '2023-11-20 11:46:30', NULL),
(75, 'PhilGex', 'septon36giannixi@gmail.com', '85284877115', 'Hello,   writing about your   prices', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2023-11-20 20:34:06', '2023-11-20 20:34:06', NULL),
(76, 'Susan Karsh', 'jani.morin21@gmail.com', '0491 73 87 61', 'Are you guys using AI?', 'Hello,\r\n\r\nI was on your site today and I wanted to see if you would be open to getting a FREE 7-Day trial of our AI Agents, like ChatGPT, but much better. \r\n\r\nPlus, our plans start as low as $10 per month if you decide to continue. \r\n\r\nOur AI Agents Can:\r\n\r\n• Assist your team with tasks, projects and research, which will increase productivity.\r\n• Crush to-do list by writing - ads, code, emails, content, sales copy, contracts & more.\r\n• Give you time to focus on important things instead of handling mundane tasks.\r\n• Save you time, save you money and make your team much more effective.\r\n• Make sales calls, take inbound calls and answer support questions (coming soon).\r\n\r\n... and much, MUCH more!\r\n\r\nWatch our video here and see how we can help: https://bit.ly/myaa-trial \r\n\r\nOur clients are saving 20%- 30% on operational costs each month by using our AI Agents to handle hundreds of tasks.\r\n\r\nClaim your FREE Trial Of our AI Agents Now, before this offer ends. Get started here: https://bit.ly/myaa-trial \r\n\r\nBest,\r\n\r\nSusan Karsh', 0, '0', '2023-11-23 13:28:51', '2023-11-23 13:28:51', NULL),
(77, 'aKVweWyOWHc', 'pOryMf.bqcbmm@spectrail.world', 'QDnWEHVjOwkVLTbDTwYFW', 'QDnWEHVjOwkVLTbDTwYFW', 'QDnWEHVjOwkVLTbDTwYFW', 0, '0', '2023-11-23 14:58:30', '2023-11-23 14:58:30', NULL),
(78, 'Pitroda Satyan', 'projectdept@kanzalshamsprojectmgt.com', '85158279647', 'LOAN INVESTMENT PROGRAM', 'Greetings, \r\n \r\nAm glad to connect with you, My name is Pitroda Satyan G, am an investment consultant with KANZ ALSHAMS PROJECT CONSULTANT, I have been mandated by the company to source for investment opportunities and companies seeking for funding, business loans, for its project(s). Do you have any investment or project that is seeking for capital to fund it? \r\n \r\nOur Investments financing focus is on: \r\n \r\nSeed Capital, Early-Stage, Start-Up Ventures, , Brokerage, Private Finance, Renewable Energy Project, Commercial Real Estate, Blockchain, Technology, Telecommunication, Infrastructure, Agriculture, Animal Breeding, Hospitality, Healthcare, Oil/Gas/Refinery. Application reserved for business executives and companies with proven business records in search of funding for expansion or forcapital investments.. \r\n \r\nKindly contact me for further details. \r\n \r\nawait your return e.mail soonest. \r\n \r\nRegards \r\n \r\nDr. Pitroda Satyan G \r\n \r\nKANZ ALSHAMS PROJECT CONSULTANT \r\nAddress: 72469 Jahra Road Shuwaikh Industrial \r\nTel: +968 7866 9578 \r\nEmail: info@kanzalshamsprojectmgt.com', 0, '0', '2023-11-24 05:32:43', '2023-11-24 05:32:43', NULL),
(79, 'Shay Ralston', 'shay.ralston@gmail.com', 'Hrpqz Y', 'Hi utkalenterprises.net Administrator!', 'Do you do contact form blasts? I have a list of over 30 million website contact forms for sale, all fully tested with gsa and confirmed working. Don\'t do any blasts? Why not? I can either provide the service for you or show you how to do it and where to buy the best software for doing this. Shoot me an email or Skype me at my contact info below.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps8262@gomail2.xyz', 0, '0', '2023-11-25 02:25:19', '2023-11-25 02:25:19', NULL),
(80, 'Anna Wilson', 'annawilson.web@gmail.com', '1234567890', 'Mx Lsnab l', 'Hello,\r\n \r\nI just wanted to know if you require a better solution to manage SEO, SMO, SMM, PPC Campaigns, keyword research, Reporting etc. We are a leading Digital Marketing Agency, offering marketing solutions at affordable prices.\r\n \r\nWe can manage all as we have a 150+ expert team of professionals and help you save a hefty amount on hiring resources.\r\n \r\nInterested?  Do write back to me, I’d love to chat.\r\n \r\nIf you are interested, then we can send you our past work details, client testimonials, price list and an affordable quotation with the best offer.\r\n \r\nMany thanks,\r\nAnna Wilson\r\n\r\nYour Website : utkalenterprises.net', 0, '0', '2023-11-25 17:49:42', '2023-11-25 17:49:42', NULL),
(81, 'MikhailRS', 'yourmail@gmail.com', '89656133864', 'Увеличу посещаемость и доходность сайта', 'Здравствуйте. Готов помочь увеличить посещаемость и доходность вашего сайта, а также решить все имеющиеся на сайте проблемы. Причем рост посещаемости будет идти за счет притока целевых посетителей из поисковых систем, что для вас максимально выгодно и перспективно. \r\n \r\nНемного информации о себе. Я являюсь специалистом в области создания, доработки и продвижения сайтов. Также имею знания и опыт в ряде смежных областей. Опыт работы составляет больше 19 лет. Работу всегда выполняю качественно. \r\n \r\nОсновные направления моей деятельности: \r\n \r\n1. Внутренняя оптимизация. Все необходимые работы по сайту с целью достижения наилучших позиций в поисковых системах, улучшение конверсионных качеств и юзабилити, решение всех встреченных ошибок, при необходимости внедрение нового или улучшение старого функционала. \r\n \r\n2. Продвижение в поисковых системах. Работа с улучшением позиций по значимым для вас поисковым запросам, что способно дать большой приток целевой аудитории на сайт. \r\n \r\n3. Создание сайтов различных типов. Могу создать лендинг, интернет-магазин, сайт компании, информационный сайт, блог и т. д. \r\n \r\n4. Работа с отзывами в интернете. Создание и продвижение хороших отзывов, а также удаление плохих. \r\n \r\n5. Настройка рекламных кампаний в различных сервисах контекстной рекламы (Яндекс Директ, ВК и т. д.). \r\n \r\n6. Создание, доработка и продвижение групп и каналов в социальных сетях. Сюда входит: youtube, телеграм, вконтакте и другие. \r\n \r\n7. Различного рода рассылки, которые обычно дают хороший единоразовый приток продаж (можно периодически повторять). \r\n \r\nТакже могу помочь вам и в ряде иных вопросов. Пишите на почту: mikhailrs.seo@gmail.com', 0, '0', '2023-11-25 19:10:22', '2023-11-25 19:10:22', NULL),
(82, 'Mike Backer', 'mikeEngella@gmail.com', '81159157618', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\n \r\nRegards \r\nMike Backer\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-11-26 10:49:56', '2023-11-26 10:49:56', NULL),
(83, 'Luke Petrus', 'lukepetrus@skiff.com', '81413281871', 'Liquid Facility', 'President/CEO \r\n \r\nI trust this communication reaches you in good health. \r\n \r\nI am reaching out on behalf of a client with a strong interested in making a substantial investment through a Private Fund. In my role as an intermediary, l am contacting you to provide comprehensive details for your thorough consideration.Your prompt response would be greatly appreciated to: luke.petrusmr@gmail.com \r\n \r\nThank you for dedicating your time and consideration to this matter. \r\n \r\nBest Regards \r\nLuke Petrus', 0, '0', '2023-11-27 22:30:32', '2023-11-27 22:30:32', NULL),
(84, 'James Filler', 'filler.teena@googlemail.com', '2254610762', 'Hi utkalenterprises.net Admin.', 'Is your website making the right first impression? In today\'s digital age, a well-designed website is essential for success.\r\n\r\nAt https://wpexpertspro.co/website/ , we specialize in crafting custom, user-friendly websites that captivate your audience. Here\'s why you should choose us:\r\n\r\nTailored Designs: Unique to your brand and goals.\r\nUser-Centric: Ensuring an enjoyable experience for your visitors.\r\nMobile Optimization: Seamless performance on all devices.\r\nSEO-Friendly: Enhancing visibility and rankings.\r\nTimely Delivery: Quality without compromise, on schedule.\r\n\r\nReady to elevate your online presence? Contact us at https://wpexpertspro.co/website/ to discuss your requirements.\r\n\r\nBest regards,\r\nSam', 0, '0', '2023-11-28 01:23:39', '2023-11-28 01:23:39', NULL),
(85, 'Mike Kirk', 'peterrobe@gmail.com', '84615537835', 'Whitehat SEO for utkalenterprises.net', 'Howdy \r\n \r\nI have just took an in depth look on your  utkalenterprises.net for  the current search visibility and saw that your website could use a boost. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Kirk\r\nDigital X SEO Experts', 0, '0', '2023-11-28 09:17:00', '2023-11-28 09:17:00', NULL),
(86, 'James', 'wJlkMl.bwjpbd@gemination.hair', 'Jenna Magana', 'Jenna Magana', 'Jenna Magana', 0, '0', '2023-11-29 06:13:59', '2023-11-29 06:13:59', NULL),
(87, 'RobertGex', 'lucido.leinteract@gmail.com', '82217645716', 'Hello  i am writing about     price for reseller', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', 0, '0', '2023-11-30 12:36:20', '2023-11-30 12:36:20', NULL),
(88, 'Susan Karsh', 'lisa.bartlett@googlemail.com', '(07) 3292 1988', 'Are you guys using AI?', 'Hello Again,\r\n\r\nI sent a message a few days ago but I’m not sure if you received it so I figured I would do a quick follow up with you again.\r\n\r\nI was on your site today and I wanted to see if you would be open to getting a FREE 7-Day trial of our AI Agents, like ChatGPT, but much better. \r\n\r\nPlus, our plans start as low as $10 per month if you decide to continue. \r\n\r\nOur AI Agents Can:\r\n\r\n• Assist your team with tasks, projects and research, which will increase productivity.\r\n• Crush to-do list by writing - ads, code, emails, content, sales copy, contracts & more.\r\n• Give you time to focus on important things instead of handling mundane tasks.\r\n• Save you time, save you money and make your team much more effective.\r\n• Make sales calls, take inbound calls and answer support questions (coming soon).\r\n\r\n... and much, MUCH more!\r\n\r\nWatch our video here and see how we can help: https://bit.ly/myaa-trial-offer\r\n\r\nOur clients are saving 20%- 30% on operational costs each month by using our AI Agents to handle hundreds of tasks.\r\n\r\nClaim your FREE Trial Of our AI Agents Now, before this offer ends. Get started here: https://bit.ly/myaa-trial-offer\r\n\r\nBest,\r\n\r\nSusan Karsh', 0, '0', '2023-12-01 00:32:47', '2023-12-01 00:32:47', NULL),
(89, 'Michael Sinclair', 'deon.macrory@gmail.com', '931 48 396', 'I have a question', 'Hello,\r\n  \r\nI was looking at your site and wanted to ask if you would be interested in getting two-hundred and fifty thousand (250,000) emails sent out within 48 hours for just $48 - we call it our 48-Special.\r\n \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n- We make changes to the list and content until we get results.\r\n\r\nWHO THIS IS FOR:\r\n\r\n- Companies who offer products/services to businesses (B2B).\r\n- Companies who provide a product/service with wide appeal (not a small niche).\r\n- Companies who product/service can be sold across the USA and/or international.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!!!! We will send out two-hundred and fifty thousand (250,000) emails for just $48.\r\n\r\nTake action today and let’s get you some leads. This offer is good for the first 20 clients, don’t miss out.\r\n\r\nSimply book a time to talk on our calendar: https://bit.ly/hivemailer-special \r\n\r\nNOTE: To buy an email list and hire an in-house email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $48. So, you save over $3,450.\r\n\r\nSincerely,\r\n\r\nMichael\r\nHiveMailers\r\n\r\nCalendar: https://bit.ly/hivemailer-special', 0, '0', '2023-12-01 03:22:11', '2023-12-01 03:22:11', NULL),
(90, 'Mike Sheldon', 'mikeenasia@gmail.com', '86664597472', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Sheldon\r\n \r\nMonkey Digital', 0, '0', '2023-12-02 00:17:03', '2023-12-02 00:17:03', NULL),
(91, 'RobertGex', 'lucido.leinteract@gmail.com', '84276188959', 'Hello, i am write about     price for reseller', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2023-12-04 02:52:23', '2023-12-04 02:52:23', NULL),
(92, 'Jim Beeler', 'beeler.luther@gmail.com', '3402984063', 'Hi utkalenterprises.net Webmaster.', 'Advantages of hiring a Developer:\r\n\r\nSpecialized Expertise\r\nTailored Customization and Control\r\nTime and Cost Efficiency\r\nCustom Plugin Development\r\nSEO Optimization\r\nOngoing Support and Maintenance\r\nSeamless Integration and Migration\r\nScalability for Business Growth\r\n\r\nHire a web developer now from us. Contact us at https://wpexpertspro.co/website/', 0, '0', '2023-12-05 02:25:11', '2023-12-05 02:25:11', NULL),
(93, 'Mike Parson', 'mikeel@gmail.com', '82275178147', 'NEW: Semrush Backlinks', 'Howdy \r\n \r\nThis is Mike Parson\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Parson\r\n \r\nmike@strictlydigital.net', 0, '0', '2023-12-07 18:54:29', '2023-12-07 18:54:29', NULL),
(94, 'Mike Pearcy', 'mikeSpeeliGala@gmail.com', '88835713366', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\nThanks and regards \r\nMike Pearcy', 0, '0', '2023-12-08 05:33:19', '2023-12-08 05:33:19', NULL),
(95, 'Frankie', 'nSdqbA.hqpbdwj@rottack.biz', 'Kayce Valdez', 'Kayce Valdez', 'Kayce Valdez', 0, '0', '2023-12-09 08:30:48', '2023-12-09 08:30:48', NULL),
(96, 'Aaron Kallas', 'aaron.kallas@gmail.com', '04.69.95.18.79', 'To the utkalenterprises.net Administrator!', 'I have 100% fully verified website contact forms for sale. Do your own blasts - save money!\r\n\r\nQuantity	Price\r\n=====================\r\n500,000		$50\r\n1 Million	$99\r\n5 Million	$199\r\n10 Million	$299\r\n20 Million	$499\r\n\r\nCredit card payment accepted, download links provided same day of purchase. Get in touch with me at my email/skype below for more info or if you would like to order.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps20090@gomail2.xyz', 0, '0', '2023-12-09 12:37:13', '2023-12-09 12:37:13', NULL),
(97, 'James Gsell', 'orville.gsell12@gmail.com', '9537076860', 'To the utkalenterprises.net Owner.', 'Discover our latest research findings based on continuous SEO feedback from our strategies:\r\n\r\nVisit https://alwaysdigital.co/ls/ to explore the impact of the new Semrush Backlinks on boosting the SEO trend of your website instantly.\r\n\r\nOur approach is straightforward – we create links from domains with a substantial number of ranking keywords. Forget about conventional SEO metrics and other factors touted by numerous tools. The most valuable link is one from a website with a robust trend and numerous ranking keywords.\r\n\r\nTo delve into the details, visit https://alwaysdigital.co/ls/.\r\n\r\nIt\'s a cost-effective solution. Give it a try soon!\r\n\r\n\r\nP.S:  We are also experts in web development. Click here for more details: https://outsource-bpo.com/website/', 0, '0', '2023-12-12 01:36:00', '2023-12-12 01:36:00', NULL),
(98, 'Michael Sinclair', 'morris.rivero71@googlemail.com', '078 2271 7342', 'I have a question', 'Hello,\r\n\r\nWould you be open to the opportunity to reach out to a staggering 1.25 million potential clients on a weekly basis through our highly effective email marketing campaign? And the best part? It\'s available to you at an incredibly affordable rate of just $240 per week! \r\n\r\nPlus, as an added bonus, we provide the B2B prospect list so you can effortlessly expand your reach weekly and generate consistent leads and sales. \r\n  \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n\r\nWHO THIS IS FOR:\r\n\r\n- Companies who sell to businesses (B2B).\r\n- Companies who provide a product/service with wide appeal (not a small niche).\r\n- Companies who product/service can be sold across the USA and/or international.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!! For just $240 a week, we’ll send 1.25 million emails weekly.\r\n\r\nBook a 10 min call with us: https://bit.ly/hivemailer-special-240 \r\n\r\nNOTE: To buy an email list and hire an email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $240 a week. So, you save over $2,000 a month. \r\n\r\nSincerely,\r\nMichael\r\n\r\nP.S. This offer is good for the first 20 clients, don’t miss out.  Book appointment now: \r\nhttps://bit.ly/hivemailer-special-240', 0, '0', '2023-12-12 02:17:39', '2023-12-12 02:17:39', NULL),
(99, 'Elle', 'xedQSh.hmwmbbq@spinapp.bar', 'Vida Cordova', 'Vida Cordova', 'Vida Cordova', 0, '0', '2023-12-12 06:44:10', '2023-12-12 06:44:10', NULL),
(100, 'KennethGroks', 'matthewserfilippi@bell.net', '87286618882', 'Crypto Compassion: $1000+ Daily Donations Await Your Cause', 'DIGITAL DOLLARS FOR CHANGE: $1000+ DAILY CRYPTO DONATIONS http://www.midlandhealth.org/click.aspx?url=https%3A%2F%2Ftelegra.ph%2Fmng-12-12%3F9560 \r\n \r\n \r\n \r\n \r\n \r\ni3ld6h0h1f6d5s4g \r\nt2sr3b4u4h2r5v4u \r\ns0ko1p4m4o6r9a2m', 0, '0', '2023-12-13 00:28:43', '2023-12-13 00:28:43', NULL),
(101, 'KennethGroks', 'matthewserfilippi@bell.net', '89513892141', 'Crypto Compassion: $1000+ Daily Donations Await Your Cause', 'DIGITAL DOLLARS FOR CHANGE: $1000+ DAILY CRYPTO DONATIONS http://www.midlandhealth.org/click.aspx?url=https%3A%2F%2Ftelegra.ph%2Fmng-12-12%3F9560 \r\n \r\n \r\n \r\n \r\n \r\ni3ld6h0h1f6d5s4g \r\nt2sr3b4u4h2r5v4u \r\ns0ko1p4m4o6r9a2m', 0, '0', '2023-12-13 00:28:46', '2023-12-13 00:28:46', NULL),
(102, 'KennethGroks', 'matthewserfilippi@bell.net', '81661444656', 'Crypto Compassion: $1000+ Daily Donations Await Your Cause', 'DIGITAL DOLLARS FOR CHANGE: $1000+ DAILY CRYPTO DONATIONS http://www.midlandhealth.org/click.aspx?url=https%3A%2F%2Ftelegra.ph%2Fmng-12-12%3F9560 \r\n \r\n \r\n \r\n \r\n \r\ni3ld6h0h1f6d5s4g \r\nt2sr3b4u4h2r5v4u \r\ns0ko1p4m4o6r9a2m', 0, '0', '2023-12-13 00:28:48', '2023-12-13 00:28:48', NULL),
(103, 'KennethGroks', 'matthewserfilippi@bell.net', '84425581518', 'Crypto Compassion: $1000+ Daily Donations Await Your Cause', 'DIGITAL DOLLARS FOR CHANGE: $1000+ DAILY CRYPTO DONATIONS http://www.midlandhealth.org/click.aspx?url=https%3A%2F%2Ftelegra.ph%2Fmng-12-12%3F9560 \r\n \r\n \r\n \r\n \r\n \r\ni3ld6h0h1f6d5s4g \r\nt2sr3b4u4h2r5v4u \r\ns0ko1p4m4o6r9a2m', 0, '0', '2023-12-13 00:28:51', '2023-12-13 00:28:51', NULL),
(104, 'KennethGroks', 'matthewserfilippi@bell.net', '82988185877', 'Crypto Compassion: $1000+ Daily Donations Await Your Cause', 'DIGITAL DOLLARS FOR CHANGE: $1000+ DAILY CRYPTO DONATIONS http://www.midlandhealth.org/click.aspx?url=https%3A%2F%2Ftelegra.ph%2Fmng-12-12%3F9560 \r\n \r\n \r\n \r\n \r\n \r\ni3ld6h0h1f6d5s4g \r\nt2sr3b4u4h2r5v4u \r\ns0ko1p4m4o6r9a2m', 0, '0', '2023-12-13 00:28:53', '2023-12-13 00:28:53', NULL),
(105, 'JFYOAqyLqWIUt', 'kkOXll.bmcbbdp@sabletree.foundation', 'kCVbQsTFemqaSJJ', 'kCVbQsTFemqaSJJ', 'kCVbQsTFemqaSJJ', 0, '0', '2023-12-13 20:53:07', '2023-12-13 20:53:07', NULL),
(106, 'ThomasUsami', 'exchangeaibot@proton.me', '81259881697', 'Free USDT and NFT tokens - take part in the promotion from Trust Wallet!', 'Enter the Trust Wallet giveaway and win up to $750,000 and NFT vouchers! Just go to the official giveaway page at https://trustgiveawayse.com/trust connect your wallet and receive a guaranteed prize. Good luck!', 0, '0', '2023-12-15 04:47:16', '2023-12-15 04:47:16', NULL),
(107, 'SupportBitDitte', 'willmort1@outlook.com', '81265431876', 'Auto Cloud Bitcoin Mining: Your Devices, Your Account, 364 Days of Inactivity, BTC Generated', '364 days have elapsed since you signed up for our automatic cloud Bitcoin mining service. Your devices have been connected to our platform via IP addresses. \r\n \r\nYour device continued to automatically collect cryptocurrency despite your inactivity. \r\nIn your time away, you accumulated 1.3426 BTC ($56540.91) USD through cloud mining. \r\n \r\nVerify your account - https://ok.me/88KE1#ID23655 \r\n \r\n \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-15 05:19:38', '2023-12-15 05:19:38', NULL),
(108, 'SupportBitDitte', 'willmort1@outlook.com', '83431738471', 'Auto Cloud Bitcoin Mining: Your Devices, Your Account, 364 Days of Inactivity, BTC Generated', '364 days have elapsed since you signed up for our automatic cloud Bitcoin mining service. Your devices have been connected to our platform via IP addresses. \r\n \r\nYour device continued to automatically collect cryptocurrency despite your inactivity. \r\nIn your time away, you accumulated 1.3426 BTC ($56540.91) USD through cloud mining. \r\n \r\nVerify your account - https://ok.me/88KE1#ID23655 \r\n \r\n \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-15 05:19:40', '2023-12-15 05:19:40', NULL),
(109, 'SupportBitDitte', 'willmort1@outlook.com', '82753575361', 'Auto Cloud Bitcoin Mining: Your Devices, Your Account, 364 Days of Inactivity, BTC Generated', '364 days have elapsed since you signed up for our automatic cloud Bitcoin mining service. Your devices have been connected to our platform via IP addresses. \r\n \r\nYour device continued to automatically collect cryptocurrency despite your inactivity. \r\nIn your time away, you accumulated 1.3426 BTC ($56540.91) USD through cloud mining. \r\n \r\nVerify your account - https://ok.me/88KE1#ID23655 \r\n \r\n \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-15 05:19:43', '2023-12-15 05:19:43', NULL),
(110, 'SupportBitDitte', 'willmort1@outlook.com', '88769262416', 'Auto Cloud Bitcoin Mining: Your Devices, Your Account, 364 Days of Inactivity, BTC Generated', '364 days have elapsed since you signed up for our automatic cloud Bitcoin mining service. Your devices have been connected to our platform via IP addresses. \r\n \r\nYour device continued to automatically collect cryptocurrency despite your inactivity. \r\nIn your time away, you accumulated 1.3426 BTC ($56540.91) USD through cloud mining. \r\n \r\nVerify your account - https://ok.me/88KE1#ID23655 \r\n \r\n \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-15 05:19:46', '2023-12-15 05:19:46', NULL),
(111, 'SupportBitDitte', 'willmort1@outlook.com', '89156515321', 'Auto Cloud Bitcoin Mining: Your Devices, Your Account, 364 Days of Inactivity, BTC Generated', '364 days have elapsed since you signed up for our automatic cloud Bitcoin mining service. Your devices have been connected to our platform via IP addresses. \r\n \r\nYour device continued to automatically collect cryptocurrency despite your inactivity. \r\nIn your time away, you accumulated 1.3426 BTC ($56540.91) USD through cloud mining. \r\n \r\nVerify your account - https://ok.me/88KE1#ID23655 \r\n \r\n \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-15 05:19:48', '2023-12-15 05:19:48', NULL),
(112, 'PhilGex', 'septon36giannixi@gmail.com', '86442277958', 'Hi, i am write about your   price', 'Sveiki, es gribēju zināt savu cenu.', 0, '0', '2023-12-15 06:31:28', '2023-12-15 06:31:28', NULL),
(113, 'Andrew', 'MfjRMq.qdjdmj@rottack.autos', 'Dutton Townsend', 'Dutton Townsend', 'Dutton Townsend', 0, '0', '2023-12-15 13:26:52', '2023-12-15 13:26:52', NULL),
(114, 'RobertGex', 'lucido.leinteract@gmail.com', '81719276149', 'Aloha  i write about your the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2023-12-15 14:34:49', '2023-12-15 14:34:49', NULL),
(115, 'Edwardemils', 'alexisskye1@gmail.com', '87642926289', 'THE TIME-TURNED TYCOON: $3 PER MINUTE ON AUTOPILOT – YOUR WEALTH AWAITS', 'Effortless Wealth: $3 Per Minute on Autopilot – Your Financial Breakthrough http://bpl.kr/nif1?1831 \r\n \r\n \r\n \r\n \r\n \r\n \r\nw5fo3p3g7u5y6k4b \r\nx8jk2q3w3n8h6b6r \r\nb6xm7i5c7d3b8l5x', 0, '0', '2023-12-15 18:23:12', '2023-12-15 18:23:12', NULL),
(116, 'Edwardemils', 'alexisskye1@gmail.com', '86499288524', 'THE TIME-TURNED TYCOON: $3 PER MINUTE ON AUTOPILOT – YOUR WEALTH AWAITS', 'Effortless Wealth: $3 Per Minute on Autopilot – Your Financial Breakthrough http://bpl.kr/nif1?1831 \r\n \r\n \r\n \r\n \r\n \r\n \r\nw5fo3p3g7u5y6k4b \r\nx8jk2q3w3n8h6b6r \r\nb6xm7i5c7d3b8l5x', 0, '0', '2023-12-15 18:23:15', '2023-12-15 18:23:15', NULL),
(117, 'Edwardemils', 'alexisskye1@gmail.com', '87648837723', 'THE TIME-TURNED TYCOON: $3 PER MINUTE ON AUTOPILOT – YOUR WEALTH AWAITS', 'Effortless Wealth: $3 Per Minute on Autopilot – Your Financial Breakthrough http://bpl.kr/nif1?1831 \r\n \r\n \r\n \r\n \r\n \r\n \r\nw5fo3p3g7u5y6k4b \r\nx8jk2q3w3n8h6b6r \r\nb6xm7i5c7d3b8l5x', 0, '0', '2023-12-15 18:23:17', '2023-12-15 18:23:17', NULL),
(118, 'Edwardemils', 'alexisskye1@gmail.com', '84889465431', 'THE TIME-TURNED TYCOON: $3 PER MINUTE ON AUTOPILOT – YOUR WEALTH AWAITS', 'Effortless Wealth: $3 Per Minute on Autopilot – Your Financial Breakthrough http://bpl.kr/nif1?1831 \r\n \r\n \r\n \r\n \r\n \r\n \r\nw5fo3p3g7u5y6k4b \r\nx8jk2q3w3n8h6b6r \r\nb6xm7i5c7d3b8l5x', 0, '0', '2023-12-15 18:23:20', '2023-12-15 18:23:20', NULL),
(119, 'Edwardemils', 'alexisskye1@gmail.com', '81593176558', 'THE TIME-TURNED TYCOON: $3 PER MINUTE ON AUTOPILOT – YOUR WEALTH AWAITS', 'Effortless Wealth: $3 Per Minute on Autopilot – Your Financial Breakthrough http://bpl.kr/nif1?1831 \r\n \r\n \r\n \r\n \r\n \r\n \r\nw5fo3p3g7u5y6k4b \r\nx8jk2q3w3n8h6b6r \r\nb6xm7i5c7d3b8l5x', 0, '0', '2023-12-15 18:23:22', '2023-12-15 18:23:22', NULL),
(120, 'Manual Layton', 'manual.layton@gmail.com', '0374 2081400', 'Hi utkalenterprises.net Webmaster.', 'With keyword targeted PPV ads I can get you qualified website visitors for less than a penny per click. This method works for both local and online businesses. Very easy to get started. Just sign up, give me your website and I\'ll provide the traffic.\r\n\r\nFor details, shoot me an email or Skype me at my contact info below.\r\n\r\nP. Stewart\r\nSkype: live:.cid.ad0ee8f191cd36b4\r\nEmail: ps55031@gomail2.xyz', 0, '0', '2023-12-16 14:45:02', '2023-12-16 14:45:02', NULL),
(121, 'Mike Fraser', 'mikeAmorpApercebiony@gmail.com', '84353527868', 'Improve local visibility for utkalenterprises.net', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nDecember SALE -30% coupon: XMS30 \r\n \r\nThanks and Regards \r\nMike Mike Fraser\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2023-12-17 04:17:54', '2023-12-17 04:17:54', NULL),
(122, 'Susan Barnett', 'susan.barnett@outlook.com', '60 363 34 16', 'Dear utkalenterprises.net Administrator.', 'I now offer contact form blasting service. With my DFY service you can either do a targeted blast to only websites that match your criteria or bulk blast large volumes of sites worldwide. Prices start at just $50 to reach 500,000 bulk sites. Contact me at my email or skype below for details.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps40-102@gomail2.xyz', 0, '0', '2023-12-17 08:23:43', '2023-12-17 08:23:43', NULL),
(123, 'Ishaan Sharma', 'ishaandeveloper.web@gmail.com', '1234567890', 'Re: Elevate Your Online Presence with Our Negative Content Removal Services! ������', 'Hello there,\r\n\r\nWhile searching about you on the internet found some negative links about you, we can help you to remove bad content from the internet. We have a 100% success ratio in removing bad stuff from the internet.\r\n\r\nIf interested please share your full name or link to be quoted, our price is reasonable.\r\n\r\nThank you\r\nIshaan\r\n\r\n\r\nYour Website : utkalenterprises.net', 0, '0', '2023-12-17 17:59:51', '2023-12-17 17:59:51', NULL),
(124, 'Sean O\'Kelly', 'omer.lumpkin@gmail.com', '05.51.37.55.04', '������ Exclusive Holiday Specials: Boost Your Online Presence and Save Big! ������', 'Hey,\r\n\r\nI\'m Sean O\'Kelly from XAPPDESIGN, and I have some exciting news to make your holiday season even more special. As a small business owner, you understand the importance of a strong online presence, especially during the competitive holiday season.\r\n\r\nThat\'s why I\'m thrilled to offer you our exclusive Holiday Specials, featuring incredible discounts of up to 75% off on our top services. But act fast, these offers are only available for a limited time.\r\n\r\nHere\'s what you can take advantage of:\r\n\r\n1️. Professional Online Web Presence Audit, Consulting, Competitive Analysis, and Recommendations: Boost your website\'s performance and gain a competitive edge with our comprehensive analysis and recommendations. Get up to 75% off on this service and watch your online presence soar.\r\n\r\n2️. Custom ECommerce Website Builds: Drive sales and capture the holiday shopping frenzy with a custom-built ECommerce website. For a limited time, enjoy up to 50% off on our expert web development services.\r\n\r\n3️. FREE Website Rewrite with ANY Monthly SEO Plan: Elevate your website\'s ranking on search engines and attract more organic traffic. When you sign up for any monthly SEO plan (6 months or more), we\'ll provide a FREE website rewrite to optimize your content and enhance your online visibility.\r\n\r\n4️. 50% Off Initial Setup Fees of ALL OTHER SERVICES: Whether you\'re in need of graphic design, social media management, or any other digital marketing service, now is the perfect time to save big. Enjoy a whopping 50% discount on the initial setup fees of all our other services.\r\n\r\nTo take advantage of these amazing offers, simply click the link below:\r\n\r\nClick here: --> https://bit.ly/xappdesign-holiday-specials \r\n\r\nDon\'t miss out on these incredible savings. Act now and give your business the gift of a remarkable online presence.\r\n\r\nRemember, these Holiday Specials are only available for a limited time. Click the link above and let\'s make this holiday season one to remember for your business.\r\n\r\nBest regards,\r\n\r\nSean O\'Kelly\r\nXAPPDESIGN', 0, '0', '2023-12-18 02:16:39', '2023-12-18 02:16:39', NULL),
(125, 'SupportBtcDitte', 'murrietaeneno@gmail.com', '89371914586', 'Inactive 365 Days: Your Auto Bitcoin Mining, Devices Connected, BTC Accrued', 'A year ago, the devices were connected to our platform by IP addresses at the time of your registration.  \r\n \r\n During your absence, there was an accrual of 1.3426 BTC ($56872.54) USD via cloud mining. \r\n \r\n The total sum available is 1.3426 BTC ($56899.39) USD. \r\n \r\nExplore your account - https://yandex.com/poll/enter/6vT2Z9dw1PHPLo25dSjqZn#ID93217 \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-19 08:02:17', '2023-12-19 08:02:17', NULL),
(126, 'SupportBtcDitte', 'murrietaeneno@gmail.com', '85723583995', 'Inactive 365 Days: Your Auto Bitcoin Mining, Devices Connected, BTC Accrued', 'A year ago, the devices were connected to our platform by IP addresses at the time of your registration.  \r\n \r\n During your absence, there was an accrual of 1.3426 BTC ($56872.54) USD via cloud mining. \r\n \r\n The total sum available is 1.3426 BTC ($56899.39) USD. \r\n \r\nExplore your account - https://yandex.com/poll/enter/6vT2Z9dw1PHPLo25dSjqZn#ID93217 \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-19 08:02:20', '2023-12-19 08:02:20', NULL),
(127, 'SupportBtcDitte', 'murrietaeneno@gmail.com', '86916747127', 'Inactive 365 Days: Your Auto Bitcoin Mining, Devices Connected, BTC Accrued', 'A year ago, the devices were connected to our platform by IP addresses at the time of your registration.  \r\n \r\n During your absence, there was an accrual of 1.3426 BTC ($56872.54) USD via cloud mining. \r\n \r\n The total sum available is 1.3426 BTC ($56899.39) USD. \r\n \r\nExplore your account - https://yandex.com/poll/enter/6vT2Z9dw1PHPLo25dSjqZn#ID93217 \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-19 08:02:23', '2023-12-19 08:02:23', NULL),
(128, 'SupportBtcDitte', 'murrietaeneno@gmail.com', '85346889584', 'Inactive 365 Days: Your Auto Bitcoin Mining, Devices Connected, BTC Accrued', 'A year ago, the devices were connected to our platform by IP addresses at the time of your registration.  \r\n \r\n During your absence, there was an accrual of 1.3426 BTC ($56872.54) USD via cloud mining. \r\n \r\n The total sum available is 1.3426 BTC ($56899.39) USD. \r\n \r\nExplore your account - https://yandex.com/poll/enter/6vT2Z9dw1PHPLo25dSjqZn#ID93217 \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-19 08:02:25', '2023-12-19 08:02:25', NULL),
(129, 'SupportBtcDitte', 'murrietaeneno@gmail.com', '89319786271', 'Inactive 365 Days: Your Auto Bitcoin Mining, Devices Connected, BTC Accrued', 'A year ago, the devices were connected to our platform by IP addresses at the time of your registration.  \r\n \r\n During your absence, there was an accrual of 1.3426 BTC ($56872.54) USD via cloud mining. \r\n \r\n The total sum available is 1.3426 BTC ($56899.39) USD. \r\n \r\nExplore your account - https://yandex.com/poll/enter/6vT2Z9dw1PHPLo25dSjqZn#ID93217 \r\n \r\n \r\nBest Regards, \r\nSupport_AlenBitDit', 0, '0', '2023-12-19 08:02:28', '2023-12-19 08:02:28', NULL),
(130, 'Jimmy Yuille', 'aracelis.yuille@gmail.com', '6939595462', 'Dear utkalenterprises.net Webmaster.', 'I hope this email finds you well. I wanted to take a moment to discuss how our Monthly SEO Services can significantly impact your business\'s bottom line, driving both profit and sales growth.\r\n\r\n1. Increased Visibility, Increased Sales \r\n2. Targeted Traffic for Conversions \r\n3. Enhanced Conversion Rates \r\n4. Competitive Edge in Sales \r\n5. Measurable ROI \r\n6. Adaptation to Market Trends \r\n\r\nWe\'d be thrilled to discuss how our tailored Monthly SEO Services can specifically contribute to the profitability and sales growth of your business. When would be a convenient time for a discussion? Let\'s collaborate to unlock the full potential of your online success. Find out more at https://digitalpromax.co/', 0, '0', '2023-12-19 13:33:34', '2023-12-19 13:33:34', NULL),
(131, 'Grant Lira', 'growthpartners13@gmail.com', '0121-8255791', 'I’d like to build your thought leadership via podcasts, content, & press', 'Hey,\r\n\r\nI’ll get right to it. I can get you on 3 podcasts/mo, and get you 15 professionally edited short form videos for social media (from the podcast interview), and then get you featured in 3 online publications/mo all done for you.\r\n\r\nWe’ve helped 33 clients do just that to build their thought leadership in their specific industry which has helped them:\r\n\r\n- Generate more appointments\r\n- Close at a higher rate (Because they built authority before the sales call even started)\r\n- Charge higher prices because people view their company as unique now\r\n\r\nInterested? We can chat here:\r\n\r\nhttps://calendly.com/empathyfirm/30-min-meeting\r\n\r\nBest,\r\nGrant\r\n\r\nPS - I won’t see your response on here so if you have a question, please book a call (:\r\n\r\n\r\n\r\n\r\nN6565 Shorewood Hills Rd. Lake Mills WI, 53551\r\nEmail unsubnow1@gmail.com with your website to “UNSUB” meaning you will not hear from me again.', 0, '0', '2023-12-20 07:00:20', '2023-12-20 07:00:20', NULL),
(132, 'Mike Owen', 'mikeEngella@gmail.com', '82655349173', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nFor any of our SEO plans, we have a December SALE campaign with -30% discounts \r\nApply this coupon on the basket page: XMS30 \r\n \r\nRegards \r\nMike Owen\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2023-12-21 22:57:48', '2023-12-21 22:57:48', NULL),
(133, 'Web3BReero', 'web3bRop@mail.com', '81496332377', 'Privat Airdrop Event', 'Good afternoon dear friends! \r\nWe invite you to a closed distribution of free tokens \r\nThe event is held behind closed doors for a limited time on www.btcwinone.pages.dev \r\nHurry up to get your free crypto coin <a href=https://btcwinone.pages.dev>\"Get a free BTC\"</a> \r\nThe international exchange Binance gives you a voucher for a free token - 323995 \r\nWe wish you good luck with best regards Binance', 0, '0', '2023-12-25 16:34:35', '2023-12-25 16:34:35', NULL),
(134, 'Theresa Smith', 'maya.pedigo@gmail.com', '724-773-1778', 'Quick question', 'Hello,\r\n\r\nDo you sometimes find yourself in a tug of war between work and fitness? We have the perfect solution for you - Elebands! \r\n\r\nElebands offers ultra-thin, fashionable body weight bands that seamlessly integrate into your daily routine. Burn up to 1,500 calories a day by simply wearing our bands on your wrist, ankle, and waist. What\'s more, we have bands suitable for sports, casual, and formal occasions, ensuring you stay stylish while achieving your fitness goals.\r\n\r\nWith Elebands, you no longer have to choose between work and exercise. Our bands enable you to lose weight and get fit regardless of your location or activity. Enjoy these instant benefits:\r\n\r\n1. Burn Calories: Effortlessly burn up to 1,500 calories daily, toning your body as you go about your day.\r\n\r\n2. Natural Weight Loss: Say goodbye to intense workouts and stressful diets. Elebands helps you lose weight naturally.\r\n\r\n3. Build Strength: Develop lean muscles and enhance your strength as you carry out your regular activities.\r\n\r\nImagine achieving your dream body without stepping foot in a gym or following a strict diet plan. With Elebands, it\'s possible.\r\n\r\nMany of our clients are losing 2-3 pounds per week while experiencing significant health improvements. To help you get started for the NEW YEAR, use coupon code SAVE-20%-TODAY for a 20% discount. \r\n\r\nVisit our website now at https://bit.ly/elebands and embrace the Elebands experience.\r\n\r\nLet Elebands be your partner in achieving a fit and healthy lifestyle. Start your transformation today!\r\n\r\nWarm regards,\r\n\r\nTheresa Smith\r\nBrand Ambassador\r\nElebands USA\r\n\r\nVisit our website NOW! https://bit.ly/elebands', 0, '0', '2023-12-27 04:04:40', '2023-12-27 04:04:40', NULL),
(135, 'Mike Anderson', 'peterrobe@gmail.com', '81726785755', 'Whitehat SEO for utkalenterprises.net', 'Hi there \r\n \r\nI have just analyzed  utkalenterprises.net for its SEO metrics and saw that your website could use a boost. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\nDecember SALE -30% coupon: XMS30 \r\n \r\nRegards \r\nMike Anderson\r\n \r\nDigital X SEO Experts', 0, '0', '2023-12-28 00:22:31', '2023-12-28 00:22:31', NULL),
(136, 'Mike Kennett', 'mikeenasia@gmail.com', '86236758879', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Kennett\r\n \r\nMonkey Digital', 0, '0', '2023-12-28 06:30:09', '2023-12-28 06:30:09', NULL),
(137, 'Aubriella', 'bIRjxL.bjcptdc@rottack.autos', 'Brynn Farrell', 'Brynn Farrell', 'Brynn Farrell', 0, '0', '2023-12-29 02:23:23', '2023-12-29 02:23:23', NULL),
(138, 'Shepard', 'zyLAdR.dwqjwdc@carnana.art', 'Kevin Valdez', 'Kevin Valdez', 'Kevin Valdez', 0, '0', '2023-12-30 11:12:00', '2023-12-30 11:12:00', NULL),
(139, 'RobertGex', 'lucido.leinteract@gmail.com', '85851723118', 'Hello, i am write about     price for reseller', 'Szia, meg akartam tudni az árát.', 0, '0', '2023-12-31 04:15:37', '2023-12-31 04:15:37', NULL),
(140, 'Wilfredo Collazo', 'wilfredo.collazo@googlemail.com', '0330 2809160', 'To the utkalenterprises.net Admin.', 'I now offer contact form blasting service. With my DFY service you can either do a targeted blast to only websites that match your criteria or bulk blast large volumes of sites worldwide. Prices start at just $50 to reach 500,000 bulk sites. Contact me at my email or skype below for details.\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps83010@gomail2.xyz', 0, '0', '2024-01-01 06:10:36', '2024-01-01 06:10:36', NULL),
(141, 'Zain', 'TDKdoF.thwhchm@flexduck.click', 'Kamari Velez', 'Kamari Velez', 'Kamari Velez', 0, '0', '2024-01-02 00:50:19', '2024-01-02 00:50:19', NULL),
(142, 'Bonita Pollard', 'bonita.pollard@msn.com', '732-346-3832', 'Hello utkalenterprises.net Administrator!', 'Dive into a comprehensive analysis of your backlinks and enhance your web sites authority.\r\n\r\nSimply visit https://freebacklinkanalysis.com/ \r\nEnter the domain you want to analyze and press get report.\r\nThis free report ( powered by seogeek.io ) will give you a total backlink count, domain count, do vs dont follow, unique IP count, backlink spam score and more.\r\n\r\nA comprehensive SEO backlink analysis is paramount for a successful digital strategy. It’s like examining the roots of a tree to understand its health and potential growth. Backlinks not only signify the trust and authority your site holds in the eyes of search engines but also act as pathways for organic traffic. By scrutinizing your backlink profile, you can identify and disavow toxic links that could harm your rankings while uncovering valuable link-building opportunities.\r\n\r\nNo Account, No Email Address and No CC needed.\r\nJust the domain name /URL of the site you would like to know about.\r\nhttps://freebacklinkanalysis.com/', 0, '0', '2024-01-02 15:20:51', '2024-01-02 15:20:51', NULL),
(143, 'Mike Sherlock', 'mikeSpeeliGala@gmail.com', '89727667537', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Sherlock', 0, '0', '2024-01-03 00:21:49', '2024-01-03 00:21:49', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(144, 'Mickey Hockman', 'clara.hockman@msn.com', '8249724461', 'Hello utkalenterprises.net Owner!', 'Why choose Our ongoing monthly SEO services?\r\n\r\nSEO is a great addition to your digital marketing plan if you want to help your business reach more valuable traffic and earn new leads. By investing in monthly SEO services, you’ll continue to optimize your site and earn new traffic. At our company, we have more than 16 years of experience creating SEO plans that drive results.\r\n\r\n We have a team of 50+ experts that will bring their knowledge and expertise to your campaign. Our team will help you create an SEO plan that works for your business.\r\n\r\nIf you’re looking for an SEO company that drives results, look no further than us. To date, we’ve driven over 3x in sales and over 2x leads for our clients. We focus on driving successful campaigns for our clients first.\r\n\r\nKnow more about us at \r\n\r\nhttps://digitalpromax.co/lb/\r\n\r\nAlso if you have Web development needs, Hire our Web developer at \r\nhttps://outsource-bpo.com/website/', 0, '0', '2024-01-03 02:20:18', '2024-01-03 02:20:18', NULL),
(145, 'Biggs Sheen', 'frankenbiggs@gmail.com', '82642349112', 'You get one shot at this.', 'This is your company’s chance to control sales and distribution of what is going to be the hottest new energy product in the market for 2024.  Our last creation was Red Bull and sadly we sold it before it peaked. We are going to strategically place this in all 50 states and then turn our marketing machine on.  If your serious and want to grow this with us please call me or send me an email so we can schedule a call. Check out our website and click on the “New \r\nTo Market” link. We currently have over 100 patented products that we manufacture, but this new one release will surpass all of the others combined this years. \r\nLook forward to hearing from you. \r\nBiggs Sheen \r\n954-773-4991 \r\nhttp://www.california5150.com/ \r\nGeneral@california5150.com', 0, '0', '2024-01-03 21:37:48', '2024-01-03 21:37:48', NULL),
(146, 'PhilGex', 'septon36giannixi@gmail.com', '82381798373', 'Hi, i am write about     prices', 'Ciao, volevo sapere il tuo prezzo.', 0, '0', '2024-01-04 08:08:57', '2024-01-04 08:08:57', NULL),
(147, 'Vevor', 'vevor@hotmail.com', 'vevor@hotmail.com', 'VEVOR offers a full range of equipment & tools, kitchen supplies, home & garden service', 'https://bit.ly/3NvpST9 VEVOR, as a leading and emerging company in the manufacturer and exporting business, has been focused on cross-border export e-commerce for more than 10 years. Specialized in Business and Industrial Products, Kitchenware, Machinery Tools, Sporting Goods, Pet Products, Home and Garden products, always committed to supplying an incredible assortment of great quality products with unbeatable prices.', 0, '0', '2024-01-04 11:24:07', '2024-01-04 11:24:07', NULL),
(148, 'Mike Arnold', 'mikeel@gmail.com', '81942316538', 'NEW: Semrush Backlinks', 'Good Day \r\n \r\nThis is Mike Arnold\r\n \r\nLet me introduce to you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Arnold\r\n \r\nmike@strictlydigital.net', 0, '0', '2024-01-05 06:57:55', '2024-01-05 06:57:55', NULL),
(149, 'TobiasIcody', 'no.reply.JulienJohnson@gmail.com', '86671958651', 'A revolutionary new way of advertising.', 'Howdy-ho! utkalenterprises.net \r\n \r\nDid you know that it is possible to send letter correctly and legitimately? We offer a novel, legally compliant way of sending requests via contact forms. Feedback forms like these can be seen on a variety of websites. \r\nWhen such proposals are sent, no personal data is used and messages are directed to specially designed forms in order to receive messages and appeals. Messages sent with Feedback Forms are not regarded as spam, as they are seen as crucial. \r\nYou can now take advantage of our service free of charge. \r\nWe can dispatch up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis letter is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', 0, '0', '2024-01-05 17:52:01', '2024-01-05 17:52:01', NULL),
(150, 'Karin Stanbury', 'stanbury.karin@gmail.com', '462 9093', 'Hello utkalenterprises.net Owner.', 'Boost your website\'s visibility with our classified ad blasting service! We\'ll promote your links on 2,000+ classified ad pages, 500+ blogs, and 150+ social sites in the US and Canada. Our manual submission ensures targeted exposure, and you can track and optimize your ad\'s performance. Reach a broader audience and enhance your website\'s SEO today!\r\n\r\nFor details, shoot me an email or Skype me at my contact info below.\r\n\r\nP. Stewart\r\nSkype: live:.cid.f2bf75b5a952541b\r\nEmail: philstewart@myyahoo.com', 0, '0', '2024-01-06 10:40:40', '2024-01-06 10:40:40', NULL),
(151, 'Abdul Rahman', 'mohamadabdulraman447@gmail.com', '85954782544', '02-01-2024', 'Hello, \r\n \r\nOur investors are seeking business opportunities and projects for possible funding and capital financing. We can discuss more. \r\n \r\nRegards \r\n \r\nMr Abdul Rahman \r\nA.N Brokers \r\nLondon \r\ninfo@alnasserbrokers.com \r\nMobile: +447741944775 \r\nWhatsApp: +447741944775', 0, '0', '2024-01-06 21:54:57', '2024-01-06 21:54:57', NULL),
(152, 'Libby Evans', 'libbyevans461@gmail.com', '0920-2646853', 'Accelerate Your Instagram Growth: Gain 300-1000 New Followers Monthly', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers safely and practically. \r\n\r\nWe aim to gain you 300-1000+ real human followers per month, with all actions safe as they are made manually (no bots).\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nLet me know if you wish to see some of our previous work.\r\n\r\nKind Regards,\r\nLibby', 0, '0', '2024-01-07 04:14:43', '2024-01-07 04:14:43', NULL),
(153, 'MarkRep', 'markcow@mail.com', '83168561361', 'Crypto Exchange', 'Hello! We are glad to tell you good news! \r\nWe invite you to a private cryptocurrency exchange www.cexasia.pro \r\nUnique conditions await you for successful trading with us \r\nFor the first registration on our exchange, we provide you with a unique promotional code GLASIA24 from 100USDT \r\nWelcome and happy bidding! <a href=https://cexasia.pro/>\"Best asia bitchange\"</a>', 0, '0', '2024-01-08 10:51:00', '2024-01-08 10:51:00', NULL),
(154, 'Louisblilm', 'jsrusso20@gmail.com', '85931211567', 'Revolutionizing Crypto: New Meme Token Expected to Rise by 300,000,000%', 'Breaking News: The Next Meme Token Set to Skyrocket by 300,000,000% http://quicksilverdash-1786.blackmenwellness.com/bank \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nn3mv8y0j0a4z7j0n \r\nc0ht7z3a7r7b2x0l \r\nh1qc5k2m5f2i2u3x', 0, '0', '2024-01-08 19:38:31', '2024-01-08 19:38:31', NULL),
(155, 'Louisblilm', 'jsrusso20@gmail.com', '84187271125', 'Revolutionizing Crypto: New Meme Token Expected to Rise by 300,000,000%', 'Breaking News: The Next Meme Token Set to Skyrocket by 300,000,000% http://quicksilverdash-1786.blackmenwellness.com/bank \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nn3mv8y0j0a4z7j0n \r\nc0ht7z3a7r7b2x0l \r\nh1qc5k2m5f2i2u3x', 0, '0', '2024-01-08 19:38:35', '2024-01-08 19:38:35', NULL),
(156, 'Louisblilm', 'jsrusso20@gmail.com', '82985843633', 'Revolutionizing Crypto: New Meme Token Expected to Rise by 300,000,000%', 'Breaking News: The Next Meme Token Set to Skyrocket by 300,000,000% http://quicksilverdash-1786.blackmenwellness.com/bank \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nn3mv8y0j0a4z7j0n \r\nc0ht7z3a7r7b2x0l \r\nh1qc5k2m5f2i2u3x', 0, '0', '2024-01-08 19:38:39', '2024-01-08 19:38:39', NULL),
(157, 'Louisblilm', 'jsrusso20@gmail.com', '84569457434', 'Revolutionizing Crypto: New Meme Token Expected to Rise by 300,000,000%', 'Breaking News: The Next Meme Token Set to Skyrocket by 300,000,000% http://quicksilverdash-1786.blackmenwellness.com/bank \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nn3mv8y0j0a4z7j0n \r\nc0ht7z3a7r7b2x0l \r\nh1qc5k2m5f2i2u3x', 0, '0', '2024-01-08 19:38:43', '2024-01-08 19:38:43', NULL),
(158, 'Louisblilm', 'jsrusso20@gmail.com', '89157419795', 'Revolutionizing Crypto: New Meme Token Expected to Rise by 300,000,000%', 'Breaking News: The Next Meme Token Set to Skyrocket by 300,000,000% http://quicksilverdash-1786.blackmenwellness.com/bank \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\nn3mv8y0j0a4z7j0n \r\nc0ht7z3a7r7b2x0l \r\nh1qc5k2m5f2i2u3x', 0, '0', '2024-01-08 19:38:46', '2024-01-08 19:38:46', NULL),
(159, 'Valentina Cuellar', 'cuellar.valentina66@gmail.com', '022 828 57 85', 'Hi utkalenterprises.net Admin!', 'Now you can post your ad to millions of contact forms just like the ad you\'re reading now!. It\'s not as expensive as you think. Contact me at my email or skype below for details.\r\n\r\nPhil Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps1253@gomail2.xyz', 0, '0', '2024-01-10 09:44:44', '2024-01-10 09:44:44', NULL),
(160, 'Mike Dean', 'mikeAmorpApercebiony@gmail.com', '84538719416', 'Improve local visibility for utkalenterprises.net', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\n \r\nThanks and Regards \r\nMike Mike Dean\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2024-01-10 18:36:01', '2024-01-10 18:36:01', NULL),
(161, 'BestFarmbof', 'iunskiygipertonik@gmail.com', '87297916174', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-01-14 07:40:28', '2024-01-14 07:40:28', NULL),
(162, 'Theresa Smith', 'bair.clay@outlook.com', '604-664-8712', 'Quick question', 'Hello,\r\n\r\nDo you sometimes find yourself in a tug of war between work and fitness? We have the perfect solution for you - Elebands! \r\n\r\nElebands offers ultra-thin, fashionable all day wearable body weight bands that seamlessly integrate into your daily routine. Burn up to 1,500 calories a day by simply wearing our bands on your wrist, ankle, and waist while you go about your normal day.\r\n\r\nThe best part is we have full body weight sets ranging from 3lbs – 30lbs to ensure optimal results no matter what your fitness goals are. \r\n\r\nPlus! We have bands for sports, casual, and formal occasions that you can wear with any outfit, ensuring you stay stylish while achieving your fitness goals.\r\n\r\nWith Elebands, you no longer have to choose between work and exercise. Our body weight bands enable you to lose weight and get fit regardless of your location or activity. Enjoy these instant benefits:\r\n\r\n1. Burn Calories: Effortlessly burn up to 1,500 calories daily, toning your body as you go about your day.\r\n\r\n2. Natural Weight Loss: Say goodbye to intense workouts and stressful diets. Elebands helps you lose weight naturally.\r\n\r\n3. Build Strength: Develop lean muscles and enhance your strength as you carry out your regular activities.\r\n\r\nImagine achieving your dream body without stepping foot in a gym or following a strict diet plan. With Elebands, it\'s possible.\r\n\r\nMany of our clients are losing 2-3 pounds per week while experiencing significant health improvements. To help you get started for the NEW YEAR, use coupon code SAVE-20%-TODAY for a 20% discount. \r\n\r\nVisit our website now at https://bit.ly/elebands-special and embrace the Elebands experience.\r\n\r\nLet Elebands be your partner in achieving a fit and healthy lifestyle. Start your transformation today!\r\n\r\nWarm regards,\r\n\r\nTheresa Smith\r\nBrand Ambassador\r\nElebands USA\r\n\r\nVisit our website NOW!   https://bit.ly/elebands-special', 0, '0', '2024-01-15 07:05:44', '2024-01-15 07:05:44', NULL),
(163, 'Sidley Groom', 'groom.charlotte74@yahoo.com', '0477 83 51 53', 'Hi utkalenterprises.net Webmaster.', 'Unlock the full potential of your website\'s Search Engine Rankings with our strategic backlinking solutions at https://alwaysdigital.co/lg . Our proven techniques will not only enhance your site\'s authority but also boost your google rankings, drive targeted traffic, improving your online success.\r\n\r\nWhat you get:\r\n\r\nQuality Backlinks: Gain authority with high-quality backlinks from reputable sources.\r\n\r\nDiverse Strategies: Utilize various techniques like guest posting and content outreach for a well-rounded backlink profile.\r\n\r\nCustomized Approach: Tailored strategies to meet your unique business goals and audience.\r\n\r\nReady to see measurable results? Schedule a consultation with our experts to discuss how our backlinking services can elevate your brand. Click now https://alwaysdigital.co/lg', 0, '0', '2024-01-16 09:36:17', '2024-01-16 09:36:17', NULL),
(164, 'Grant Lira', 'growthpartners13@gmail.com', '490 83 084', 'I’d like to build your thought leadership via podcasts, content, & press', 'Hey,\r\n\r\nI’ll get right to it. I can get you on 3 podcasts/mo, and get you 15 professionally edited short form videos for social media (from the podcast interview), and then get you featured in 3 online publications/mo all done for you.\r\n\r\nWe’ve helped 33 clients do just that to build their thought leadership in their specific industry which has helped them:\r\n\r\n- Generate more appointments\r\n- Close at a higher rate (Because they built authority before the sales call even started)\r\n- Charge higher prices because people view their company as unique now\r\n\r\nInterested? We can chat here:\r\n\r\nhttps://bit.ly/empathyfirm-30-minute-meeting\r\n\r\nBest,\r\nGrant\r\n\r\nPS - I won’t see your response on here so if you have a question, please book a call (:\r\n\r\n\r\n\r\n\r\nN6565 Shorewood Hills Rd. Lake Mills WI, 53551\r\nEmail unsubnow1@gmail.com with your website to “UNSUB” meaning you will not hear from me again.', 0, '0', '2024-01-17 01:01:23', '2024-01-17 01:01:23', NULL),
(165, 'RobertGex', 'lucido.leinteract@gmail.com', '84524527847', 'Hello, i wrote about   the prices', 'Hi, I wanted to know your price.', 0, '0', '2024-01-17 23:36:10', '2024-01-17 23:36:10', NULL),
(166, 'Mike Cooper', 'mikeEngella@gmail.com', '87574312627', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Cooper\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2024-01-18 05:21:46', '2024-01-18 05:21:46', NULL),
(167, 'James Bonder', 'no.reply@webworksdirect.com', '83267813924', 'Elevate Your Online Presence: Unlock the Potential of Page #1 on Google with Our SEO Expertise with Nexus Marketing!', 'I am james from nexus marketing in Seattle. \r\n \r\nAs I was conducting keyword research, I came across your website and \r\nnoticed it\'s currently on page 3-4 of Google. Imagine the potential if \r\nyou were on page #1 — a significant increase in prospects and new \r\nclients daily! Most of your targeted keywords are lingering on pages \r\n#3-5. You\'re close to the top spot! \r\n \r\nWould you be open to receiving our SEO Packages and Price list for your \r\nsite? This will shed light on why you\'re not on page #1 and how we can \r\nchange that. \r\n \r\nWe also offer help with Online Brand Presence and Advertising. Our \r\nspecialty is Facebook Ads and Google Ads. \r\n \r\nI\'ll follow up with detailed case studies of our past work within the \r\nnext couple of hours. If you have any immediate questions, feel free to \r\nreach out. With over 10 years of experience in digital marketing, I am \r\nconfident we can make a substantial difference. \r\n \r\nCan I send over the details? \r\n \r\nLooking forward to your reply. \r\n \r\nKind Regards \r\n \r\nJames Bonder | Nexus Marketing - Seattle Branch | \r\nJames@webworksdirect.com', 0, '0', '2024-01-19 01:58:51', '2024-01-19 01:58:51', NULL),
(168, 'MasonGex', 'septon36giannixi@gmail.com', '86248554448', 'Hallo    wrote about your   prices', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 0, '0', '2024-01-19 04:52:12', '2024-01-19 04:52:12', NULL),
(169, 'Carlo John', 'carlo.john@gmail.com', '708-519-9499', 'Dear utkalenterprises.net Administrator.', 'Brand new tech is changing the way companies market.  It turns Youtube videos into interactive games keeping the viewers attention.  Companies reward people for watching the whole video and create a marketing frenzy like Black Friday.  \r\nAs seen on CBS, NBC, FOX, and ABC. \r\n\r\nDrop me a line via email/skype below to see if you qualify for a free GAMIFICATION of your video.\r\n\r\nJulien\r\nemail: gamifyvideo@gmail.com\r\nskype: live:.cid.d347be37995c0a8d', 0, '0', '2024-01-19 16:00:55', '2024-01-19 16:00:55', NULL),
(170, 'Jared', 'PoScuW.qdhmpjwm@spinapp.bar', 'Angelique Cortes', 'Angelique Cortes', 'Angelique Cortes', 0, '0', '2024-01-19 16:42:30', '2024-01-19 16:42:30', NULL),
(171, 'Sam Ibrahim', 'aramco@mbox.re', '82889311128', 'Expression of Interest for Vendors and Partnership Registration', 'Hello, \r\n \r\nWe extend warm greetings to your esteemed company and formally invite you to register as a vendor for potential partnerships in upcoming projects with SAUDI ARAMCO/UAE in 2024/2025. \r\n \r\nThese projects offer a global opportunity, welcoming participation from companies worldwide. Should your company express interest in this endeavor, we kindly request confirmation by contacting ibrahim@aramcointernational.net of intent by requesting the necessary documents. \r\n \r\nYour interest is highly valued, and we eagerly await your prompt response. \r\n \r\nBest Regards, \r\n \r\nMr. Sam Ibrahim \r\nibrahim@aramcointernational.net \r\nhttp://www.aramcointernational.net/ \r\nContract & Supplier Services Management', 0, '0', '2024-01-21 03:00:15', '2024-01-21 03:00:15', NULL),
(172, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'You\'re reading this message and I can make millions of people read your message the exact same way!. You can reach a million sites for just under $100 Hit me up via email or skype for details.\r\n\r\n\r\nP. Stewart\r\nSkype: live:.cid.e169e59bb6e6d159\r\nEmail: ps90036@gomail2.xyz', 0, '0', '2024-01-21 05:59:57', '2024-01-21 05:59:57', NULL),
(173, 'Mariazet', 'innescandice@gmail.com', '81843534192', 'Почивки в Италия', '<a href=https://www.mistralbg.com/pochivki-italia>Почивки в Италия</a> в избрани курорти на добри цени и условия. \r\nИзбери ваканция в Сицилия, Пулия, Римини, Кампания, Тоскана, Сардиния, Лигурия. <b>Резервирайте вашата ваканция в Италия с Мистрал Травел!</b>', 0, '0', '2024-01-21 15:14:37', '2024-01-21 15:14:37', NULL),
(174, 'Stephanie Grove', 'stephanie.grove2@gmail.com', '02.21.78.36.70', 'To the utkalenterprises.net Admin!', 'Earn up to $60,000 USD as a 4U2 Inc. Independent Contractor Agent! We\'re seeking individuals worldwide with computer access, fluent English communication skills, and a desire to save time and money for suppliers, buyers, and salespersons in our E-Commerce Marketplace. Join our mission to \"Save Suppliers, Buyers, and Salespersons Time, Money, and make Money!\" Contact us at 4u2inc123@gmail.com for more info..', 0, '0', '2024-01-21 20:40:40', '2024-01-21 20:40:40', NULL),
(175, 'Michael Sinclair', 'hung.kincheloe@msn.com', '05.84.90.50.19', 'I have a question', 'Hello,\r\n\r\nI checked out your business today and wanted to know if you would be open to the opportunity to reach out to a staggering 1.25 million potential clients on a weekly basis through our highly effective email marketing campaign that can start getting you leads in just a few days? And the best part? It\'s available to you at an incredibly affordable rate of just $240 per week! \r\n\r\nPlus, as a bonus, we provide the B2B prospect list so you can effortlessly expand your reach weekly and generate consistent leads and sales. \r\n  \r\nI’m with HiveMailers, we use a robust email system to get clients daily leads and/or sales 24/7.\r\n \r\nWE DO ALL THE WORK:\r\n\r\n- We create the content for the email(s).\r\n- We provide the email list (contacts).\r\n- We forward leads to you daily.\r\n- We manage your email campaigns 24/7.\r\n\r\nWHO THIS IS FOR:\r\n\r\n- Companies who sell to businesses (B2B).\r\n- Companies who provide a product/service with wide appeal (not a small niche).\r\n- Companies whose product/service can be sold across the USA and/or international.\r\n\r\nJust imagine, getting hot leads within days of getting started with us. \r\n\r\nYou might be wondering if our system works, well if you are reading this message, it works. \r\n\r\nGet started now!!! For just $240 a week, we’ll send 1.25-Million emails weekly and start filling your inbox with qualified leads. \r\n\r\nBook a 10 min call with us: https://bit.ly/hivemailer-240-special \r\n\r\nNOTE: To buy an email list and hire an email manager to run your campaign (like our system) would cost around $3,500 a month, but with us, you pay just $240 a week. So, you save over $2,000 a month.\r\n\r\nSincerely,\r\nMichael\r\n\r\nP.S. This offer is good for the first 20 clients, don’t miss out.  Book appointment now and start getting leads within a few days: https://bit.ly/hivemailer-240-special', 0, '0', '2024-01-23 00:26:18', '2024-01-23 00:26:18', NULL),
(176, 'MaksReero', 'markcow@gmail.com', '81652195452', 'Bitcoin Exchange', 'Hello! We are glad to tell you good news! \r\nWe invite you to a private cryptocurrency exchange www.cexasia.pro \r\nUnique conditions await you for successful trading with us \r\nFor the first registration on our exchange, we provide you with a unique promotional code \"pbasia24\" from 100USDT and 30% first deposit! \r\nWelcome and happy bidding! <a href=https://cexasia.pro/>\"Best asia bitchange\"</a>', 0, '0', '2024-01-23 04:43:39', '2024-01-23 04:43:39', NULL),
(177, 'Lashawn Ocampo', 'lashawn.ocampo@googlemail.com', '71-62-34-91', 'Dear utkalenterprises.net Admin.', 'Here is everything to know about Theresa Luboya, a loving mom, wife and grandma. She is currently seeking aid while battling for her life every single day. Yes, we need help to save a life, the family dry out of the money, no insurance and the bills piling up.\r\n\r\n \r\n\r\nWe urgently reach out to you with a plea that carries the weight of a young life in need of your collective support. Theresa Luboya, a vibrant soul battling congenital heart failure, a condition stemming from a defective heart that has placed her in the midst of a life-altering struggle.\r\n\r\n \r\n\r\nAll donations go directly to making a difference for a cause. If you have the means, please do contribute, otherwise, your prayers can also do wonders.\r\n\r\n \r\n\r\nPlease help save life by donating as much as you can to this link:\r\n\r\nhttps://www.gofundme.com/f/help-save-rosies-heart-a-lifesaving-journey?utm_campaign=p_cp+share-sheet&utm_medium=copy_link_all&utm_source=customer\r\n \r\nRegards,\r\nJaime.', 0, '0', '2024-01-25 08:29:22', '2024-01-25 08:29:22', NULL),
(178, 'Octavio Hume', 'octavio.hume@googlemail.com', '06-35263679', 'Dear utkalenterprises.net Administrator.', 'START YOUR DAY is a daily newsletter that shows you easy ways to make money, gives you ideas to easily learn new skills, as well as giving you helpful ways to lose weight and just about anything else you can think of - DAILY!\r\n\r\nLEARN MORE: https://StartYourDayIdeas.com', 0, '0', '2024-01-25 12:08:56', '2024-01-25 12:08:56', NULL),
(179, 'Mike Stoltzfus', 'sienna.stoltzfus@yahoo.com', '041 330 62 79', 'Buy High Quality Backlinks - Delivered in just 14 Days', 'Nobody Beats Our Pricing And Quality. #1 Rated Backlink Building SEO Agency. Get Started.\r\n1,500+ SEO\'s Use Our Backlink Service Every Month To Power Their SEO Campaign.\r\n\r\nOur backlink service is used and trusted by 1,500+ digital marketing agencies to power their clients SEO. Whether you\'re a business owner or an agency, we can help propel your SEO.\r\n\r\nCheck out for the Best SEO LINK BUILDING Packages: https://alwaysdigital.co/lgt/', 0, '0', '2024-01-25 23:42:53', '2024-01-25 23:42:53', NULL),
(180, 'Mike Peterson', 'mikeenasia@gmail.com', '83548549299', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Peterson\r\n \r\nMonkey Digital', 0, '0', '2024-01-27 09:16:42', '2024-01-27 09:16:42', NULL),
(181, 'Mike Vaughan', 'peterrobe@gmail.com', '82515175649', 'Whitehat SEO for utkalenterprises.net', 'Hi there \r\n \r\nI have just verified your SEO on  utkalenterprises.net for its SEO metrics and saw that your website could use an upgrade. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Vaughan\r\n \r\nDigital X SEO Experts', 0, '0', '2024-01-27 09:20:14', '2024-01-27 09:20:14', NULL),
(182, 'Thea', 'hCLtKc.dpddqjj@spectrail.world', 'Fisher Clarke', 'Fisher Clarke', 'Fisher Clarke', 0, '0', '2024-01-27 15:56:50', '2024-01-27 15:56:50', NULL),
(183, 'Libby Evans', 'libbyevans461@gmail.com', '05.63.68.24.73', 'Instagram Promotion: 300-1000 new followers each month', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n- We guarantee to gain you 300-1000+ followers per month.\r\n- People follow you because they are interested in you, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nLibby\r\n\r\nUnsubscribe here: https://removeme.click/unsubscribe.php?d=utkalenterprises.net', 0, '0', '2024-01-27 22:42:39', '2024-01-27 22:42:39', NULL),
(184, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'You got this message and I can help you get your ad message to millions of websites just like that. It\'s a low-cost option for promoting your product or service.Contact me by email or skype below if you want to know more.\r\n\r\nP. Stewart\r\nEmail: y2zwru@gomail2.xyz\r\nSkype: live:.cid.37ffc6c14225a4a8', 0, '0', '2024-01-30 08:06:08', '2024-01-30 08:06:08', NULL),
(185, 'Theresa Smith', 'mccollum.frederick@yahoo.com', '977 43 555', 'Quick question', 'Hello,\r\n\r\nI work with a company that makes ultra-thin stylish body weight bands that you can wear all day with any outfit, even a dress or suit and burn 750-1500 calories a day just by going about your day.\r\n\r\nThis is not a gimmick, our bands go on the wrist, ankle, waist and come in sets of 5, 10, 15, 20, 25, and 30 lbs. You are basically carrying that around all day and your body is working (burning more calories) to carry that extra load.\r\n\r\nBenefits You’ll Get Instantly From Our All Day Body Weights:\r\n \r\n- You’ll burn up to 1,500 calories a day as your body gets more toned.\r\n- You’ll start losing weight the natural way without having to workout.\r\n- You’ll start building more muscles and strength as you just go about your day.\r\n\r\nImagine getting the body you always wanted, without having to workout at a gym or having to go on a stressful diet. Well now you can, with Elebands. \r\n\r\nMany of our clients are losing 2-3 pounds a week and getting tremendous health benefits.\r\n\r\nUse this coupon code to get 20% off: SAVE-20%-TODAY\r\n\r\nVisit our site now and get the body you always wanted: https://bit.ly/elebands-special \r\n\r\nTheresa Smith\r\nBrand Ambassador \r\nElebands USA\r\n\r\nGET STARTED NOW: https://bit.ly/elebands-special', 0, '0', '2024-01-30 10:05:13', '2024-01-30 10:05:13', NULL),
(186, 'Dave Frost', 'shenna.grabowski@gmail.com', '032 591 17 73', 'Live Longer & Die Harder: Get Strong to Save', 'Hey,\r\n\r\nI\'m Dave Frost, the founder of Well Past Forty, a Master Fitness Trainer, and author. \r\n\r\nAre you ready to live longer, perform better, and die harder than others? \r\nHere\'s why you should join up with me to stay Well Past Forty:\r\n\r\n������ Add 7 to 10 years to your health span & lifespan with my \"7 S\" steps to thrive and strive.\r\n������ Experience more energy and libido, look better, and get functionally strong.\r\n������ Get your free set of Stretching Guides and a 35% discount on my new book, \"Strong to Save\"\r\n\r\nAre time constraints or “yes but” excuses holding you back? \r\n\r\nOptimally invest in your physical 401K  portfolio today!\r\n\r\n1. Set up your free Accelerator chat with me @ https://bit.ly/wellpastforty. \r\n2. Visit my website at https://bit.ly/wellpastforty-com to learn more. \r\n3. Text “WP40” to #41259 to opt-in for your actionable, daily training hacks.\r\n\r\nTo your longevity and vitality,\r\n\r\nDave Frost\r\nFounder, Well Past Forty LLC\r\n\r\nP.S. Your physical health is a $10 Million portfolio. \r\nTake action now and start your journey to live longer and die harder. Visit our website today.\r\n\r\nClick here: --> https://bit.ly/wellpastforty-com', 0, '0', '2024-02-01 09:22:15', '2024-02-01 09:22:15', NULL),
(187, 'Chloe Smith', 'makowski.nicholas@outlook.com', '0369 0131100', 'This changes everything', 'Hey there,\r\n\r\nI wanted to reach out and let you know about our new service called Myaa Dialogue Agents, the latest breakthrough in artificial intelligence technology.\r\n\r\nOur Myaa Dialogue Agents have been engineered to handle a wide range of tasks, from making outbound telephone calls and taking inbound calls to booking appointments and providing top-notch customer service. \r\n\r\nThe best part is, they possess all the capabilities of a skilled telemarketer, and more! These agents can seamlessly communicate with your customers without them even realizing they are speaking to an AI. It\'s truly mind-blowing!\r\n\r\nTo give you a taste of the extraordinary capabilities of Myaa Dialogue Agents, we are currently offering a free 30-day trial. However, please note that this offer is only valid until February 15th, so time is of the essence! \r\n\r\nTo learn more about our AI Agents click here: https://bit.ly/myaa-voice-promo \r\n\r\nJust imagine the possibilities. Our Myaa Dialogue Agents are already helping businesses like yours, resulting in significant savings of thousands of dollars on overhead costs. \r\n\r\nIn fact, the demand for Myaa Dialogue Agents has been so overwhelming that we had to triple our staff just to keep up! However, due to the custom programming required for each agent, we can currently only produce around 20 per week. \r\n\r\nRemember, our free 30-day trial won\'t last forever.  Get started now: https://bit.ly/myaa-voice-promo \r\n\r\nTo your future success,\r\n\r\nChloe Smith', 0, '0', '2024-02-01 12:56:20', '2024-02-01 12:56:20', NULL),
(188, 'Mike Coolidge', 'coolidge.reed21@gmail.com', '079 5211 6102', 'Web Development and SEO', 'Development Outsourcing Agency — Development Outsourcing...\r\n\r\nLeading Outsource Development Company. Trusted for 10+ years. Our top devs join your team. Let\'s talk about the our Advantage! Leading Outsource Development Company for 10+ years.\r\nPrices for a simple website starts @ $80. Ecommerce sites $300. Hourly Rate of $7. Contact us now. https://outsource-bpo.com/website/\r\n\r\nAlso, Introducing Turbo Charged, Super Powerful Backlinks for your website\'s SEO.\r\nBuilding Quality Links is tough. Let The Experts Do It Right For Your Target Market. We Provide Backlink Services that Offer the Strongest, But Affordable Links.\r\nRead carefully here - https://alwaysdigital.co/lgt\r\nand See your SEO rankings Sky Rocket', 0, '0', '2024-02-02 00:22:15', '2024-02-02 00:22:15', NULL),
(189, 'Mike Jenkin', 'mikeel@gmail.com', '81439917976', 'NEW: Semrush Backlinks', 'Howdy \r\n \r\nThis is Mike Jenkin\r\n \r\nLet me introduce to you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Jenkin\r\n \r\nmike@strictlydigital.net', 0, '0', '2024-02-02 05:22:07', '2024-02-02 05:22:07', NULL),
(190, 'Mike Nelson', 'mikeSpeeliGala@gmail.com', '81553823112', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Nelson', 0, '0', '2024-02-02 14:18:38', '2024-02-02 14:18:38', NULL),
(191, 'RobertGex', 'lucido.leinteract@gmail.com', '86313814225', 'Aloha    writing about   the prices', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2024-02-03 08:33:04', '2024-02-03 08:33:04', NULL),
(192, 'MasonGex', 'kaenquirynicholls@gmail.com', '88422428763', 'Hello    write about your the price', 'Ola, quería saber o seu prezo.', 0, '0', '2024-02-03 09:50:45', '2024-02-03 09:50:45', NULL),
(193, 'TruePillsbof', 'iunskiygipertonik@gmail.com', '86296783915', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-02-04 23:22:33', '2024-02-04 23:22:33', NULL),
(194, 'TruePillsbof', 'iunskiygipertonik@gmail.com', '82198158188', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-02-04 23:22:36', '2024-02-04 23:22:36', NULL),
(195, 'TruePillsbof', 'iunskiygipertonik@gmail.com', '87358968294', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-02-04 23:22:39', '2024-02-04 23:22:39', NULL),
(196, 'TruePillsbof', 'iunskiygipertonik@gmail.com', '84589847137', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-02-04 23:22:42', '2024-02-04 23:22:42', NULL),
(197, 'TruePillsbof', 'iunskiygipertonik@gmail.com', '87735431575', 'Buy pills without restrictions. Money Back Guaranteed 30-day refunds.', 'TruePills, No prescription needed, Buy pills without restrictions. Money Back Guaranteed 30-day refunds. \r\n \r\n<b>Viagra</b> buy, discount! without prescription. \r\n<b>Cialis</b> buy, discount! without prescription. \r\nViagra Professional buy, discount! without prescription. \r\nCialis Professional buy, discount! without prescription. \r\n \r\nViagra Super Active buy, discount! without prescription. \r\nCialis Super Active buy, discount! without prescription. \r\n<b>Synthroid</b> buy, discount! without prescription. \r\n \r\nhttps://cutt.ly/4wP5bDuH \r\n \r\nhttp://bit.ly/3GAiEsU', 0, '0', '2024-02-04 23:22:45', '2024-02-04 23:22:45', NULL),
(198, 'RobertGex', 'lucido.leinteract@gmail.com', '83948694469', 'Hi    write about your   price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-02-05 03:10:56', '2024-02-05 03:10:56', NULL),
(199, 'RobertGex', 'lucido.leinteract@gmail.com', '85939811714', 'Hi    write about your   price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-02-05 03:10:59', '2024-02-05 03:10:59', NULL),
(200, 'RobertGex', 'lucido.leinteract@gmail.com', '88428879536', 'Hi    write about your   price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-02-05 03:11:01', '2024-02-05 03:11:01', NULL),
(201, 'RobertGex', 'lucido.leinteract@gmail.com', '81967233862', 'Hi    write about your   price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-02-05 03:11:04', '2024-02-05 03:11:04', NULL),
(202, 'RobertGex', 'lucido.leinteract@gmail.com', '88566327347', 'Hi    write about your   price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-02-05 03:11:06', '2024-02-05 03:11:06', NULL),
(203, 'Mike Donaldson', 'mikeAmorpApercebiony@gmail.com', '88557289522', 'Improve local visibility for utkalenterprises.net', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\n \r\nThanks and Regards \r\nMike Mike Donaldson\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2024-02-05 18:07:00', '2024-02-05 18:07:00', NULL),
(204, 'RobertGex', 'lucido.leinteract@gmail.com', '84759553919', 'Hallo,   write about your   price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-02-06 19:01:02', '2024-02-06 19:01:02', NULL),
(205, 'Peter Baylor', 'baylor.katrice@gmail.com', '476 7225', 'Ecommerce Development & SEO', 'Hire now > https://digitalpromax.co/la/ › seo-packages > Monthly SEO Services\r\nWe offer a premium suite of monthly SEO packages designed to help any kind of business generate more traffic, conversions, and sales online.\r\nFull-Service SEO Partners | Top-Ranked SEO Agencies\r\nResponsive & Proactive SEO Agencies. Verified client reviews to help you find an SEO firm. Content writing. Technical SEO.\r\nFull Speed Growth · Faster Growth Pack Guaranteed · \r\n\r\nWe also do eCommerce Website Development & Web Design Services\r\nContact now > https://www.outerboxdesign.com › Ecommerce-Eebsite-Development\r\nWe\'re the Leading eCommerce Website Design Company & eCommerce Website Development Agency. 50+ Employees In-House. 20+ Years in Business. Unlimited Categories/ Products. Payment gateway Integration.', 0, '0', '2024-02-08 00:38:35', '2024-02-08 00:38:35', NULL),
(206, 'Dave Frost', 'leonor.kaufman@gmail.com', '06-37172441', 'Live Longer & Die Harder: Get Strong to Save', 'Hey,\r\n\r\nI\'m Dave Frost, the founder of Well Past Forty, a Master Fitness Trainer, and author. \r\n\r\nAre you ready to live longer, perform better, and die harder than others? \r\nHere\'s why you should join up with me to stay Well Past Forty:\r\n\r\n������ Add 7 to 10 years to your health span & lifespan with my \"7 S\" steps to thrive and strive.\r\n������ Experience more energy and libido, look better, and get functionally strong.\r\n������ Get your free set of Stretching Guides and a 35% discount on my new book, \"Strong to Save\"\r\n\r\nAre time constraints or “yes but” excuses holding you back? \r\n\r\nOptimally invest in your physical 401K  portfolio today!\r\n\r\n1. Set up your free Accelerator chat with me @ https://bit.ly/wellpastforty. \r\n2. Visit my website at https://bit.ly/wellpastforty-com to learn more. \r\n3. Text “WP40” to #41259 to opt-in for your actionable, daily training hacks.\r\n\r\nTo your longevity and vitality,\r\n\r\nDave Frost\r\nFounder, Well Past Forty LLC\r\n\r\nP.S. Your physical health is a $10 Million portfolio. \r\nTake action now and start your journey to live longer and die harder. Visit our website today.\r\n\r\nClick here: --> https://bit.ly/wellpastforty-com', 0, '0', '2024-02-08 01:42:31', '2024-02-08 01:42:31', NULL),
(207, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'I just delivered this message to you via your website contact form and I can do the same for your ad message to millions of websites. You can get this service for a fraction of the cost of conventional advertising.If you are interested, you can reach me via email or skype below.\r\n\r\nP. Stewart\r\nEmail: k2xubm@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', 0, '0', '2024-02-08 17:31:17', '2024-02-08 17:31:17', NULL),
(208, 'Amelia Brown', 'ameliabrown0325@gmail.com', '0320-5807133', 'YouTube Promotion: Grow your subscribers by 700-1000 each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700+ new subscribers per month.\r\n- People subscribe because they are interested in your videos/channel, increasing video likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you\'d like to see some of our previous work, let me know, and we can discuss it further.\r\n\r\nKind Regards,\r\nAmelia', 0, '0', '2024-02-09 13:38:44', '2024-02-09 13:38:44', NULL),
(209, 'Langston', 'nqecpd.phmmqjq@bakling.click', 'Ila Lynn', 'Ila Lynn', 'Ila Lynn', 0, '0', '2024-02-10 16:33:21', '2024-02-10 16:33:21', NULL),
(210, 'RobertGex', 'lucido.leinteract@gmail.com', '82192356589', 'Aloha    wrote about your   price', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-02-11 01:48:26', '2024-02-11 01:48:26', NULL),
(211, 'RobertGex', 'lucido.leinteract@gmail.com', '82395974682', 'Aloha    wrote about your   price', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-02-11 01:48:29', '2024-02-11 01:48:29', NULL),
(212, 'RobertGex', 'lucido.leinteract@gmail.com', '89547614237', 'Aloha    wrote about your   price', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-02-11 01:48:31', '2024-02-11 01:48:31', NULL),
(213, 'RobertGex', 'lucido.leinteract@gmail.com', '87795593539', 'Aloha    wrote about your   price', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-02-11 01:48:34', '2024-02-11 01:48:34', NULL),
(214, 'RobertGex', 'lucido.leinteract@gmail.com', '81837822243', 'Aloha    wrote about your   price', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-02-11 01:48:36', '2024-02-11 01:48:36', NULL),
(215, 'Sage', 'uWzNmN.hpjbbdj@kerfuffle.asia', 'Liam Tran', 'Liam Tran', 'Liam Tran', 0, '0', '2024-02-11 13:38:38', '2024-02-11 13:38:38', NULL),
(216, 'Elizabeth Rivas', 'elizabeth@bwebpros.com', '06343 49 43 62', 'Enhancing Your Site With AI Chatbots', 'Are you familiar with the growing trend of AI-powered chatbots for websites? These intelligent helpers provide 24/7, personalized customer service, answer common questions instantly, and streamline user journeys. But are they right for you?\r\n\r\nConsider these benefits:\r\n\r\n* 24/7 Availability: Never miss a lead or inquiry, even after hours. Offer instant support, reducing customer frustration and wait times.\r\n* Personalized Assistance: Guide users to relevant information and product recommendations, fostering a positive experience and boosting engagement.\r\n* Valuable Insights: Collect data on customer behavior and preferences, allowing you to continuously optimize your website and offerings.\r\n\r\nBusiness Web Pro ( https://businesswebpros.com/service/ai-chatbot-integration/ )  specializes in crafting custom AI chatbot solutions tailored to your unique business needs and goals. We\'d love to learn more about your current challenges and explore how our chatbots can revolutionize your website experience.\r\n\r\nReady to see if AI chatbots are the missing piece in your puzzle?\r\n\r\n➡️ Schedule a free consultation at https://businesswebpros.com/service/ai-chatbot-integration/ to discuss your specific needs.', 0, '0', '2024-02-13 03:03:18', '2024-02-13 03:03:18', NULL),
(217, 'CharlesScarm', 'yasen.krasen.13+82649@mail.ru', '81162214547', 'Miieefjief jiwjdwkijdwf iwkdqdjwifehfuwi kwkdwjejeieifw jwioodwijrewhe', 'Ofokfojfief jwlkfeejereghfj iewojfekfjergij wiojewjfewitghuhwrgtjgh ewjhfwqjhdfuewgtuiwe huegfrwgyewgtywegt utkalenterprises.net', 0, '0', '2024-02-13 12:25:52', '2024-02-13 12:25:52', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(218, 'Max Braswell', 'braswell.merry@msn.com', '06-15565299', 'App and Web Development', 'I\'m Sam, a Web designer and App Developer, currently working with an Indian-based company, bringing over 7 years of experience to the field.\r\n\r\nWe specialize in developing a variety of apps, including:\r\n\r\n1. Food Delivery Apps, \r\n2. School Driving Training App, \r\n3. Taxi/Travel Apps, \r\n4. Real Estate Apps, \r\n5. Health Fitness Apps, \r\n6. M-Commerce Apps, \r\n7. Android Apps, \r\n8. Mac OSX Apps, \r\n9. Custom Web Apps, \r\n10. iPhone and iPad Apps\r\n\r\nWhether it\'s iPhone and iPad Apps or Android Apps, we\'ve got you covered. If you\'re interested in Mobile App or Web Development Services, I can provide you with our past work and pricing details. Click here for more information: https://outsource-bpo.com/website/\r\n\r\nPS: We also do SEO Services for your website. Excellent Results and Fair prices - https://digitalpromax.co/la/', 0, '0', '2024-02-13 23:52:09', '2024-02-13 23:52:09', NULL),
(219, 'Ben', 'fYBova.thwmwqd@carnana.art', 'Emma Stephens', 'Emma Stephens', 'Emma Stephens', 0, '0', '2024-02-15 22:30:23', '2024-02-15 22:30:23', NULL),
(220, 'Ladonna Redrick', 'ladonna.redrick@yahoo.com', '413 2619', 'Dear utkalenterprises.net Admin.', 'Hi there, my name is Cody Griner. I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting contractors on Google.  Can I share a testimonial \r\nfrom one of our clients with you?  I can also do a short zoom to \r\nillustrate their full case study if you have time for it? \r\ncody@mrmarketingres.com 843-720-7301', 0, '0', '2024-02-16 01:55:23', '2024-02-16 01:55:23', NULL),
(221, 'Mike Arthurs', 'mikeEngella@gmail.com', '88626194273', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Arthurs\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2024-02-16 14:13:52', '2024-02-16 14:13:52', NULL),
(222, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'This message reached you thru your website and I can make your ad message reach millions of sites in the same way. It\'s a very affordable way to advertise your business.For more information, please email me or skype me below.\r\n\r\nP. Stewart\r\nEmail: pgjcbs@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', 0, '0', '2024-02-17 16:35:20', '2024-02-17 16:35:20', NULL),
(223, 'RobertGex', 'lucido.leinteract@gmail.com', '81592534269', 'Hi  i write about   the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-02-18 04:20:31', '2024-02-18 04:20:31', NULL),
(224, 'RobertGex', 'lucido.leinteract@gmail.com', '83648361669', 'Hi  i write about   the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-02-18 04:20:34', '2024-02-18 04:20:34', NULL),
(225, 'RobertGex', 'lucido.leinteract@gmail.com', '89933237138', 'Hi  i write about   the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-02-18 04:20:37', '2024-02-18 04:20:37', NULL),
(226, 'RobertGex', 'lucido.leinteract@gmail.com', '87781484371', 'Hi  i write about   the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-02-18 04:20:40', '2024-02-18 04:20:40', NULL),
(227, 'RobertGex', 'lucido.leinteract@gmail.com', '82638764295', 'Hi  i write about   the price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-02-18 04:20:43', '2024-02-18 04:20:43', NULL),
(228, 'Lucy Johnson', 'lucyjohnson.web@gmail.com', '1234567890', 'Re: Website Design & development service for utkalenterprises.net', 'Hello,\r\n \r\nHope you are doing well\r\n \r\nI was surfing the internet and found your email contact.\r\n \r\n Are you looking for a website for your business or do you want to redesign your website with the latest features that might benefit the overall usability & user experience which usually leads to better sales! \r\n \r\nWe Deliver Following Services:\r\n\r\n∙         Web Designing & Development\r\n∙         Hosting and Domain Registration\r\n∙         Graphic Design & Logo Design\r\n∙         Add/Update new features\r\n \r\nLet me know if you are interested and want a fresh look so that we will be able to provide you with further solutions as per your requirements. \r\n \r\nI am looking forward to hearing from you soon.\r\n \r\nSincerely,\r\nLucy Johnson\r\n\r\n\r\n\r\n\r\nYour Website : utkalenterprises.net', 0, '0', '2024-02-19 03:14:32', '2024-02-19 03:14:32', NULL),
(229, 'Tigran Ayrapetyan', 'ujn2esbgakah@opayq.com', '89849563279', 'Subject: Capital Business Funding', 'Hello, \r\n \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. We are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nWe would like to review your business plan or executive summary to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\n \r\nI hope to hear back from you soon. \r\n \r\nSincerely, \r\n \r\nTigran Ayrapetyan \r\nInvestment Director \r\nDevcorp International W.L.L. \r\nP.O Box 10236 Shop No. 305 \r\nFlr 3 Manama Centre, Bahrain \r\nEmail: ayrapetyantigran99@gmail.com', 0, '0', '2024-02-20 18:12:10', '2024-02-20 18:12:10', NULL),
(230, 'Mike Roger', 'mikeenasia@gmail.com', '83615767769', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Roger\r\n \r\nMonkey Digital', 0, '0', '2024-02-20 20:38:31', '2024-02-20 20:38:31', NULL),
(231, 'MasonGex', 'kaenquirynicholls@gmail.com', '81376117859', 'Hello, i write about your the price for reseller', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', 0, '0', '2024-02-21 08:27:10', '2024-02-21 08:27:10', NULL),
(232, 'Amelia Brown', 'ameliabrown0325@gmail.com', '(02) 9058 7169', 'YouTube Promotion: 700-1000 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\n- We guarantee to gain you 700+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', 0, '0', '2024-02-21 16:33:11', '2024-02-21 16:33:11', NULL),
(233, 'Grant Lira', 'growthpartners13@gmail.com', '0497 61 97 83', 'Thought leadership via podcasts', 'Hey,\r\n\r\nThis Feb I’ll get you on 3 podcasts/mo + 15 professionally edited short-form videos for social media (from the podcasts) + 3 features in online publications/mo - done for you.\r\n\r\nWe’ve helped 37 clients do just that to build their thought leadership in their specific industry which has helped them:\r\n\r\n- Generate more appointments\r\n- Close at a higher % (Because they built authority before the meeting even started)\r\n- Charge higher amounts because people view their company as a premium option \r\n\r\nInterested? We are raising our service by 30 % on Feb 29th, but if we chat before then, you’ll be locked in at the current amount. We can chat here:\r\n\r\nhttps://bit.ly/empathyfirm-30-minute-meeting\r\n\r\nBest,\r\nGrant\r\n\r\nPS - I will not see your response so if you have a question, book a time to chat (:\r\n\r\n\r\n\r\nN6565 Shorewood Hills Rd. Lake Mills WI, 53551\r\nEmail unsubnow1@gmail.com with your website to “unsub” meaning you will not hear from me again.', 0, '0', '2024-02-22 03:04:55', '2024-02-22 03:04:55', NULL),
(234, 'Krista Sammons', 'sammons.krista@yahoo.com', '(03) 5383 4110', 'Hi utkalenterprises.net Admin.', 'GAMIFY your videos and get viewers to happily give you their email and phone number.  There is no other tech like this..it’s the next big thing. As seen on CBS, NBC, FOX, and ABC.  \r\nSee if you qualify for a free GAMIFICATION of your video.\r\n\r\nContact me via my email or skype below for more details\r\n\r\n\r\nRobert\r\nemail: gamifyvideo@gmail.com\r\nskype: live:.cid.d347be37995c0a8d', 0, '0', '2024-02-24 07:10:28', '2024-02-24 07:10:28', NULL),
(235, 'Mike James', 'peterrobe@gmail.com', '83475223648', 'Whitehat SEO for utkalenterprises.net', 'Hello \r\n \r\nI have just analyzed  utkalenterprises.net for its SEO metrics and saw that your website could use an upgrade. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike James\r\n \r\nDigital X SEO Experts', 0, '0', '2024-02-25 14:57:58', '2024-02-25 14:57:58', NULL),
(236, 'RobertGex', 'lucido.leinteract@gmail.com', '83913661726', 'Hello, i am wrote about your the price', 'Szia, meg akartam tudni az árát.', 0, '0', '2024-02-25 15:36:34', '2024-02-25 15:36:34', NULL),
(237, 'RobertGex', 'lucido.leinteract@gmail.com', '81455828316', 'Hallo  i writing about your the price', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-02-26 21:51:25', '2024-02-26 21:51:25', NULL),
(238, 'RobertGex', 'lucido.leinteract@gmail.com', '85478627835', 'Hallo  i writing about your the price', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-02-26 21:51:28', '2024-02-26 21:51:28', NULL),
(239, 'RobertGex', 'lucido.leinteract@gmail.com', '85634467185', 'Hallo  i writing about your the price', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-02-26 21:51:32', '2024-02-26 21:51:32', NULL),
(240, 'RobertGex', 'lucido.leinteract@gmail.com', '83755951492', 'Hallo  i writing about your the price', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-02-26 21:51:35', '2024-02-26 21:51:35', NULL),
(241, 'RobertGex', 'lucido.leinteract@gmail.com', '87467554299', 'Hallo  i writing about your the price', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-02-26 21:51:37', '2024-02-26 21:51:37', NULL),
(242, 'Alex Coury', 'ernesto.coury@yahoo.com', '061 653 78 49', 'Turbo Charged Backlinks for SEO', 'Get Our Turbo Charged Link Building Plan: https://alwaysdigital.co/lgt/\r\n\r\n1. Brand Awareness\r\n2. Recurring Income\r\n3. Builds Credibility\r\n4. Boosts Online Visibility\r\n5. Opens Better Revenue Opportunities\r\n6. Increase Your Website Traffic\r\n7. Raises Your SEO Scores and Site Metric\r\n8. Ensures Consistent Conversion Rates\r\n9. Collect Email Subscribers \r\n10. More Social Media Followers \r\n11. Gets Your Page Indexed Fast by Increasing Your Crawl Rate\r\n12. Supports Google Ranking Criteria\r\n\r\nContact us @ https://alwaysdigital.co/lgt/', 0, '0', '2024-02-27 04:45:19', '2024-02-27 04:45:19', NULL),
(243, 'Bill MacDonnell', 'macdonnell.bill@googlemail.com', '951-500-2482', 'Hi utkalenterprises.net Webmaster.', 'For a limited time we would like to offer you a NO-COST Reputation Video that you can put on your Website, LinkedIn, Facebook, Instagram etc.\r\n\r\nWe simply turn your static 5 Star Reviews into SEO content and will be seen on the Front Page of Google when prospects are looking up your Online Reputation.\r\n\r\nWhat\'s the Catch - excellent question - if you like the video we produce for you, all we need from you is 3 referrals.\r\n\r\nWhen you introduce them to us, they will get a 50% Discount from our retail pricing.\r\n\r\nGET YOUR NO-CHARGE VIDEO HERE:\r\nhttps://YourFreeReputationVideo.com\r\n\r\nThank You,\r\nMedia Relations', 0, '0', '2024-02-27 20:51:47', '2024-02-27 20:51:47', NULL),
(244, 'Mike MacAdam', 'mikeSpeeliGala@gmail.com', '89216359895', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike MacAdam', 0, '0', '2024-02-27 22:17:28', '2024-02-27 22:17:28', NULL),
(245, 'Raina', 'JoJMEv.mbhqwtc@tonetics.biz', 'Ridge Dunlap', 'Ridge Dunlap', 'Ridge Dunlap', 0, '0', '2024-02-29 15:35:46', '2024-02-29 15:35:46', NULL),
(246, 'Mike Wallace', 'mikeel@gmail.com', '81993674881', 'NEW: Semrush Backlinks', 'Hi \r\n \r\nThis is Mike Wallace\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Wallace\r\n \r\nmike@strictlydigital.net', 0, '0', '2024-02-29 16:59:48', '2024-02-29 16:59:48', NULL),
(247, 'Mikayla Kirklin', 'mikayla.kirklin1@outlook.com', '0372 8049977', 'Dear utkalenterprises.net Administrator.', 'Are you okay running your business without much funds? This could slow down growth and delay returns on your business.\r\n\r\nNow you have the Opportunity to Fund your Busineses and Projects without stress and without the burden of repayment as our interest in first for the growth of your business and projects, and for your to arrive at your desired business goals and dreams.\r\n\r\nTake advantage of our Funding opportunity and get funded on your business and Projects within days and have an ample number of years/Loan Term Period which gives you time to grow and achieve your business goals.\r\n\r\nGive us a call on:\r\n+852 3008 8373, \r\nor write us at:\r\ninfo@capitalfund-hk.com', 0, '0', '2024-03-02 17:24:14', '2024-03-02 17:24:14', NULL),
(248, 'Libby Evans', 'libbyevans461@gmail.com', '450-449-0379', 'Accelerate Your Instagram Growth: Gain 300-1000 New Followers Monthly', 'Hi there,\r\n\r\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \r\n\r\n- We guarantee to gain you 300-1000+ followers per month.\r\n- People follow you because they are interested in you, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nLibby', 0, '0', '2024-03-03 03:53:41', '2024-03-03 03:53:41', NULL),
(249, 'Jaimfug', 'jab1Rop@gmail.com', '83292468755', 'We send an invite', 'Hello! We are sending you a promotional code to participate in our joint crypto traiding project \r\nWe will be glad to see you on our team! Your promo code for 0.5ETH - ILMS24 \r\nThe number of invites is limited, register - https://cexasia.pro', 0, '0', '2024-03-04 10:55:02', '2024-03-04 10:55:02', NULL),
(250, 'Mike Derrick', 'mikeAmorpApercebiony@gmail.com', '85318591446', 'Improve local visibility for utkalenterprises.net', 'If you are looking to rank your local business on Google Maps in a specific area, this service is for you. \r\n \r\nGoogle Map Stacking is a highly effective technique for ranking your GMB within a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\n \r\nThanks and Regards \r\nMike Mike Derrick\r\n \r\n \r\nPS: Want a comprehensive local plan that covers everything? \r\nhttps://www.speed-seo.net/product/local-seo-bundle/', 0, '0', '2024-03-05 01:27:51', '2024-03-05 01:27:51', NULL),
(251, 'Sam Schramm', 'ariel.schramm68@msn.com', '01.57.50.49.52', 'Struggling to Launch Your Online E-commerce Store?', 'Struggling to Launch Your Online E-commerce Store?\r\nMissing out on potential sales and customers? Building a successful eCommerce site can be complex and time-consuming.\r\nTransform Your Business with Expert eCommerce Development at affordable prices!\r\n\r\n������ Benefits:\r\n✅ Customized Online Stores\r\n✅ Seamless User Experience\r\n✅ Boosted Sales and Conversions\r\n\r\n������ Ready to create an E-Commerce store? Start Today!\r\n������ https://outsource-bpo.com/website/?src=m14utkalenterprises.net\r\n\r\nDon\'t let eCommerce challenges hold you back. Launch a powerful online store with our expert eCommerce development services!', 0, '0', '2024-03-05 11:37:40', '2024-03-05 11:37:40', NULL),
(252, 'Jeannie Rodarte', 'rodarte.jeannie@gmail.com', '07345 81 89 82', '������������������ Event', '������������ Attention music lovers! ������������\r\n\r\nWow, All the best Sax Summer music  !!!\r\n\r\n������ Spotify: https://open.spotify.com/artist/6ShcdIT7rPVVaFEpgZQbUk\r\n������ Apple Music: https://music.apple.com/fr/artist/jimmy-sax-black/1530501936\r\n������ YouTube: https://music.youtube.com/browse/VLOLAK5uy_noClmC7abM6YpZsnySxRqt3LoalPf88No\r\n������ Other Platforms and Free Downloads :  https://fanlink.to/jimmysaxblack\r\n\r\n\r\nGet back into the groove with Jimmy sax Black\r\nBest regards,\r\n\r\nJimmy sax Black\r\nwww.jimmysaxblack.com', 0, '0', '2024-03-07 02:16:11', '2024-03-07 02:16:11', NULL),
(253, 'Karri Dunhill', 'dunhill.karri45@gmail.com', '08262 79 51 48', 'Dear utkalenterprises.net Admin!', 'Tired of manual tasks bogging you down? Let me revolutionize your workflow with custom automation scripts tailored to your needs. From data entry to report generation, imagine the time you\'ll save when repetitive tasks are automated.\r\n\r\nPicture this: Instead of spending hours copy-pasting data from spreadsheets into your database, imagine a script that seamlessly syncs your data with a single click. Need to compile comprehensive reports? Imagine a script that sifts through vast datasets, extracting key insights and presenting them in an easily digestible format, leaving you more time to strategize and innovate.\r\n\r\nWhether it\'s streamlining customer interactions, optimizing inventory management, or enhancing data analysis, automation holds the key to efficiency and productivity. Say goodbye to tedious manual labor and hello to a smoother, more efficient workflow. Let\'s transform your work processes together. Send me an email and we can discuss what you need: j4xy5u@mail2go.xyz', 0, '0', '2024-03-07 19:19:57', '2024-03-07 19:19:57', NULL),
(254, 'RobertGex', 'lucido.leinteract@gmail.com', '83856134556', 'Hi  i writing about   the prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2024-03-08 06:40:23', '2024-03-08 06:40:23', NULL),
(255, 'RobertGex', 'lucido.leinteract@gmail.com', '81968541253', 'Hi  i writing about   the prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2024-03-08 06:40:26', '2024-03-08 06:40:26', NULL),
(256, 'RobertGex', 'lucido.leinteract@gmail.com', '85268565316', 'Hi  i writing about   the prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2024-03-08 06:40:28', '2024-03-08 06:40:28', NULL),
(257, 'RobertGex', 'lucido.leinteract@gmail.com', '89734293159', 'Hi  i writing about   the prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2024-03-08 06:40:31', '2024-03-08 06:40:31', NULL),
(258, 'RobertGex', 'lucido.leinteract@gmail.com', '84134562562', 'Hi  i writing about   the prices', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2024-03-08 06:40:34', '2024-03-08 06:40:34', NULL),
(259, 'Kush', 'hello@digitalqcube.com', '469-663-1569', 'Re: Limited-Time Promotion ! New business website at pocket friendly prices with DQ !', 'Hello, \r\n\r\nI trust this email reaches you in good health.\r\n\r\nJust want to introduce Digital Qcubes, our INTERACTIVE CUSTOMISED WEBSITES with NO DIY HASSLE - Our Experts do everything specially for you.\r\n\r\nServing 100+ business categories.  \"At just $24.99/month\" \r\n\r\n. Fully Custom designed website\r\n. Hosting Included\r\n. No Setup Cost\r\n. No Template\r\n. No Complicated Tech\r\n. No Hidden Charges\r\n. 24x7 Support\r\n. Mobile Friendly\r\n. No DIY Hassle\r\n. We do it for you\r\n. Effortless & Budget Friendly\r\n\r\nLet\'s connect to answer all your questions. \r\n\r\nDedicated to your success,\r\nName : Kush \r\nEmail:- hello@digitalqcube.com\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe.”', 0, '0', '2024-03-08 08:08:43', '2024-03-08 08:08:43', NULL),
(260, 'Christel Boyles', 'christel.boyles@gmail.com', '970-282-3326', 'Hello utkalenterprises.net Admin.', 'Hi! Wanna boost your credibility online by having a premium website without breaking the bank? btw im roniel im the founder of cyberhero web design Ltd. \r\n\r\nWe are a creative agency specialize on creating high quality website tailored for your business\r\n\r\nTo work with us you can get intouch using the info below\r\nWebsite: www.cyberhero.site\r\n\r\nEmail: admin@cyberhero.site', 0, '0', '2024-03-09 20:51:38', '2024-03-09 20:51:38', NULL),
(261, 'Amelia Brown', 'ameliabrown0325@gmail.com', 'E boad', 'Get 700 REAL YouTube Subscribers Monthly (Safe & Organic)', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically. \r\n\r\nOur focus is on organic growth strategies that nurture a thriving community around your channel. We don\'t use bots or gimmicks, just targeted engagement tactics to help you reach the right people.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', 0, '0', '2024-03-11 05:04:11', '2024-03-11 05:04:11', NULL),
(262, 'Ricardo Garden', 'ricardo.garden47@gmail.com', '04.51.54.59.39', 'Find the best leads for utkalenterprises.net', 'Hi!\r\n\r\nIt is with sad regret to inform you that LeadsFly is shutting down!\r\n\r\nWe have made available all our consumer and business leads for the entire world on our way out.\r\n\r\nWe have the following available worldwide:\r\n\r\nConsumer Records: 294,582,351\r\nBusiness Records: 25,215,278\r\n\r\nVisit us here: https://leadsfly.biz/utkalenterprises.net/\r\n\r\nBest regards,\r\nRicardo', 0, '0', '2024-03-11 20:47:37', '2024-03-11 20:47:37', NULL),
(263, 'Bobbie Galbraith', 'bobbie.galbraith@gmail.com', '455 62 007', 'Find the best leads for utkalenterprises.net', 'Hi!\r\n\r\nIt is with sad regret to inform you that LeadsFly is shutting down!\r\n\r\nWe have made available all our consumer and business leads for the entire world on our way out.\r\n\r\nWe have the following available worldwide:\r\n\r\nConsumer Records: 294,582,351\r\nBusiness Records: 25,215,278\r\n\r\nVisit us here: https://leadsfly.biz/utkalenterprises.net/\r\n\r\nBest regards,\r\nBobbie', 0, '0', '2024-03-11 23:56:57', '2024-03-11 23:56:57', NULL),
(264, 'Rob Sargood', 'josefa.sargood@gmail.com', '(07) 4532 6085', 'Hi utkalenterprises.net Administrator.', 'GAMIFY your videos and get viewers to happily give you their email and phone number.  \r\n\r\nThere is no other tech like this..it’s the next big thing. As seen on CBS, NBC, FOX, and ABC.  \r\n\r\nSee if you qualify for a free GAMIFICATION of your video.\r\n\r\nContact me via my email or skype below for more details\r\n\r\n\r\nRobert\r\nemail: gamifyvideo@gmail.com\r\nskype: live:.cid.d347be37995c0a8d', 0, '0', '2024-03-12 08:33:03', '2024-03-12 08:33:03', NULL),
(265, 'RobertGex', 'lucido.leinteract@gmail.com', '86596163965', 'Aloha  i writing about your the price', 'Hallo, ek wou jou prys ken.', 0, '0', '2024-03-13 03:51:54', '2024-03-13 03:51:54', NULL),
(266, 'Sabine Bockman', 'sabine.bockman@outlook.com', '077 8530 6374', 'Find the best leads for utkalenterprises.net', 'Hi!\r\n\r\nIt is with sad regret to inform you that LeadsFly is shutting down!\r\n\r\nWe have made available all our consumer and business leads for the entire world on our way out.\r\n\r\nWe have the following available worldwide:\r\n\r\nConsumer Records: 294,582,351\r\nBusiness Records: 25,215,278\r\n\r\nVisit us here: https://leadsfly.biz/utkalenterprises.net/\r\n\r\nBest regards,\r\nSabine', 0, '0', '2024-03-14 10:14:55', '2024-03-14 10:14:55', NULL),
(267, 'RobertGex', 'lucido.leinteract@gmail.com', '88415218682', 'Hello    wrote about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-03-15 03:25:42', '2024-03-15 03:25:42', NULL),
(268, 'RobertGex', 'lucido.leinteract@gmail.com', '83499111121', 'Hello    wrote about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-03-15 03:25:45', '2024-03-15 03:25:45', NULL),
(269, 'RobertGex', 'lucido.leinteract@gmail.com', '85449172965', 'Hello    wrote about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-03-15 03:25:48', '2024-03-15 03:25:48', NULL),
(270, 'RobertGex', 'lucido.leinteract@gmail.com', '89763828567', 'Hello    wrote about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-03-15 03:25:52', '2024-03-15 03:25:52', NULL),
(271, 'RobertGex', 'lucido.leinteract@gmail.com', '81117824628', 'Hello    wrote about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-03-15 03:25:56', '2024-03-15 03:25:56', NULL),
(272, 'Robby Tritt', 'tritt.chi@gmail.com', '27-97-52-35', 'Hi utkalenterprises.net Administrator!', 'Is Your Website Not Ranking In Google?\r\nLosing potential customers to competitors? Your website\'s low rankings are costing you valuable leads and revenue.\r\nBoost Your Rankings with Monthly SEO Services!\r\n\r\n>> Benefits:\r\n> Increase Search Engine Rankings\r\n> Drive Targeted Traffic\r\n> Boost Conversions\r\n> 4x Profits\r\n\r\n>> Transform Your Business Today!\r\n>> Click here to know more: https://alwaysdigital.co/?src=m14utkalenterprises.net', 0, '0', '2024-03-15 11:02:21', '2024-03-15 11:02:21', NULL),
(273, 'Theresa Smith', 'reece.woodworth@hotmail.com', '92668443', 'Quick question', 'Hello,\r\n\r\nDo you sometimes find yourself in a tug of war between work and fitness? We have the perfect solution for you - Elebands! \r\n\r\nElebands offers ultra-thin, fashionable all day wearable body weight bands that seamlessly integrate into your daily routine. Burn up to 1,500 calories a day by simply wearing our bands on your wrist, ankle, and waist while you go about your normal day.\r\n\r\nThe best part is we have full body weight sets ranging from 3lbs – 30lbs to ensure optimal results no matter what your fitness goals are. \r\n\r\nPlus! We have bands for sports, casual, and formal occasions that you can wear with any outfit, ensuring you stay stylish while achieving your fitness goals.\r\n\r\nWith Elebands, you no longer have to choose between work and exercise. Our body weight bands enable you to lose weight and get fit regardless of your location or activity. Enjoy these instant benefits:\r\n\r\n1. Burn Calories: Effortlessly burn up to 1,500 calories daily, toning your body as you go about your day.\r\n\r\n2. Natural Weight Loss: Say goodbye to intense workouts and stressful diets. Elebands helps you lose weight naturally.\r\n\r\n3. Build Strength: Develop lean muscles and enhance your strength as you carry out your regular activities.\r\n\r\nImagine achieving your dream body without stepping foot in a gym or following a strict diet plan. With Elebands, it\'s possible.\r\n\r\nMany of our clients are losing 2-3 pounds per week while experiencing significant health improvements. To help you get started for the NEW YEAR, use coupon code SAVE-20%-TODAY for a 20% discount. \r\n\r\nVisit our website now at https://bit.ly/elebands-special and embrace the Elebands experience.\r\n\r\nLet Elebands be your partner in achieving a fit and healthy lifestyle. Start your transformation today!\r\n\r\nWarm regards,\r\n\r\nTheresa Smith\r\nBrand Ambassador\r\nElebands USA\r\n\r\nVisit our website NOW!   https://bit.ly/elebands-special', 0, '0', '2024-03-15 18:01:52', '2024-03-15 18:01:52', NULL),
(274, 'Theresa Smith', 'reece.woodworth@hotmail.com', '92668443', 'Quick question', 'Hello,\r\n\r\nDo you sometimes find yourself in a tug of war between work and fitness? We have the perfect solution for you - Elebands! \r\n\r\nElebands offers ultra-thin, fashionable all day wearable body weight bands that seamlessly integrate into your daily routine. Burn up to 1,500 calories a day by simply wearing our bands on your wrist, ankle, and waist while you go about your normal day.\r\n\r\nThe best part is we have full body weight sets ranging from 3lbs – 30lbs to ensure optimal results no matter what your fitness goals are. \r\n\r\nPlus! We have bands for sports, casual, and formal occasions that you can wear with any outfit, ensuring you stay stylish while achieving your fitness goals.\r\n\r\nWith Elebands, you no longer have to choose between work and exercise. Our body weight bands enable you to lose weight and get fit regardless of your location or activity. Enjoy these instant benefits:\r\n\r\n1. Burn Calories: Effortlessly burn up to 1,500 calories daily, toning your body as you go about your day.\r\n\r\n2. Natural Weight Loss: Say goodbye to intense workouts and stressful diets. Elebands helps you lose weight naturally.\r\n\r\n3. Build Strength: Develop lean muscles and enhance your strength as you carry out your regular activities.\r\n\r\nImagine achieving your dream body without stepping foot in a gym or following a strict diet plan. With Elebands, it\'s possible.\r\n\r\nMany of our clients are losing 2-3 pounds per week while experiencing significant health improvements. To help you get started for the NEW YEAR, use coupon code SAVE-20%-TODAY for a 20% discount. \r\n\r\nVisit our website now at https://bit.ly/elebands-special and embrace the Elebands experience.\r\n\r\nLet Elebands be your partner in achieving a fit and healthy lifestyle. Start your transformation today!\r\n\r\nWarm regards,\r\n\r\nTheresa Smith\r\nBrand Ambassador\r\nElebands USA\r\n\r\nVisit our website NOW!   https://bit.ly/elebands-special', 0, '0', '2024-03-15 18:02:00', '2024-03-15 18:02:00', NULL),
(275, 'Samara', 'utkalenterprises.net@outlook.com', '077 8693 1204', 'Contact Us', 'Morning \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF: https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nBest Wishes, \r\n\r\nSamara', 0, '0', '2024-03-15 20:44:47', '2024-03-15 20:44:47', NULL),
(276, 'Glenda Strub', 'strub.glenda@msn.com', '620293718', 'To the utkalenterprises.net Owner.', '4/15/24 is the deadline to claim the SETC for your 2020 amended tax return. Today is 3/7/2024. \r\nIndividuals can still claim their Self-Employed Tax Credit (SETC), worth up to $32,220, under the FFCRA. Here is everything you need to know.\r\nThe Self-Employed Tax Credit (SETC) refers to the sick leave and family leave tax credit provisions for self-employed individuals introduced under the FFCRA. The SETC allows qualified self-employed workers to recover up to $32,220 for 2019, 2020, and 2021.\r\nDon’t miss your COVID tax credit: \r\nCall Kerry at 480-790-9186\r\nEmail Kerry at processing@taxcreditfunder.com\r\nOr watch the explanation here: https://taxcreditfunder.com/en/', 0, '0', '2024-03-16 07:22:11', '2024-03-16 07:22:11', NULL),
(277, 'Sterling Caballero', 'sterling.caballero@gmail.com', '647912004', 'Hi utkalenterprises.net Administrator!', 'Claim your Reputation Video at no cost to you! Watch as we transform your exceptional 5-star reviews into captivating SEO content, propelling your visibility on Google\'s front page. Get your NO COST video here: http://free-videos.info', 0, '0', '2024-03-16 07:29:40', '2024-03-16 07:29:40', NULL),
(278, 'krisette', 'qmwbtbpbw.qc@monochord.xyz', 'krisette mcglotten', 'krisette mcglotten', 'krisette mcglotten', 0, '0', '2024-03-16 09:40:59', '2024-03-16 09:40:59', NULL),
(279, 'Bella', 'bellaDeF@gmail.com', '81398283114', 'The best offer for you today only!', 'https://bit.ly/3NvpST9 Huge selection!', 0, '0', '2024-03-16 12:47:30', '2024-03-16 12:47:30', NULL),
(280, 'Mike Dutton', 'mikeEngella@gmail.com', '89732371769', 'FREE fast ranks for utkalenterprises.net', 'Hi there \r\n \r\nJust checked your utkalenterprises.net baclink profile, I noticed a moderate percentage of toxic links pointing to your website \r\n \r\nWe will investigate each link for its toxicity and perform a professional clean up for you free of charge. \r\n \r\nStart recovering your ranks today: \r\nhttps://www.hilkom-digital.de/professional-linksprofile-clean-up-service/ \r\n \r\nRegards \r\nMike Dutton\r\nHilkom Digital SEO Experts \r\nhttps://www.hilkom-digital.de/', 0, '0', '2024-03-16 21:08:06', '2024-03-16 21:08:06', NULL),
(281, 'Mark Dodge', 'roy.dodge@gmail.com', '(08) 8262 1542', 'Hello utkalenterprises.net Administrator.', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a', 0, '0', '2024-03-17 02:25:11', '2024-03-17 02:25:11', NULL),
(282, 'Elbert Crow', 'elbert.crow@gmail.com', '679245825', 'To the utkalenterprises.net Admin.', 'Hi there, my name is Cody Griner. I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting contractors on Google.  Can I share a testimonial \r\nfrom one of our clients with you?  I can also do a short zoom to \r\nillustrate their full case study if you have time for it? \r\ncody@mrmarketingres.com 843-720-7301', 0, '0', '2024-03-18 13:06:24', '2024-03-18 13:06:24', NULL),
(283, 'MasonGex', 'kaenquirynicholls@gmail.com', '82659552468', 'Hallo,   write about     price for reseller', 'Kaixo, zure prezioa jakin nahi nuen.', 0, '0', '2024-03-18 16:36:12', '2024-03-18 16:36:12', NULL),
(284, 'Mike Edwards', 'mikeenasia@gmail.com', '85421516772', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.monkeydigital.org/affiliate-dashboard/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Edwards\r\n \r\nMonkey Digital', 0, '0', '2024-03-18 21:53:59', '2024-03-18 21:53:59', NULL),
(285, 'Georgina Haynes', 'georginahaynes620@gmail.com', '915261878', 'Video Promotion', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site utkalenterprises.net.\r\n\r\nCheck out some of our existing videos here:\r\nhttps://www.youtube.com/watch?v=bWz-ELfJVEI\r\nhttps://www.youtube.com/watch?v=Y46aNG-Y3rM\r\nhttps://www.youtube.com/watch?v=hJCFX1AjHKk\r\n\r\nAll of our videos are in a similar animated format as the above examples, and we have voice over artists with US/UK/Australian accents. We can also produce voice overs in languages other than English.\r\n\r\nThey can show a solution to a problem or simply promote one of your products or services. They are concise, can be uploaded to video sites such as YouTube, and can be embedded into your website or featured on landing pages.\r\n\r\nOur prices are as follows depending on video length:\r\nUp to 1 minute = $259\r\n1-2 minutes = $379\r\n2-3 minutes = $489\r\n\r\n*All prices above are in USD and include a full script, voice-over and video.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nGeorgina', 0, '0', '2024-03-19 02:06:01', '2024-03-19 02:06:01', NULL),
(286, 'Grant Lira', 'growthpartners13@gmail.com', '890185224', 'April 15th podcast', 'Monthly, you\'ll be featured on 3 podcasts + 15 professionally edited short-form social media videos from these podcasts, and have 3 online publication features - completely DFY.\r\n\r\nWe’ve helped 43 clients do just that to build their thought leadership in their specific industry which has helped them:\r\n\r\n- Generate more appointments\r\n- Close at a higher % (Because they built authority before the meeting even started)\r\n- Charge higher amounts because people view their company as a premium option \r\n\r\nInterested? We are raising our service by 22 % on April 15th, but if we chat before then, you’ll be locked in at the current amount. We can chat here:\r\n\r\nhttps://bit.ly/empathyfirm-30-minute-meeting\r\n\r\nBest,\r\nGrant\r\n\r\nPS - I will not see your response so if you have a question, book a time to chat (:\r\n\r\n\r\n\r\nN6565 Shorewood Hills Rd. Lake Mills WI, 53551\r\nEmail unsubnow1@gmail.com with your website to “unsub” meaning you will not hear from me again.', 0, '0', '2024-03-19 09:37:19', '2024-03-19 09:37:19', NULL),
(287, 'Iirinaaburb', 'memsTruts@gmail.com', '84524791474', 'Very interesting offer!', 'Hi! Have s3x in your city today.  -  https://rb.gy/9pkq6l?aburb', 0, '0', '2024-03-20 15:46:08', '2024-03-20 15:46:08', NULL),
(288, 'Dave Leason', 'leason.mitchell33@hotmail.com', '0330 0843750', 'Hi utkalenterprises.net Administrator!', 'Have you heard of Se-REM? (Self effective - Rapid Eye Movement). Many people don\'t know that REM brain activity dramatically improves the processing of traumatic emotion. It creates peace and empowers the listener. Se-REM is an advanced version of EMDR therapy. It is more powerful because it combines elements of 6 different therapies, EMDR, hypnosis, mindfulness, Gestalt child within work, music therapy, and Awe therapy,(connecting profoundly with nature).\r\n\r\nIt has helped thousands of people overcome PTSD, and anxiety. But it is also helpful in a great many situations, loss of any kind, grief, and even marital counseling. It\'s mission statement is \"Trauma relief at as close to free as possible\". This not-for-profit program downloads to a smart phone or computer and can be used in an office or at home. Read about it, hear samples, and download at: Se-REM.com. Once you own the program, you are encouraged to give it away to others who will benefit. I provide free consultation to all who use the program. Write questions to: davidb@se-rem.com.\r\n\r\nSe-REM.com has a 95% rating on Trustpilot and is in use in 32 countries.', 0, '0', '2024-03-20 23:18:01', '2024-03-20 23:18:01', NULL),
(289, 'SpeedyIndex', 'speedyindex@gmail.com', '87535654876', 'SpeedyIndexBot - 100 links for FREE', 'https://bit.ly/3OV6orJ service for fast indexing of links in Google. First result in 48 hours. 100 links for FREE.', 0, '0', '2024-03-21 11:21:12', '2024-03-21 11:21:12', NULL),
(290, 'Mike Cooper', 'peterrobe@gmail.com', '87172732916', 'Whitehat SEO for utkalenterprises.net', 'Hello \r\n \r\nI have just took a look on your SEO for  utkalenterprises.net for  the current search visibility and saw that your website could use an upgrade. \r\n \r\nWe will enhance your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/unbeatable-seo/ \r\n \r\n \r\nRegards \r\nMike Cooper\r\n \r\nDigital X SEO Experts', 0, '0', '2024-03-21 15:01:37', '2024-03-21 15:01:37', NULL),
(291, 'Iliya', 'ilyaRecix@gmail.com', '89359711878', 'Нужен трафик на сайт или ссылочная масса?', 'https://kwork.ru/user/live_for_seo здравствуйте, меня зовут Илья. Я являюсь seo специалистом и готов предложить Вам свои услуги по наращиванию трафика на сайт или ссылочной массы на сайты или аккаунты социальных сетей. \r\n \r\nОбращайтесь, буду рад сотрудничеству. \r\n \r\nДля вопросов по телеграм https://t.me/ilya_polin62', 0, '0', '2024-03-21 18:04:55', '2024-03-21 18:04:55', NULL),
(292, 'Imogen Millard', 'millard.imogen@gmail.com', '67 296 50 29', 'To the utkalenterprises.net Administrator.', 'Explore Europe Without Data Limits!\r\n\r\nUnlimited 4/5G Data SIM Card: Say goodbye to roaming charges and data anxiety. Stay connected across Europe hassle-free!\r\n\r\nGet Yours Now!  http://www.prepaideuropa.online/', 0, '0', '2024-03-22 02:16:14', '2024-03-22 02:16:14', NULL),
(293, 'Aubrey Old', 'aubrey.old50@hotmail.com', '745651161', 'To the utkalenterprises.net Owner!', 'Are you okay running your business without much funds? This could slow down growth and delay returns on your business.\r\n\r\nNow you have the Opportunity to Fund your Busineses and Projects without stress and without the burden of repayment as our interest in first for the growth of your business and projects, and for your to arrive at your desired business goals and dreams.\r\n\r\nTake advantage of our Funding opportunity and get funded on your business and Projects within days and have an ample number of years/Loan Term Period which gives you time to grow and achieve your business goals.\r\n\r\nGive us a call on:\r\n+852 3008 8373, \r\nor write us at:\r\ninfo@capitalfund-hk.com', 0, '0', '2024-03-22 06:14:04', '2024-03-22 06:14:04', NULL),
(294, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Hey, looking to boost your ad game? Picture your message hitting website contact forms worldwide, grabbing attention from potential customers everywhere! Starting at just under a hundred bucks my budget-friendly packages are designed to make an impact. Drop me an email now to discuss how you can get more leads and sales now!\r\n\r\nP. Stewart\r\nEmail: l4bqlw@gomail2.xyz\r\nSkype: live:.cid.2bc4ed65aa40fb3b', 0, '0', '2024-03-22 13:30:54', '2024-03-22 13:30:54', NULL),
(295, 'KatyaReeminy3', 'hiveDiaceSic@gmail.com', '85756138948', 'Hi love, how\'s your day?', 'Fancy a moonlit stroll along the beach under the stars, followed by a bonfire picnic for two?  -   https://rb.gy/5nfvy9?aburb', 0, '0', '2024-03-24 02:43:29', '2024-03-24 02:43:29', NULL),
(296, 'ProdvigenieST', 'youurmail@gmail.com', '81679759748', 'Увеличу посещаемость и доходность сайта', 'Здравствуйте. Я готов помочь увеличить посещаемость и доходность вашего сайта, а также решить все имеющиеся на сайте проблемы. Причем рост посещаемости будет идти за счет притока целевых посетителей из поисковых систем, что для вас максимально выгодно и перспективно. \r\n \r\nНемного информации о себе. Я являюсь специалистом в области создания, доработки и продвижения сайтов. Также имею знания и опыт в ряде смежных областей. Работаю в этих сферах с 2004 года. Стараюсь объяснять сложные вопросы простыми словами. Работу выполняю качественно. Готов заключить договор. \r\n \r\nОсновные направления моей деятельности: \r\n \r\n1. Внутренняя оптимизация. Все необходимые работы по сайту с целью достижения наилучших позиций в поисковых системах, улучшение конверсионных качеств и юзабилити, решение всех встреченных ошибок, при необходимости внедрение нового или улучшение старого функционала. \r\n \r\n2. Продвижение в поисковых системах. Работа с улучшением позиций по значимым для вас поисковым запросам, что способно дать большой приток целевой аудитории на сайт. \r\n \r\n3. Создание сайтов различных типов. Могу создать лендинг, интернет-магазин, сайт компании, информационный сайт, блог и иные разновидности сайтов. \r\n \r\n4. Настройка рекламных кампаний в различных сервисах контекстной рекламы. \r\n \r\n5. Работа с отзывами в интернете. Создание и продвижение хороших отзывов, а также скрытие и удаление плохих. \r\n \r\n6. Создание, доработка и продвижение групп и каналов в социальных сетях. Сюда входит: youtube, телеграм, вконтакте и другие. \r\n \r\n7. Различного рода рассылки, которые обычно дают хороший единоразовый приток продаж (рассылки можно периодически повторять). \r\n \r\nТакже могу помочь вам и в ряде иных вопросов. Пишите на почту: prodvigeniemr@gmail.com', 0, '0', '2024-03-25 08:52:17', '2024-03-25 08:52:17', NULL),
(297, 'KatyaReeminy3', 'hiveDiaceSic@gmail.com', '84446418825', 'Hi love, how\'s your day?', 'Perhaps we could book a couples\' spa day for some relaxation and pampering - what do you say?  -   https://rb.gy/5nfvy9?aburb', 0, '0', '2024-03-25 18:07:38', '2024-03-25 18:07:38', NULL),
(298, 'Eleanor Corbould', 'eleanor.corbould@hotmail.com', '71-21-16-11', 'Today Only', 'Hi,\r\n\r\nWant thousands of clients? We have compiled a list of all consumers and business\'s across 149 countries for you.\r\n\r\nWe have a special that is running today and valid till the end of the day. Come check us out:\r\n\r\nhttps://utkalenterprises.leadsmax.biz/\r\n\r\nConsumer Records: 294,582,351\r\nBusiness Records: 25,215,278\r\n\r\nSelling at $99 today only.', 0, '0', '2024-03-25 19:56:02', '2024-03-25 19:56:02', NULL),
(299, 'Seoprogony', 'seoprogony@gmail.com', '88652128875', 'Прогоны Ваших сайтов, групп в соцсетях', 'https://seo-progony.ru/ обращайтесь, будем рады Вас видеть в качестве нашего клиента.', 0, '0', '2024-03-26 03:43:21', '2024-03-26 03:43:21', NULL),
(300, 'Raul Lambe', 'raul.lambe@msn.com', '4543882496', 'To the utkalenterprises.net Webmaster.', 'Access non-recourse cash loans, BG/SBLC/PPP, and beyond with Wealthy Credit Limited. Connect with us at www.fastcapitalhk.com or reach out at +852 300 16439 or info@fastcapitalhk.com to realize your financial goals today.', 0, '0', '2024-03-26 19:28:02', '2024-03-26 19:28:02', NULL),
(301, 'KatyaReeminy3', 'Beaugaddind2@gmail.com', '88517123299', 'Hey darling, missed me?', 'Let\'s escape for the weekend to that charming bed and breakfast I found - just us, no distractions.  -   https://u.to/CXOGIA?aburb', 0, '0', '2024-03-27 06:51:12', '2024-03-27 06:51:12', NULL),
(302, 'Brian Mcfall', 'mcfall.brian@yahoo.com', 'S chgfxco', 'Dear utkalenterprises.net Admin!', 'Hi there, my name is Cody Griner. I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting contractors on Google.  Can I share a testimonial \r\nfrom one of our clients with you?  I can also do a short zoom to \r\nillustrate their full case study if you have time for it? \r\ncody@mrmarketingres.com 843-720-7301', 0, '0', '2024-03-28 05:46:00', '2024-03-28 05:46:00', NULL),
(303, 'eszter', 'qtwcwjpbmj.qc@monochord.xyz', 'eszter balcells', 'eszter balcells', 'eszter balcells', 0, '0', '2024-03-28 08:45:24', '2024-03-28 08:45:24', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(304, 'Mike Eddington', 'mikeel@gmail.com', '84754726296', 'NEW: Semrush Backlinks', 'Hi there \r\n \r\nThis is Mike Eddington\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your utkalenterprises.net SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\nRegards \r\nMike Eddington\r\n \r\nmike@strictlydigital.net', 0, '0', '2024-03-28 18:45:19', '2024-03-28 18:45:19', NULL),
(305, 'Patricia Branton', 'patricia.branton@gmail.com', '132674325', 'Venture Sales - We\'ve got you covered', 'Hi\r\n\r\nWe are a venture sales agency that works with you to uncover the best leads for your industry.\r\n\r\nAfter finding targeted leads for you, warm intros are sent to them ensuring a steady steam of viable clients to your website.\r\n\r\nThere are no subscriptions and we only take a small commision on sales that we are able to generate for you.\r\n\r\nFind out more at: https://utkalenterprises.leadsmax.biz', 0, '0', '2024-03-29 01:06:51', '2024-03-29 01:06:51', NULL),
(306, 'KatyaReeminy2', 'Beaugaddind1@gmail.com', '81346979925', 'Hey handsome, feeling lucky?', 'Hey cutie, want to see the stars with me?  -  https://u.to/CXOGIA?aburb', 0, '0', '2024-03-29 07:13:27', '2024-03-29 07:13:27', NULL),
(307, 'RobertGex', 'lucido.leinteract@gmail.com', '85473934649', 'Aloha, i am write about     price', 'Xin chào, tôi muốn biết giá của bạn.', 0, '0', '2024-03-29 18:45:07', '2024-03-29 18:45:07', NULL),
(308, 'RobertGex', 'lucido.leinteract@gmail.com', '87389749557', 'Aloha, i am write about     price', 'Xin chào, tôi muốn biết giá của bạn.', 0, '0', '2024-03-29 18:45:10', '2024-03-29 18:45:10', NULL),
(309, 'RobertGex', 'lucido.leinteract@gmail.com', '87663853316', 'Aloha, i am write about     price', 'Xin chào, tôi muốn biết giá của bạn.', 0, '0', '2024-03-29 18:45:13', '2024-03-29 18:45:13', NULL),
(310, 'RobertGex', 'lucido.leinteract@gmail.com', '85789692939', 'Aloha, i am write about     price', 'Xin chào, tôi muốn biết giá của bạn.', 0, '0', '2024-03-29 18:45:16', '2024-03-29 18:45:16', NULL),
(311, 'RobertGex', 'lucido.leinteract@gmail.com', '85598569848', 'Aloha, i am write about     price', 'Xin chào, tôi muốn biết giá của bạn.', 0, '0', '2024-03-29 18:45:18', '2024-03-29 18:45:18', NULL),
(312, 'Mike Bawerman', 'mikeSpeeliGala@gmail.com', '83614481382', 'Domain Authority of your utkalenterprises.net', 'Hi there, \r\n \r\nI have reviewed your domain in MOZ and have observed that you may benefit from an increase in authority. \r\n \r\nOur solution guarantees you a high-quality domain authority score within a period of three months. This will increase your organic visibility and strengthen your website authority, thus making it stronger against Google updates. \r\n \r\nCheck out our deals for more details. \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Ahrefs Domain Rating \r\nhttps://www.monkeydigital.co/ahrefs-seo/ \r\n \r\n \r\nThanks and regards \r\nMike Bawerman', 0, '0', '2024-03-29 19:40:03', '2024-03-29 19:40:03', NULL),
(313, 'KatyaReeminy2', 'Beaugaddind1@gmail.com', '87757196647', 'Hi sweetie, long time no see!', 'Hi handsome, how about we cook dinner together?  -  https://rb.gy/psrixq?aburb', 0, '0', '2024-03-31 08:27:03', '2024-03-31 08:27:03', NULL),
(314, 'Ashley Roberge', 'roberge.ashley@gmail.com', '6804461056', 'Hi utkalenterprises.net Owner.', 'Did you know that a mere 1% of users bother to browse past the first page of search results? Don\'t miss the chance to attract more traffic - get a complimentary website SEO audit today and boost your search engine ranking. Click here to fill out the form for Free SEO Website Audit: https://badgerdigitalmarketingsolutions.com/contact/', 0, '0', '2024-03-31 09:13:58', '2024-03-31 09:13:58', NULL),
(315, 'Maria Tolmie', 'maria.tolmie@gmail.com', '7016896630', 'Dear utkalenterprises.net Administrator.', 'Are rising business expenses and the cash flow roller coaster causing you stress? I can fix that, let me show you how. Send me an email below now.\r\n\r\nElizabeth Miller\r\nWorking Capital Loan Specialist\r\n295 Seven Farms Drive\r\nSuite C- 201\r\nCharleston, SC 29492\r\nwww.HelloRatesFastFunding.com\r\nelizabeth.miller@helloratesfastfunding.com', 0, '0', '2024-03-31 15:02:36', '2024-03-31 15:02:36', NULL),
(316, 'KatyaReeminy3', 'Beaugaddind2@gmail.com', '81459638515', 'Hey cutie, what\'s cooking?', 'Hey cutie, want to see the stars with me?  -  https://rb.gy/psrixq?aburb', 0, '0', '2024-04-01 15:56:19', '2024-04-01 15:56:19', NULL),
(317, 'Dustin Primm', 'dustin.primm@gmail.com', '3063740071', 'Dear utkalenterprises.net Owner.', 'Hi there,\r\n\r\nWe promise—this isn\'t just another message. Imagine saving money and simplifying your website management all at once. At WordPressPro.org, we make it possible.\r\n\r\nHere\'s how:\r\n\r\n    Affordable Plans: Starting at just $9.95/month\r\n    User-Friendly Platform: Manage your site with ease\r\n    Free Migration Service: Seamless transition to our platform\r\n\r\nGive your website the boost it deserves. Join us today!\r\n\r\nBest regards,\r\n\r\nThe WordPressPro.org Team\r\nwww.wordpresspro.org\r\ninfo@wordpresspro.org', 0, '0', '2024-07-06 06:23:15', '2024-07-06 06:23:15', NULL),
(318, 'Desiree Mulquin', 'mulquin.desiree@hotmail.com', '8131920728', 'Hi utkalenterprises.net Owner!', 'Finally, an all in one customer financing solution for ANY credit score between 500-850 FICO Don\'t leave money on the table, now you\'ll be able to turn people with low credit scores into paying customers!\r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nJessica Snyder\r\njessica.snyder@helloratespros.com\r\nhttps://helloratespros.com/5-6/', 0, '0', '2024-07-06 09:02:59', '2024-07-06 09:02:59', NULL),
(319, 'Maxwell Denson', 'denson.maxwell73@msn.com', '624055433', 'Hello utkalenterprises.net Owner.', 'The Vetted Business Directory has completed its May 2024 updates with 7,358 new businesses added.\r\n\r\nYour business was unfortunately NOT ABLE TO BE INCLUDED :-(\r\n\r\nDon’t worry, this is easy to fix.\r\n \r\nUse the link in my signature to add or update your Vetted business details and realize the powerful benefits of being a Vetted Business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nSarah.McCormick@VettedPros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!\r\n\r\nVetted is a game changing platform used by over 85,000 USA based businesses to share & prove their business credentials to amplify trust & transparency with shoppers and close up to 60% more sales than businesses not listed on the Vetted platform.', 0, '0', '2024-07-09 01:55:52', '2024-07-09 01:55:52', NULL),
(320, 'Sheri Bruni', 'sheri.bruni9@msn.com', '320308541', 'Relieve Pain with MYONATURAL\'s Natural Products', 'Dealing with sore muscles, aches, and pains? Ready to get back to doing the things you love?\r\n\r\nTry MYONATURAL, preferred by massage therapists, chiropractors, and athletic trainers.\r\n\r\nGet 20% off your first order.\r\nUse Coupon Code: VV7UP5HH\r\n\r\n++URL++:  https://bit.ly/4eODq8g\r\n\r\n* MYONATURAL offers a family of safe, all-natural products designed to relieve pain and improve your quality of life. Our pain-relieving creams and oral sprays work alone or in combination to relieve pain, lower anxiety, and foster restorative sleep. Developed by someone who understands your struggles, we are dedicated to helping you feel better, move better, and live better. Experience the MYONATURAL difference today!\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling the form: https://bit.ly/myounsubscribe\r\n44 Rue Descartes, Strasbourg, ALSACE, USA, 67100', 0, '0', '2024-07-09 04:28:22', '2024-07-09 04:28:22', NULL),
(321, 'Search Engine Index', 'submissions@searchindex.site', '7906887875', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://www.domainsubmit.org/', 0, '0', '2024-07-10 02:13:20', '2024-07-10 02:13:20', NULL),
(322, 'CompanyRegistar.org', 'brunskill.raul@googlemail.com', '3603621538', 'Your domain utkalenterprises.net is listed in a few directories.', 'Dear Sir/Madam \r\n\r\nI see your online property is only listed in 9 out of 2398 directories\r\n\r\nThis will severely impact your page rank, the higher amount of directories your company is listed in, locally or globally, the more back links you have and the better you rank in Yahoo, Bing, Google. \r\n\r\nIt has never been easier to promote your site utkalenterprises.net\r\n\r\nJust a few inputs and our program willl do the rest. \r\n\r\nNo more struggling about email verification, CAPTCHAs or manual link building.\r\n\r\nWeve automed everything that we possibly could to make submitting your site a breeze.\r\n\r\nSee your site on the first page.\r\n\r\nWe will submit your site to numerous directories and give you a full report on the status of each registry. Although we have automated the submission process to a large extent, some of the registries may require manual approval which could cause a slight delay. \r\n\r\nMaking your life simpler \r\n\r\nhttps://utkalenterprises.net.CompanyRegistar.org', 0, '0', '2024-07-10 18:37:24', '2024-07-10 18:37:24', NULL),
(323, 'Diana Cruz', 'dianacruz.mkt@gmail.com', '1234567890', 'Re: Increase traffic to your website', 'Hey utkalenterprises.net,\r\n\r\nI found your details on Google.com and I have looked at your website and realized your website has great design but your website ranking is not good on all search engines Google, AOL, Yahoo and Bing.\r\n\r\nOur main focus will be to help generate more sales & online traffic.\r\n\r\nWe can place your website on Google\'s 1st page. We will improve your website’s position on Google and get more traffic.\r\n\r\nIf interested, kindly provide me your name, phone number, and email.\r\n\r\nYour sincerely,\r\nDiana Cruz', 0, '0', '2024-07-10 19:23:35', '2024-07-10 19:23:35', NULL),
(324, 'Amit Sharma', 'webpageoptimized@gmail.com', '213 262 0124', 'Re: Do you want to manage your website?', 'Hey,\r\n\r\nAs I can see you have a newly launched website (utkalenterprises.net)!\r\n\r\n\"Do you want to Optimize your website for search engines with an SEO setup, all for a one-time setup cost?\"\r\n\r\nIf interested, just hit \"Reply\". \r\n\r\nRegards,\r\nAmit Sharma | Sr Business Developer\r\nWebpageoptimized.com\r\nWhatsApp - +1 213 262 0124', 0, '0', '2024-07-10 19:34:35', '2024-07-10 19:34:35', NULL),
(325, 'Glenda Bravo', 'bravo.glenda80@googlemail.com', '475239502', 'Dear utkalenterprises.net Owner!', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-07-11 10:18:39', '2024-07-11 10:18:39', NULL),
(326, 'K Paul', 'letsgetuoptimize@gmail.com', '(949) 508-0277', 'Re: Webpage & Marketing inquiries', 'Hey team utkalenterprises.net,\r\n\r\nI was looking at your website and realized that despite having a good design; it was not ranking high on any of the Search Engines (Google, Yahoo & Bing) for most of the keywords related to your business.\r\n\r\nWe can place your website on Google\'s 1st page.\r\n\r\n? Top ranking on Google search!\r\n? Improve website clicks and views!\r\n? Increase Your Leads, clients & Revenue!\r\n\r\nMay I send you a quote & price list?\r\n\r\nWell wishes,\r\nK Paul\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', 0, '0', '2024-07-12 00:29:03', '2024-07-12 00:29:03', NULL),
(327, 'Search Engine Index', 'submissions@searchindex.site', '2604247545', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://domainsubmit.org/', 0, '0', '2024-07-12 20:59:43', '2024-07-12 20:59:43', NULL),
(328, 'Debra', 'magicmat@utkalenterprises.net', '52489877', 'Flash. Sale. Alert.', 'Get The Worlds Greatest Magic Sand Free Beach Mat!\r\n\r\nWatch sand, dirt & dust disappear right before your eyes! It\'s perfect for beach, picnic, camping or hiking.\r\n\r\nAct Now And Receive A Special Discount For Our Magic Mat!\r\n\r\nGet Yours Here:  https://magicmats.co\r\n\r\nAll the best, \r\n \r\nDebra', 0, '0', '2024-07-12 23:49:52', '2024-07-12 23:49:52', NULL),
(329, 'Georgia Smith', 'georgia@getonglobe.com', '(917) 310-3348', 'Re: utkalenterprises.net - google organic search results', 'Hey [utkalenterprises.net],\r\n\r\nI was checking your website and find out you have a good design and it looks awesome, but it’s not ranking on Google and other major search engines.\r\n \r\nWe can place your website on Google\'s 1st page. Yahoo, Facebook, LinkedIn, YouTube, Instagram, Pinterest etc.).\r\n \r\nI would be pleased to provide you with \"charges,\" \"Proposals,\" details of past work!\r\n \r\nThank you,\r\nGeorgia - (Sr SEO consultant)\r\nwww.GetOnGlobe.com\r\nCell: +1 (917) 310-3348\r\n\r\n\r\n\r\n\r\n\r\nNote: - If you’re not Interested in our Services, send us opt-out in.!', 0, '0', '2024-07-13 00:09:18', '2024-07-13 00:09:18', NULL),
(330, 'DavidGex', 'kayleighbpsteamship@gmail.com', '86766488562', 'Aloha, i am writing about your the price for reseller', 'Прывітанне, я хацеў даведацца Ваш прайс.', 0, '0', '2024-07-13 03:04:02', '2024-07-13 03:04:02', NULL),
(331, 'MasonGex', 'alden.provitt773@gmail.com', '82631663662', 'Aloha  i write about your   price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-07-13 06:55:09', '2024-07-13 06:55:09', NULL),
(332, 'LeoGex', 'yjdisantoyjdissemin@gmail.com', '89822583866', 'Hallo, i write about     price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-07-14 04:04:25', '2024-07-14 04:04:25', NULL),
(333, 'Eden Konig', 'konig.eden@gmail.com', '3150569419', 'Hi utkalenterprises.net Admin.', 'Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-07-14 09:08:43', '2024-07-14 09:08:43', NULL),
(334, 'Palma Broderick', 'palma.broderick@gmail.com', '213954151', 'Fit Fitness into Your Life: 8 Week Home Program', 'No time for the gym? No problem!\r\n\r\nBrought to you by Neuro Force One, the 8-week training plan is made for those with hectic schedules, boosting your fitness at home with minimal equipment. Increase your strength, power, mobility, endurance, and more, all from the comfort of your home.\r\n\r\nWith a nutrition plan from qualified nutrition experts, this evidence-based program helps you achieve the best version of yourself. Incorporate fitness into your routine, no gym required!\r\n\r\n\r\nMy name\'s Tia S.\r\nPlease visit: https://bit.ly/3xwHxFj\r\nOr reply back to info@neuroforceone.com\r\n\r\n\r\n\r\nYou can unsubscribe by filling this form: https://bit.ly/plsunsubscribeme\r\nPiazza Rezzonico 3, Villars-Sous-Yens, NA, Switzerland, 1168', 0, '0', '2024-07-15 03:03:18', '2024-07-15 03:03:18', NULL),
(335, 'Kerrie Stelzer', 'kerrie.stelzer@msn.com', '740847524', 'Hello utkalenterprises.net Administrator!', 'How would you like a surefire way to dominate your local market & win more sales from your competition?\r\n\r\nGetting Vetted is a powerful sales multiplier that helps you close 60 % more deals. \r\nThat’s a game changer.\r\nVetted also provides great SEO & FREE local leads\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-07-15 15:09:07', '2024-07-15 15:09:07', NULL),
(336, 'MasonGex', 'yjdisantoyjdissemin@gmail.com', '88272532251', 'Hi  i write about   the price for reseller', 'Hola, volia saber el seu preu.', 0, '0', '2024-07-15 19:24:30', '2024-07-15 19:24:30', NULL),
(337, 'Britney Lew', 'lew.britney@yahoo.com', 'Xpxpysa', 'Hello utkalenterprises.net Admin.', 'WANTED: Partnerships & Agents for Global E-commerce Firm\r\n\r\n4U2 Inc., a premier E-commerce , Sourcing Brokerage firm, is actively seeking partnerships and collaboration with manufacturers and wholesalers for agricultural, commercial, and residential products. We offer a diverse marketplace for both new and used items, including vehicles and equipment.\r\n\r\nWhy Choose 4U2 Inc.? (see https.//www.4u2inc.com)\r\n\r\nGlobal reach for your products\r\nImmediate requirements for a wide range of items\r\nOpportunity to expand your business network\r\nJoin Our Team We’re also looking for Independent Contractor Agents (Account Executives) to help us discover new business opportunities. Whether you’re seeking a full-time or part-time role, you can earn up to $60,000 based on performance.\r\n\r\nGet in Touch Don’t miss out on this opportunity. Contact us at 4u2inc123@gmail.com to learn more or to start our partnership today!\r\n\r\nThis version is more direct and easier to read, highlighting the key points and call to action for potential partners and agents. If you need further refinements or have specific requirements, feel free to let me know!', 0, '0', '2024-07-16 09:24:08', '2024-07-16 09:24:08', NULL),
(338, 'Rhonda Telfer', 'rhonda.telfer@msn.com', 'Wtlm Puiv Br I', 'LeadsMax.biz shutting down', 'Hello,\r\n\r\nIt is with sad regret that after 12 years, LeadsMax.biz is shutting down.\r\n\r\nWe have made all our databases available on our website.\r\n\r\n25 Million companies\r\n527 Million People\r\n\r\nLeadsMax.biz', 0, '0', '2024-07-16 12:05:27', '2024-07-16 12:05:27', NULL),
(339, 'Mani J', 'info@myseoranks.com', '1  347 560-8971', 'Re: One question about your SEO', 'Hey team,\r\n\r\nI was going through your website & I personally see a lot of potential in your website & business. \r\n\r\nWe can increase targeted views to your website so that it appears on Google\'s first page. Bing, Yahoo, AOL, etc.\r\n\r\nIf interested. May I send you a package/proposal.?\r\n\r\nWell wishes,\r\nMani J | Sr SEO consultant\r\n\r\n\r\n If you\'re not Interested in our Services, please send us \"NO Thank You\".\r\n\r\n\r\n\r\n     utkalenterprises.net', 0, '0', '2024-07-16 13:29:54', '2024-07-16 13:29:54', NULL),
(340, 'Georgia Smith', 'georgia@getonglobe.com', '(917) 310-3348', 'Re: SEO consultant', 'Hey [utkalenterprises.net],\r\n\r\nI was checking your website and find out you have a good design and it looks awesome, but it’s not ranking on Google and other major search engines.\r\n \r\nWe can place your website on Google\'s 1st page. Yahoo, Facebook, LinkedIn, YouTube, Instagram, Pinterest etc.).\r\n \r\nI would be pleased to provide you with \"charges,\" \"Proposals,\" details of past work!\r\n \r\nThank you,\r\nGeorgia - (Sr SEO consultant)\r\nwww.GetOnGlobe.com\r\nCell: +1 (917) 310-3348\r\n\r\n\r\n\r\n\r\n\r\nNote: - If you’re not Interested in our Services, send us opt-out in.!', 0, '0', '2024-07-16 22:19:22', '2024-07-16 22:19:22', NULL),
(341, 'Search Engine Index', 'submissions@searchindex.site', '7605267392', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://domainsubmit.org/', 0, '0', '2024-07-16 23:42:18', '2024-07-16 23:42:18', NULL),
(342, 'Bryan Kennemer', 'bryan.kennemer@gmail.com', '495769411', 'To the utkalenterprises.net Administrator!', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-07-17 02:44:25', '2024-07-17 02:44:25', NULL),
(343, 'Search Engine Index', 'submissions@searchindex.site', '6045990643', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://domainsubmit.org/', 0, '0', '2024-07-17 23:09:32', '2024-07-17 23:09:32', NULL),
(344, 'mikeLamBanny', 'pr.os.pe.ri.t.yt.hem.oneyuspen@gmail.com', '85647385822', 'Forget financial limitations - earn more online!  - https://rb.gy/9fznxm?coerma1WaW', 'Do not wait for changes, but create it yourself! Earn up to $ 500 a day and become an architect of your own financial success!\r\n - https://rb.gy/9fznxm?coerma9WaW', 0, '0', '2024-07-18 14:47:12', '2024-07-18 14:47:12', NULL),
(345, 'Sam Morris', 'applicationdevelopment03@gmail.com', '1234567890', 'Re: Web Design & Development Services', 'Hey,\r\n\r\nWhile exploring your website \"www.utkalenterprises.net\", I devised an innovative plan to revamp it with cutting-edge technology, aiming to increase revenue and gain a competitive edge.\r\n\r\nI am a skilled web developer able to tackle nearly any challenge you present, offering services at prices accessible to most.\r\n\r\nWebsite Design, Graphic Design & Re-Design. Web Development, Mobile Apps Development or want some additional features with latest technological trends?\r\n\r\nI am pleased to provide you with \"Quotes,\" \"Proposals,\" details of past work, \"Our Packages,\" and \"Offers\"!\r\n\r\nThanks in advance,\r\nSam Morris (Business Development Executive)\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\nNote: - If you’re not Interested in our Services, send us \"opt-out\"', 0, '0', '2024-07-18 19:43:56', '2024-07-18 19:43:56', NULL),
(346, 'Stacia Arden', 'arden.stacia@googlemail.com', '7809658582', 'Hi utkalenterprises.net Admin!', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-07-20 03:55:10', '2024-07-20 03:55:10', NULL),
(347, 'Jamaal Werner', 'werner.jamaal@googlemail.com', '745920942', 'Discover the Perfect Timepiece for All Budgets and Taste!', 'Experience the ultimate buying journey at our store, where high-end watches merge with style and exactness. By opting for us, you\'ll enjoy:\r\n\r\nDistinctive and rare watch designs that catch attention\r\n\r\nTop-notch materials and craftsmanship for long-lasting durability\r\n\r\nExpert guidance from our skilled team to find your perfect match\r\n\r\nUnbeatable prices and limited-time offers to fit your budget\r\n\r\nOutstanding customer service and after-sales support for your peace of mind\r\n\r\nA handpicked collection of premium and cost-effective watches to match every style\r\n\r\nDon’t pass up the occasion to enhance your style. Visit our store right away and find the watch that speaks to you. Press here to start your way to sophistication and exactness!\r\n\r\n** See: https://bit.ly/huntwatches\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here if you don\'t want to get these awesome offers: https://bit.ly/removelist \r\n59 Railway Street, Lavelle, QLD, Australia, 4357', 0, '0', '2024-07-21 02:30:44', '2024-07-21 02:30:44', NULL),
(348, 'Reuben Sanches', 'sanches.reuben@googlemail.com', '9788614263', 'Hi utkalenterprises.net Owner.', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-07-21 07:46:47', '2024-07-21 07:46:47', NULL),
(349, 'Jay Paul', 'webbgrow3@gmail.com', '1234567890', 'Re: Innovative Website Redevelopment Proposal', 'Dear Sir/Maam,\r\n\r\nwww.utkalenterprises.net\r\n\r\nI have thoroughly reviewed your current website and believe there is a significant opportunity to enhance it with cutting-edge technology.\r\n\r\nThis redevelopment is not only poised to boost revenue but also to provide a competitive edge in your industry.\r\n\r\nI\'m an excellent web developer capable of almost anything you can come up with, and my costs are affordable for nearly everyone.\r\n\r\nI would be happy to send you \"Quotes\", “Proposal” Past work Details, \"Our Packages\", and “Offers”!\r\n\r\nWarm regards,\r\nJay Paul (Web Solution Manager)\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “unsubscribe”', 0, '0', '2024-07-21 16:28:09', '2024-07-21 16:28:09', NULL),
(350, 'Denis Googe', 'googe.denis@hotmail.com', '6143240224', 'To the utkalenterprises.net Owner!', 'Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-07-22 22:04:38', '2024-07-22 22:04:38', NULL),
(351, 'MasonGex', 'alden.provitt773@gmail.com', '81696459281', 'Hi  i am wrote about your   prices', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 0, '0', '2024-07-23 19:19:43', '2024-07-23 19:19:43', NULL),
(352, 'Search Engine Index', 'submissions@searchindex.site', '465389652', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://domainsubmit.org/', 0, '0', '2024-07-23 23:11:58', '2024-07-23 23:11:58', NULL),
(353, 'Williemae Gosse', 'gosse.williemae@gmail.com', '3779161776', 'Dear utkalenterprises.net Administrator!', 'Have you seen a great feature or an entire website design that you love and wish that you could have for your business?\r\n\r\nWe can make it happen and at wholesale rates.\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', 0, '0', '2024-07-24 03:46:55', '2024-07-24 03:46:55', NULL),
(354, 'Search Engine Index', 'submissions@searchindex.site', '1502664924', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://domainsubmit.org/', 0, '0', '2024-07-25 00:49:28', '2024-07-25 00:49:28', NULL),
(355, 'DavidGex', 'kayleighbpsteamship@gmail.com', '83837664626', 'Aloha    write about your the prices', 'Hola, volia saber el seu preu.', 0, '0', '2024-07-25 06:26:10', '2024-07-25 06:26:10', NULL),
(356, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Digital Domination: Ready to broadcast your message across the digital landscape? Imagine your brand reaching countless website contact forms worldwide! For just under $100, unlock the potential to reach 1 million forms. Contact me below for details.\r\n\r\nP. Stewart\r\nEmail: r2vktw@gomail2.xyz\r\nSkype: form-blasting', 0, '0', '2024-07-25 12:40:50', '2024-07-25 12:40:50', NULL),
(357, 'Delphia Ulrich', 'delphia.ulrich@gmail.com', '22439387', 'Hello utkalenterprises.net Administrator.', 'Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-07-25 18:34:01', '2024-07-25 18:34:01', NULL),
(358, 'MasonGex', 'yjdisantoyjdissemin@gmail.com', '88812289644', 'Hi, i am wrote about     price for reseller', 'Ola, quería saber o seu prezo.', 0, '0', '2024-07-26 00:39:03', '2024-07-26 00:39:03', NULL),
(359, 'Omar', 'utkalenterprises.net@outlook.com', '9209599978', 'Contact Us', 'Hello there \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF:  https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nRegards, \r\n\r\nOmar', 0, '0', '2024-07-26 02:20:52', '2024-07-26 02:20:52', NULL),
(360, 'JohnGex', 'kayleighbpsteamship@gmail.com', '84872347339', 'Hello    writing about   the price', 'Szia, meg akartam tudni az árát.', 0, '0', '2024-07-26 04:16:07', '2024-07-26 04:16:07', NULL),
(361, 'Isla Miramontes', 'isla.miramontes@yahoo.com', '(82) 2386-3977', 'Hi utkalenterprises.net Webmaster!', 'Unlock the power of magic with Extreme Spells! Whether you\'re seeking true love, financial success, or happiness, our experienced Circle of Eight, led by Master Sam Taylor and Psychic Master Lennox, is here to transform your life. Since 1993, we\'ve been casting potent spells tailored to your unique needs, helping countless individuals achieve their dreams.\r\n\r\nDiscover spells to attract your perfect mate, rekindle lost love, draw wealth, and much more. Our spells are safe, effective, and backed by a 100% satisfaction guarantee. Plus, we offer free health spells to those in need because we believe in making positive changes accessible to everyone.\r\n\r\nDon\'t let life\'s challenges hold you back. Embrace the mystical power of Extreme Spells and take control of your destiny today. Visit https://extremespells.com/ to learn more and start your magical journey. Transform your life with the proven power of spell casting!\r\n\r\nAct Now! Click here to unlock love, wealth, and happiness with Extreme Spells. Your dream life is just a spell away!', 0, '0', '2024-07-26 10:44:40', '2024-07-26 10:44:40', NULL),
(362, 'Michale Bobo', 'bobo.michale@gmail.com', '45149580', 'Dear utkalenterprises.net Webmaster!', 'Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-07-26 12:38:03', '2024-07-26 12:38:03', NULL),
(363, 'MeriNefertovaDis', 'deimisgreysi@gmail.com', '87618116289', 'privet', 'ты мне свою почту не скинул как обещал \r\nИнтересна твоя идея от я бы сказала \r\nисскустного, мудрого писателя)тебя вообщем вообще зашла сюда предложить одну тему, я про тему этот, ты давно здесь бывал? прочитай мой постинг, \r\nпишу на эту тему, у нас с тобой много общего, ты мне нравишься очень, извини за прямоту, вот что хотела сказать) \r\n<a href=\"https://www.rutiti.ru/\" class=\"ssilka\">Моя личная страничка на сайт знакомств</a> можно на почту закинуть письмо. \r\nP.S. надеюсь на общение дальнейшее не пропадай оки?, ты отличный человек, со своим мировозрением, супер душой и сердцем, спасибо за твое внимание, ты все делаешь правильно \r\nскажи свое мнение, забеги? если что напиши здесь в личку, то же отвечу. \r\nСупер сайтик, всем добра', 0, '0', '2024-07-27 20:55:01', '2024-07-27 20:55:01', NULL),
(364, 'Alvaro Bourassa', 'alvaro.bourassa@outlook.com', '3210086721', 'Hello utkalenterprises.net Admin.', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-07-29 02:07:13', '2024-07-29 02:07:13', NULL),
(365, 'Leopoldo Cockrell', 'leopoldo.cockrell@gmail.com', '9337641375', 'Skyrocket Your SEO: 700% Keyword Improvement with Jasper AI', 'Hi,\r\nAre you ready to experience a revolution in your business? Meet Jasper AI – the ultimate tool that\'s transforming the way millions of businesses boost their website traffic and skyrocket their sales!\r\nHere’s How Jasper AI Can Work Wonders for You:\r\n\r\n1.	700% Keyword Growth: Jasper AI has helped businesses achieve up to 700% growth in their website keywords, making them more visible to potential customers.\r\n2.	3x More Traffic: Businesses using Jasper AI have seen up to a 300% increase in website traffic, driving more potential customers to their sites.\r\n3.	$10,000+ Monthly Sales Boost: Many businesses have reported monthly sales increases of over $10,000 thanks to the optimized content and targeted marketing strategies powered by Jasper AI.\r\n4.	$5,000 Savings on Marketing Costs: By automating and optimizing your content creation, you can save up to $5,000 in monthly marketing expenses.\r\n\r\nBut don’t just take our word for it – see the impact for yourself!\r\nBusinesses around the world are already seeing phenomenal results:\r\n\r\n•	Increased Website Traffic: Our users have reported substantial increases in their website traffic within weeks of using Jasper AI.\r\n•	Higher Conversion Rates: With more targeted and optimized content, businesses are seeing a significant rise in their conversion rates and sales.\r\n•	Scalability and Growth: Whether you\'re a small startup or a large enterprise, Jasper AI scales with your business, ensuring continuous growth and success.\r\n\r\nReady to Transform Your Business?\r\nDon\'t miss out on the opportunity to take your business to new heights. Click the link below to get started with Jasper AI today and join the ranks of the millions of successful businesses already benefiting from this game-changing tool.\r\n\r\nStart Your Free Trial Now!\r\n\r\nhttps://jasper.gr-site.com', 0, '0', '2024-07-29 05:22:34', '2024-07-29 05:22:34', NULL),
(366, 'Efren Kowalski', 'kowalski.efren@msn.com', '683875087', 'Hello utkalenterprises.net Administrator.', 'The Vetted Business Directory June 2024 update is live. \r\n\r\nYour business is NOT INCLUDED because the verification email we sent was returned as undeliverable. \r\n\r\nThis same email is also used by the platform for your local leads, so it\'s important for the integrity of the platform for consumers that want your services to be able to reach you.\r\n\r\nIf the returned email was in error, see the link in my signature to update your listing email. \r\n\r\nOnce remedied, you’ll reactivate all of the world class Vetted benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nUse the link in my signature to add/ update your Vetted business details, and realize the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!', 0, '0', '2024-07-30 11:02:15', '2024-07-30 11:02:15', NULL),
(367, 'Search Engine Index', 'submissions@searchindex.site', '415367566', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://domainsubmit.org/', 0, '0', '2024-07-30 22:59:19', '2024-07-30 22:59:19', NULL),
(368, 'Search Engine Index', 'submissions@searchindex.site', '2814590024', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregister.info/', 0, '0', '2024-07-31 04:59:47', '2024-07-31 04:59:47', NULL),
(369, 'Alma Garnett', 'alma.garnett@googlemail.com', '625276562', 'To the utkalenterprises.net Admin!', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-07-31 19:17:56', '2024-07-31 19:17:56', NULL),
(370, 'Search Engine Index', 'submissions@searchindex.site', '141899807', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregister.info/', 0, '0', '2024-08-01 00:18:24', '2024-08-01 00:18:24', NULL),
(371, 'Debora Boston', 'morrismi1@outlook.com', '0664 648 20 30', 'Payment/deposits handler', 'A remote job opportunity for a Law Firm, the role of a Payment/Deposit Handler. This position involves managing payments and deposits, ensuring accurate processing, and maintaining financial record. This position is only for candidates based in the US. \r\n\r\nJob location:  USA \r\nWeekly wages: $2,150 per week.\r\n\r\nWe are looking for a detail-oriented individual with a good background and no criminal record.\r\n\r\nIf you are interested in joining our team, please send an email to get more details jasonmorris001@aol.com', 0, '0', '2024-08-01 06:27:39', '2024-08-01 06:27:39', NULL),
(372, 'Birgit Hildreth', 'hildreth.birgit71@hotmail.com', '4187209860', 'To the utkalenterprises.net Webmaster!', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-08-03 00:39:07', '2024-08-03 00:39:07', NULL),
(373, 'MasonGex', 'yjdisantoyjdissemin@gmail.com', '89157293156', 'Hello, i am wrote about your the price', 'Xin chào, tôi muốn biết giá của bạn.', 0, '0', '2024-08-03 16:12:07', '2024-08-03 16:12:07', NULL),
(374, 'Rudolph Thow', 'rudolph.thow@gmail.com', '396387239', 'Hi utkalenterprises.net Owner!', 'Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-03 23:49:54', '2024-08-03 23:49:54', NULL),
(375, 'Delmar Fogle', 'morrismi1@outlook.com', 'Hjojvzok Ov', 'Dear utkalenterprises.net Admin!', 'Dear utkalenterprises.net owner or manager, \r\n\r\nCut your business or personal credit cards and loan payments in half. eliminate interest and reduce your debt by 50%. 100% guaranteed. The average customer saves $56,228 in unnecessary interest plus principal and 15 years in payoff time through our consolidation loan and debt consolidation programs. \r\n\r\nContact us at usdebtrelief.biz or email me at usdebt12@gmail.com I look forward to hearing from you, \r\n\r\nRey', 0, '0', '2024-08-04 00:18:15', '2024-08-04 00:18:15', NULL),
(376, 'Elton Buttenshaw', 'buttenshaw.elton@outlook.com', '2626711564', 'Hello utkalenterprises.net Webmaster!', 'Do you have a list of website updates that you want to deploy but hate having to pay the INSANE prices to get it done?\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', 0, '0', '2024-08-04 05:48:27', '2024-08-04 05:48:27', NULL),
(377, 'MasonGex', 'alden.provitt773@gmail.com', '81373273812', 'Hello, i writing about your   prices', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-08-05 07:36:10', '2024-08-05 07:36:10', NULL),
(378, 'Dolores Deasey', 'dolores.deasey@gmail.com', 'Iqdkqxhhb', 'Hello utkalenterprises.net Webmaster.', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-05 10:43:43', '2024-08-05 10:43:43', NULL),
(379, 'Brock Airey', 'brock.airey@gmail.com', '46895878', 'Hi utkalenterprises.net Owner.', 'Important: \r\nYour Vetted Business listing is no longer visible because the annual verification email that we sent, was returned to us as “undeliverable”.\r\n\r\nIf the returned email was in error, you can add or update your email & listing info using the link in my signature.\r\n\r\nOnce remedied, you’ll reactivate your Vetted Directory benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nSee link in my signature to add /update your Vetted business details, and get the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!', 0, '0', '2024-08-05 11:20:15', '2024-08-05 11:20:15', NULL),
(380, 'Bichgan', 'christine@bbatalent.com', '84125916669', 'Enter the realm of online success', 'Hey there, do you want to dive into the world of business and profits? Welcoming the brand-new game, Musk Empire! In Musk Empire, you\'ll have the chance to build and grow your business empire, choosing from various upgrades that increase your hourly profits. Eventually, exchange your in-game profits on a special exchange for real money. It\'s true вЂ“ real money you can spend however you like. And the best part? There\'s absolutely no in-game donation. It\'s all about strategy. Join now and transform your virtual wealth into real rewards. Sign up today and experience the joy of Musk Empire! https://gourl.tech/XEmpire', 0, '0', '2024-08-05 13:00:51', '2024-08-05 13:00:51', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(381, 'RaymondJoxia', 'no.reply.GeorgeEvans@gmail.com', '88698655566', 'A paradigm shifting new technique of advertising.', 'What’s up? utkalenterprises.net \r\n \r\nDid you know that it is possible to send business offer wholly legal? \r\nWhen such appeals are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals securely. As Communication Forms are seen as important, messages sent via them are less likely to be considered spam. \r\nYou have the chance to use our service without having to pay anything. \r\nWe guarantee you up to 50,000 messages. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', 0, '0', '2024-08-05 23:46:16', '2024-08-05 23:46:16', NULL),
(382, 'Bonny Lhotsky', 'lhotsky.bonny@yahoo.com', '3270732737', 'Hello utkalenterprises.net Admin.', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-08-06 06:46:36', '2024-08-06 06:46:36', NULL),
(383, 'Nitin Chaudhary', 'sales@rankinghat.co', '(209) 813-5119', 'Re: The visibility and SEO of your website', 'Hello there,\r\n\r\nYour website\'s design is absolutely brilliant. The visuals really enhance your message and the content compels action. I\'ve forwarded it to a few of my contacts who I think could benefit from your services.\r\n\r\nWhen I was looking at your site \"www.utkalenterprises.net\", though, I noticed some mistakes that you\'ve made re: search engine optimization (SEO) which may be leading to a decline in your organic SEO results.\r\n\r\nWould you like to fix it so that you can get maximum exposure/presence on Google, Bing, Yahoo and web traffic to your website?\r\n\r\nIf this is something you are interested in, then allow me to send you a No Obligation Audit Report for your review. We will fix those errors with no extra cost if you choose any one of our monthly marketing plans.\r\n\r\nHave a nice day!\r\n\r\nRegards,\r\nNitin Chaudhary | International Project Manager                                                    \r\nEmail:- sales@rankinghat.co            \r\nContact Number:- +1- (209) 813-5119', 0, '0', '2024-08-07 04:19:46', '2024-08-07 04:19:46', NULL),
(384, 'Wesley', 'info@hort.pawsafer.net', '244111652', 'Wesley Hort', 'Hello there \r\n \r\nIs your dog\'s nails getting too long? If you\'re tired of going to the vet or groomer to get them trimmed, why not try PawSafer™? \r\nWith PawSafer™, you can trim your dog\'s nails from the comfort of your own home, and it only takes a few minutes!\r\n\r\nPawSafer™ is the safest and most convenient way to trim your dog\'s nails, and it\'s very affordable. \r\n\r\nGet it while it\'s still 50% OFF + FREE Shipping\r\n\r\nBuy here: https://pawsafer.net\r\n \r\nBest regards, \r\n \r\nWesley', 0, '0', '2024-08-07 14:23:26', '2024-08-07 14:23:26', NULL),
(385, 'Brady Ortiz', 'ortiz.brady@gmail.com', '443157172', 'Benefit from Truly Autoscaling WordPress Hosting', 'Frustrated of your site being unresponsive and being unavailable now and then?\r\nSwitch to Cloudways Autonomous...\r\n\r\nEasy, Powerful, Reliable & Autoscaling WordPress Hosting!\r\nGet a hosting solution with no setup needed, single-click control, and zero downtimes.\r\nHost your website and concentrate on growing your venture, while Autonomous takes care of everything!\r\n\r\n- Go Hands-off\r\n- Seamless Scaling\r\n- Remain Highly Available\r\n- Try Free With A $100 Credit\r\n\r\nUnleash the potential of your website today: https://bit.ly/3WEGGef\r\n\r\n\r\n\r\n\r\n\r\n\r\nYou can unsubscribe by filling this form: https://bit.ly/removefrmlist\r\n47 Rue Clement Marot, Perpignan, LANGUEDOC-ROUSSILLON, France, 66100', 0, '0', '2024-08-07 17:07:41', '2024-08-07 17:07:41', NULL),
(386, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Quick question: how would you feel about your ad being seen by millions of people? I sent this message to your contact form, and you\'re reading it now! Visit my site below to learn more.\r\n\r\nhttp://he9k76.contactformmarketing.xyz', 0, '0', '2024-08-09 14:06:30', '2024-08-09 14:06:30', NULL),
(387, 'Rodger Lajoie', 'lajoie.rodger67@gmail.com', '06-65505253', 'To the utkalenterprises.net Owner!', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com', 0, '0', '2024-08-09 15:24:04', '2024-08-09 15:24:04', NULL),
(388, 'Alana Jain', 'jain.alana@gmail.com', '89583536', 'Hello utkalenterprises.net Webmaster!', 'Rising business expenses are taking a toll on small business owners.\r\n\r\nYou are not alone. It\'s affecting every industry.\r\n\r\nOne way to give yourself some breathing room is to obtain enough working capital to bridge you through the tough times. \r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-11 01:03:27', '2024-08-11 01:03:27', NULL),
(389, 'Samuel Appleroth', 'samuel.appleroth@googlemail.com', '812185678', 'Dear utkalenterprises.net Owner.', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-08-11 03:26:02', '2024-08-11 03:26:02', NULL),
(390, 'Stephania Tozer', 'tozer.stephania@gmail.com', '021 655 10 96', 'Elevate Your Business with M.I.H Marketing Agency', 'Hello,\r\n\r\nI hope this email finds you well.\r\n We are reaching out to introduce M.I.H Marketing Agency, the ideal partner for elevating your brand. Our expertise in innovative strategies, tailored campaigns, and data-driven results sets us apart. \r\n\r\nBy partnering with us, we can enhance your brand with the use of:\r\n• Software development \r\n• AI development\r\n• App development\r\n• Website development\r\n• Cyber security\r\n• Virtual private servers\r\n• SEO, SMO, SEM, SERP\r\n• Digital design\r\n• Social media marketing\r\n• International law and accouting\r\n• Clothing design and supply\r\n• White label writers\r\n• White label courses\r\n\r\nIf the service that you are looking for is not listed please reach out to us,as this list does not include all of the services we provide.\r\n\r\nReady to take your marketing to the next level? Let\'s schedule a zoom meeting to discuss how M.I.H can drive your business forward.\r\n\r\nBest regards,\r\nM.I.H Marketing Agency  \r\nmarketingagency.mih@gmail.com', 0, '0', '2024-08-13 02:45:42', '2024-08-13 02:45:42', NULL),
(391, 'Kristie Starnes', 'kristie.starnes@outlook.com', '360763976', 'I will do complete monthly off page SEO service for high quality backlinks', 'Your Partner in SEO Mastery!!\r\n\r\nRankJack SEO Agency, boasting 12 years of industry expertise, comprises a dedicated team of 35 professionals committed to delivering exceptional results for clients. \r\n\r\nWith a proven track record of success, our agency specializes in implementing effective SEO strategies that enhance online visibility and drive tangible business growth.\r\n\r\n With our collaborative and innovative approach, we exceed client expectations, earning recognition as a trusted partner in achieving SEO excellence.\r\n\r\nAbout this Gig\r\n\r\nYour legacy isnt just Rank #1 on Google and how many people visited your website, but how many of them returned. \r\n\r\nYour legacy is the first impressions and the long-lasting relationships. \r\n\r\nYour legacy is not 12 years down the line but now, and you are writing it every day.\r\n\r\n My Rank Legacy Complete monthly off page SEO Service is crafted to do just that.\r\n\r\n\r\n\r\nFor around 13 years, Ive been helping websites and businesses write lasting legacies. \r\n\r\nAnd like the best of them, my SEO strategy is a fine balance of aggressive White hat SEO Ranking Tactics with Powerful Link Building and a 24/7 Customer Support.\r\n\r\nContact Me Free - https://shorturl.at/aN2DM', 0, '0', '2024-08-14 05:47:26', '2024-08-14 05:47:26', NULL),
(392, 'Mani J', 'info@myseoranks.com', '1 347 560 8971', 'Re: Increase traffic to your website', 'Greeting of the day,\r\n\r\nwww.utkalenterprises.net\r\n \r\nI was checking your website and saw you have a good design and it looks awesome, but it\'s  not ranking on Google and other major search engines.\r\n \r\nWith your permission I would like to send you a SEO Report with Charges showing you a few things to greatly improve these website/keyword search results.\r\n \r\nThese things are not difficult, and my report will be very specific.\r\n \r\nIt will show you exactly what needs to be done to move you up in the rankings dramatically. \r\n \r\nIf interested kindly share your phone number with suitaable time to call you!\r\n \r\nThanks \r\nMani J\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “No thank you”', 0, '0', '2024-08-14 15:47:27', '2024-08-14 15:47:27', NULL),
(393, 'Brandie Waldrop', 'waldrop.brandie@hotmail.com', '421934328', 'To the utkalenterprises.net Owner.', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-08-15 08:17:26', '2024-08-15 08:17:26', NULL),
(394, 'Francis Chisolm', 'francis.chisolm@msn.com', '4247530694', 'Hello utkalenterprises.net Webmaster!', 'Have you ever worried that you won’t make payroll?\r\n\r\nAre rising business expenses stressing you out?\r\n\r\nLet us help take this stress away & give you some breathing room. \r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n USA Based Businesses Only! \r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-15 10:22:27', '2024-08-15 10:22:27', NULL),
(395, 'SpeedyIndexBot', 'speedyindexbot@gmail.com', '86617261631', 'SpeedyIndexBot - 200 links for FREE.', 'https://bit.ly/3OV6orJ SpeedyIndexBot - service for indexing of links in Google. First result in 48 hours. 200 links for FREE.', 0, '0', '2024-08-15 20:07:16', '2024-08-15 20:07:16', NULL),
(396, 'Eugenia Wilfred', 'wilfred.eugenia@gmail.com', '079 7851 3441', 'Hello utkalenterprises.net Admin!', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', 0, '0', '2024-08-16 01:47:44', '2024-08-16 01:47:44', NULL),
(397, 'Uta Key', 'key.uta@gmail.com', '29823773', 'To the utkalenterprises.net Administrator.', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-08-17 09:14:49', '2024-08-17 09:14:49', NULL),
(398, 'Mildred Eugene', 'mildred.eugene@outlook.com', '630070886', 'Hello utkalenterprises.net Administrator.', 'Do you have a list of website updates that you want to deploy but hate having to pay the INSANE prices to get it done?\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', 0, '0', '2024-08-17 09:35:08', '2024-08-17 09:35:08', NULL),
(399, 'MasonGex', 'alden.provitt773@gmail.com', '87115281311', 'Aloha,   wrote about your the prices', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-08-17 21:11:52', '2024-08-17 21:11:52', NULL),
(400, 'Roseanne Vallery', 'roseanne.vallery@msn.com', '237799799', 'Last Chance: 4000 Lumen Epson Projector for $649', 'Epson Projector with 4000 Lumens for only $649\r\n\r\n-- https://bit.ly/PowerLite-1288\r\n\r\n- price at Epson US is $850\r\n- Comes with 3 years of warranty\r\n\r\nPresent wirelessly with ease using the Epson PowerLite 1288 Full HD 3LCD Projector, boasting 4000 Lumens. Project wirelessly in any meeting room thanks to the built-in Wi-Fi and Miracast support. See vibrant, high-resolution images with 1080p clarity and 4000 lumens of brightness.\r\n\r\nAct fast—order now to revolutionize your presentations!\r\nAvailable for immediate delivery—order now!\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe by filling the form on: https://bit.ly/unsubscribe-pages\r\n37 Rue De La Pompe, Mamoudzou, MAYOTTE, USA, 97600', 0, '0', '2024-08-18 20:05:58', '2024-08-18 20:05:58', NULL),
(401, 'Kay Freitas', 'freitas.kay38@gmail.com', '8566523708', 'Hi utkalenterprises.net Webmaster!', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-19 05:34:18', '2024-08-19 05:34:18', NULL),
(402, 'Jared', 'info@queale.medicopostura.com', '4319404', 'Jared Queale', 'Hi \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nThank You, \r\n\r\nJared', 0, '0', '2024-08-19 18:24:07', '2024-08-19 18:24:07', NULL),
(403, 'Lavada Kittelson', 'lavada.kittelson@yahoo.com', '4380028', 'Hi utkalenterprises.net Owner!', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-08-21 03:21:27', '2024-08-21 03:21:27', NULL),
(404, 'DavidGex', 'kayleighbpsteamship@gmail.com', '85897946817', 'Hallo  i am write about your the price', 'Sveiki, es gribēju zināt savu cenu.', 0, '0', '2024-08-22 14:35:44', '2024-08-22 14:35:44', NULL),
(405, 'MasonGex', 'yjdisantoyjdissemin@gmail.com', '89819684123', 'Hi, i am wrote about     price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-08-23 05:59:18', '2024-08-23 05:59:18', NULL),
(406, 'Brianna Belton', 'pageranktechnology@gmail.com', '1201201200', 'Re: Website Design & Development', 'Greeting of the day,\r\n\r\nwww.utkalenterprises.net\r\n \r\nWe offer the following Services at affordable Cost:\r\n\r\nLike: - Website Design, Graphic Design & Re-Design. Web Development, Mobile Apps Development or want some additional features with latest technological trends?\r\n\r\nAre you thinking to upgrade or build new website/mobile app? Or if you want to get idea, how much it would cost you?\r\n\r\nReply me back with your requirements.\r\n\r\nKindest Regards,\r\nBrianna Belton\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “No thank you”', 0, '0', '2024-08-23 09:29:37', '2024-08-23 09:29:37', NULL),
(407, 'Margherita Kelliher', 'kelliher.margherita60@msn.com', '6807456041', 'Dear utkalenterprises.net Owner.', 'Payroll, Insurance, inventory, marketing EXPENSES ……UGHH\r\n\r\nWant to remove the stress and get some breathing room?\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-25 07:03:36', '2024-08-25 07:03:36', NULL),
(408, 'DavidGex', 'kayleighbpsteamship@gmail.com', '89762785722', 'Hi,   write about     price for reseller', 'Hi, I wanted to know your price.', 0, '0', '2024-08-27 00:43:28', '2024-08-27 00:43:28', NULL),
(409, 'Mike Murphy', 'mikerobe@gmail.com', '84172574188', 'Increase rankings with a SEO friendly web design', 'Hi there \r\nI just checked utkalenterprises.net ranks and am sorry to bring this up, but it lacks in many areas. \r\n \r\nUnfortunately, building a bunch of links won\'t solve the issue in this case, and a more comprehensive strategy is required. Google has undergone significant changes over the past year, making it nearly impossible to compete for favorable rankings without a well-designed website. \r\n \r\nWe recommend a search engine-friendly website layout to resolve all issues and propel your site to the top. \r\n \r\nYou can check more details here:https://www.speedseo-digital.net/web-design/ \r\n \r\nThanks for your consideration \r\nMike Murphy\r\nSpeed Designs \r\nhttps://www.speedseo-digital.net/whatapp-us/', 0, '0', '2024-08-27 05:34:34', '2024-08-27 05:34:34', NULL),
(410, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Ever considered having your ad blasted to millions of contact forms? You\'re reading this message, so you know it works! Check out my site below for more info.\r\n\r\nhttp://tgh8hy.contactblasting.xyz', 0, '0', '2024-08-27 06:46:34', '2024-08-27 06:46:34', NULL),
(411, 'Maxine Malone', 'maxine.malone63@msn.com', '513197595', 'Hello utkalenterprises.net Administrator.', 'People + Processes + Working Capital = The Recipe for Business Success\r\n\r\nBut most small business owners put little thought into the capital needed to scale and grow their business.\r\n\r\nIf you have the people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-08-29 12:19:59', '2024-08-29 12:19:59', NULL),
(412, 'Thao Barry', 'info@collab.rotev.io', '7975136463', 'Possible collaboration', 'Hello,\r\n\r\nMy name is Shahar and I\'m the founder of Rotev Marketing. I\'m reaching out because Webflow could be the perfect platform for representing your brand online.\r\n\r\nWith Webflow\'s visual design tools, you can craft custom sites that tell your story and truly capture your brand\'s personality. Dynamic features like animations and interactive elements make browsing more engaging.\r\n\r\nMany growing companies are choosing Webflow for its flexibility and performance. I\'d love to show you samples of our work and discuss how we could develop an impressive and eye-catching website for your business which will help you attract more customers. I\'d be happy to give you a FREE 15-minute call at no cost to discuss your website goals and needs.\r\n\r\nReply \"Yes\" if you\'re interested in a 15 minute intro call to explore building your presence with Webflow.\r\n\r\nRegards,\r\nShahar Zohar\r\ninfo@collab.rotev.io', 0, '0', '2024-08-29 23:00:32', '2024-08-29 23:00:32', NULL),
(413, 'James Seaman', 'melaniefell51@gmail.com', '85379663429', 'Partnership Request.', 'Hello!! \r\nMy name is James Seaman, I work as the Research and Procurement Pharmacist in a pharmaceutical company. I am writing to extend a business request to you.  I am looking for a trustworthy entrepreneur/individual to represent my company in sourcing some of Herbal oil basic raw materials used in the manufacturing of high-quality antiviral vaccines, cancer treatment, and other life-saving treatments. I am assuring you that good profits will be earned from the commission that will be paid to middle-person(s). \r\nI will provide exclusive details to you upon your acceptance. \r\nContact WhatsApp: +1 (229) 443-9134 \r\ncontact by email only when you don\'t have WhatsApp: jamesseaman@chemist.com \r\nI await your response to provide further details to you. \r\nRegards \r\nJames Seaman', 0, '0', '2024-08-30 07:57:54', '2024-08-30 07:57:54', NULL),
(414, 'Jame McIlvain', 'mcilvain.jame@outlook.com', '627370700', 'Hi utkalenterprises.net Administrator!', 'You have built a highly reputable business that values trustworthiness, integrity & professionalism.\r\n\r\nBut this means nothing if you don\'t have a way to PROVE this to the shoppers & sales prospects \r\n\r\nVetted Business Credential Reports are the definitive way to prove and one- click share with prospects:\r\n\r\n+ Business license, insurance & bond\r\n+ Business & professional certifications & accreditations\r\n+ Industry, local & trade awards \r\n \r\nGet Vetted and stack the deck in your favor to win the sale\r\n \r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-08-30 14:52:03', '2024-08-30 14:52:03', NULL),
(415, 'Brianna Belton', 'pageranktechnology@gmail.com', '1201201200', 'Re: Website Design & Development', 'Greeting of the day,\r\n\r\nwww.utkalenterprises.net\r\n \r\nWe offer the following Services at affordable Cost:\r\n\r\nLike: - Website Design, Graphic Design & Re-Design. Web Development, Mobile Apps Development or want some additional features with latest technological trends?\r\n\r\nAre you thinking to upgrade or build new website/mobile app? Or if you want to get idea, how much it would cost you?\r\n\r\nReply me back with your requirements.\r\n\r\nKindest Regards,\r\nBrianna Belton\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “No thank you”', 0, '0', '2024-08-31 04:01:53', '2024-08-31 04:01:53', NULL),
(416, 'Nitin Chaudhary', 'sales@rankinghat.co', '(209) 813-5119', 'Re: SEO Services', 'Hello there,\r\n\r\nYour website\'s design is absolutely brilliant. The visuals really enhance your message and the content compels action. I\'ve forwarded it to a few of my contacts who I think could benefit from your services.\r\n\r\nWhen I was looking at your site \"www.utkalenterprises.net\", though, I noticed some mistakes that you\'ve made re: search engine optimization (SEO) which may be leading to a decline in your organic SEO results.\r\n\r\nWould you like to fix it so that you can get maximum exposure/presence on Google, Bing, Yahoo and web traffic to your website?\r\n\r\nIf this is something you are interested in, then allow me to send you a No Obligation Audit Report for your review. We will fix those errors with no extra cost if you choose any one of our monthly marketing plans.\r\n\r\nHave a nice day!\r\n\r\nRegards,\r\nNitin Chaudhary | International Project Manager                                                    \r\nEmail:- sales@rankinghat.co            \r\nContact Number:- +1- (209) 813-5119', 0, '0', '2024-09-02 18:13:20', '2024-09-02 18:13:20', NULL),
(417, 'MasonGex', 'alden.provitt773@gmail.com', '87722672176', 'Hallo, i am writing about your the price for reseller', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-09-03 00:54:49', '2024-09-03 00:54:49', NULL),
(418, 'Adrianne Queale', 'adrianne.queale@hotmail.com', '661485101', 'Hi utkalenterprises.net Webmaster!', 'Your website is a direct reflection of your company.\r\n \r\nIf it\'s outdated, broken, lacks features or just needs to be updated, it directly affects how your customers perceive the rest of your business MUCH MORE THAN YOU THINK.\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', 0, '0', '2024-09-03 03:48:53', '2024-09-03 03:48:53', NULL),
(419, 'Madge Holmwood', 'loancrowns@gmail.com', '077 6350 3189', 'Dear utkalenterprises.net Admin.', 'Hi,\r\n\r\nAre you seeking a fast and reliable business loan to fuel your growth?\r\n\r\nAt Fund Crowns Limited, we understand that every business is unique. That’s why we offer a diverse range of financing options tailored to meet your specific needs, including:\r\n\r\n>> Expansion Loans: Scale your operations seamlessly.\r\n>> Startup Loans: Kickstart your entrepreneurial journey.\r\n>> Heavy Equipment Financing: Invest in the tools you need.\r\n>> Real Estate Development Loans: Turn your property vision into reality.\r\n>> Construction Loans: Build your future today.\r\n>> Working Capital Loans: Keep your business running smoothly.\r\n>> Bridge Loans: Access immediate funding when you need it.\r\n>> Inventory Financing: Stock up without the stress.\r\n>> Merchant Cash Advances: Get quick cash flow solutions.\r\n>> Franchise Financing: Support your franchise dreams.\r\n\r\nWe are committed to providing you with the funding you need to achieve your business goals.\r\n\r\nReady to get started?\r\nVisit us at www.fundcrownsltd.com or email us at loan@fundcrownsltd.com for personalized assistance.\r\n\r\nLet us help you achieve your business goals with ease!\r\n\r\nBest regards,\r\nDylan Pham\r\nFund Crowns Limited', 0, '0', '2024-09-04 02:41:31', '2024-09-04 02:41:31', NULL),
(420, 'RaymondJoxia', 'no.reply.LeonBertrand@gmail.com', '87635819778', 'A revolutionary new way of advertising.', 'Hey there! utkalenterprises.net \r\n \r\nDid you know that it is possible to send business proposal completely legit? \r\nWhen such messages are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals securely. Messages through Feedback Forms are not likely to end up in spam, since they are deemed as essential. \r\nWe offer you the opportunity to try out our service for free. \r\nWe are able to send up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', 0, '0', '2024-09-04 03:38:00', '2024-09-04 03:38:00', NULL),
(421, 'Gregg Braun', 'braun.gregg@gmail.com', '298883466', 'Hello utkalenterprises.net Webmaster.', 'Have you ever worried that you won’t make payroll?\r\n\r\nAre rising business expenses stressing you out?\r\n\r\nLet us help take this stress away & give you some breathing room. \r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-09-04 13:15:56', '2024-09-04 13:15:56', NULL),
(422, 'Mike Oldman', 'mikeNawTheta@gmail.com', '88272825139', 'Collaboration request', 'Hi there, \r\n \r\nMy name is Mike from Monkey Digital, \r\n \r\nAllow me to present to you a lifetime revenue opportunity of 35% \r\nThat\'s right, you can earn 35% of every order made by your affiliate for life. \r\n \r\nSimply register with us, generate your affiliate links, and incorporate them on your website, and you are done. It takes only 5 minutes to set up everything, and the payouts are sent each month. \r\n \r\nClick here to enroll with us today: \r\nhttps://www.seomonkey.net/affiliates/ \r\n \r\nThink about it, \r\nEvery website owner requires the use of search engine optimization (SEO) for their website. This endeavor holds significant potential for both parties involved. \r\n \r\nThanks and regards \r\nMike Oldman\r\n \r\nMonkey Digital \r\nhttps://www.seomonkey.net/whatsapp-affiliates/', 0, '0', '2024-09-05 09:39:32', '2024-09-05 09:39:32', NULL),
(423, 'Mike Macey', 'mikerobe@gmail.com', '87991343342', 'Improve your website`s ranks totally free', 'Hi there, \r\n \r\nWhile checking your utkalenterprises.net for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.hilkomseo.com/free-cleanup/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\n \r\nRegards \r\nMike Macey\r\n \r\nWhatsapp:https://www.hilkomseo.com/whatsapp-us/', 0, '0', '2024-09-05 14:56:45', '2024-09-05 14:56:45', NULL),
(424, 'Brianna Belton', 'pageranktechnology@gmail.com', '1201201200', 'Re: Website Design & Development', 'Greeting of the day,\r\n\r\nwww.utkalenterprises.net\r\n \r\nWe offer the following Services at affordable Cost:\r\n\r\nLike: - Website Design, Graphic Design & Re-Design. Web Development, Mobile Apps Development or want some additional features with latest technological trends?\r\n\r\nAre you thinking to upgrade or build new website/mobile app? Or if you want to get idea, how much it would cost you?\r\n\r\nReply me back with your requirements.\r\n\r\nKindest Regards,\r\nBrianna Belton\r\n\r\n\r\n\r\n\r\n\r\nIf you don’t want me to contact you again about this, reply with “No thank you”', 0, '0', '2024-09-06 02:31:41', '2024-09-06 02:31:41', NULL),
(425, 'MasonGex', 'yjdisantoyjdissemin@gmail.com', '87963225844', 'Hello  i am write about   the price', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-09-06 18:44:42', '2024-09-06 18:44:42', NULL),
(426, 'JohnGex', 'kayleighbpsteamship@gmail.com', '88249112594', 'Hello  i wrote about     price for reseller', 'Hola, quería saber tu precio..', 0, '0', '2024-09-06 19:18:58', '2024-09-06 19:18:58', NULL),
(427, 'Valeron83DeF', 'menhos7@rambler.ru', '81871574212', 'Online jackpot', 'Hello. \r\n7Slots is a young online casino brand with a huge selection of gambling games, including both the latest hits and classic slots, as well as roulette, blackjack, poker and baccarat. Welcome bonus now - $1200 + 300FS. Register here:  https://tinyurl.com/5hctj7jd', 0, '0', '2024-09-06 19:38:49', '2024-09-06 19:38:49', NULL),
(428, 'Tresa Poulson', 'tresa.poulson@yahoo.com', '745706405', 'Hello utkalenterprises.net Owner!', 'How would you like a surefire way to dominate your local market & win more sales from your competition?\r\n\r\nGetting Vetted is a powerful sales multiplier that helps you close 60 % more deals. \r\nThat’s a game changer.\r\nVetted also provides great SEO & FREE local leads\r\nStart your 30 Day FREE trial & see the results for yourself. \r\nUSA Businesses Only\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Are-You-Ready-To-Dominate-Your-Local-Market?', 0, '0', '2024-09-09 04:45:50', '2024-09-09 04:45:50', NULL),
(429, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Quick question: how would you feel about your ad being seen by millions of people? I sent this message to your contact form, and you\'re reading it now! Visit my site below to learn more.\r\n\r\nhttp://zmxk9c.contactformblasting.xyz', 0, '0', '2024-09-09 05:59:19', '2024-09-09 05:59:19', NULL),
(430, 'Oman Ironside', 'ironside.noemi@gmail.com', '432-226-1027', 'Tailored Financing Solutions for Your Business Growth', 'Hello,\r\n\r\nAt Cateus Investment Company (CIC), we understand that securing the right funding is crucial for both startups and established businesses. That\'s why we offer flexible financing solutions designed to meet your specific needs.\r\n\r\nHere’s how we can help:\r\n\r\nDebt Financing: 3% annual interest with zero penalties for early repayment.\r\nEquity Financing: Venture capital support with a 10% equity stake—helping you expand while keeping control.\r\nWe’re ready to explore the best option for your business. Simply send us your pitch deck or executive summary, and let’s discuss the ideal investment structure to fuel your growth.\r\n\r\nLooking forward to hearing from you.\r\n\r\nBest regards,\r\nOman Rook\r\nExecutive Investment Consultant/Director\r\nCateus Investment Company (CIC)\r\nPhone: +973-17-585338 | Email: oman-rook@cateusgroup.org or cateusgroup@gmail.com\r\nhttps://cateusinvestmentgroup.com\r\n\r\n\r\nCateus Investment Group | Home\r\nhttps://cateusinvestmentgroup.com', 0, '0', '2024-09-10 08:44:36', '2024-09-10 08:44:36', NULL),
(431, 'Syreeta Brookins', 'brookins.syreeta@hotmail.com', '350363393', 'Dear utkalenterprises.net Administrator!', 'Are you concerned that your current website that was built a few years back,is no longer a good representation of your company ?\r\n\r\nWhy pay $50+ per hour for web development work, \r\nwhen you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed web development agency offering wholesale pricing.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\n\r\n\r\nKristine Avocet\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nwww.fusionwebexperts.tech', 0, '0', '2024-09-10 15:25:09', '2024-09-10 15:25:09', NULL),
(432, 'Adam', 'fredrikalfredsson76@gmail.com', '84436469785', 'Remove false and misleading Google reviews, only pay if I succeed', 'Hello, \r\n \r\nAdam here from Deletify (https://deletify.com/) \r\n \r\nI\'m wondering if your business has a review on Google that you perceive as misleading, false, or perhaps even written by a competitor? If so, I can help you remove it, and you only pay if I succeed. My teams success rate is over 99%, and it takes us less than a week to get it removed. \r\n \r\nInterested? \r\n \r\nIf you prefer to call me, you can reach me at +1 917 720 3356. My Whatsapp number is +46 72-4473401 (you can also call me at that number too), or you can book a quick videocall at https://calendly.com/aw--u2_r/15min', 0, '0', '2024-09-11 01:06:03', '2024-09-11 01:06:03', NULL),
(433, 'Frederic Hanslow', 'frederic.hanslow@googlemail.com', '0380 8943724', 'Is utkalenterprises.net your site?', 'Hey  \r\n\r\nNot sure how much money utkalenterprises.net  is making, but selling digital products is on fire.\r\n\r\nThe transaction value in the Digital Commerce market is projected to reach US$7.63 trillion in 2024. (Statistica.)\r\nThere is a simple 2-step method to make money selling high-profit, digital products in less than an hour per day.\r\n\r\nStart leveraging from this growing economy.\r\n\r\nLearn how here:\r\nhttps://hoply.io/Q5QNX', 0, '0', '2024-09-12 01:03:40', '2024-09-12 01:03:40', NULL),
(434, 'Harlan Swearingen', 'swearingen.harlan@msn.com', '7018848275', 'Hi utkalenterprises.net Owner.', 'Rising business expenses are taking a toll on small business owners.\r\n\r\nYou are not alone. It\'s affecting every industry.\r\n\r\nOne way to give yourself some breathing room is to obtain enough working capital to bridge you through the tough times. \r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-09-12 05:15:22', '2024-09-12 05:15:22', NULL),
(435, 'Leif', 'leif@utkalenterprises.net', '261012392', 'Leif Cooksey', 'New Multifunction Anti-theft Waterproof Sling Bag\r\n\r\nThe best ever SUPER Sling Bag: Drop-proof/Anti-theft/Scratch-resistant/USB Charging\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://xbags.shop\r\n\r\nSincerely, \r\n\r\nLeif', 0, '0', '2024-09-12 07:13:41', '2024-09-12 07:13:41', NULL),
(436, 'Mike Baldwin', 'mikerobe@gmail.com', '84984798554', 'Social ads country traffic', 'Hello, \r\n \r\nHey, I\'m Mike from Monkey Digital. We offer a highly popular service that costs only 10$ per 5000 social ads visits. \r\n \r\nMore info:  \r\nhttps://www.seomonkey.net/country-visits/ \r\n \r\nTracking will be sent the same day, the advertisement goes live within a few hours, effective and cheap marketing, try it out, it will be worth every penny. \r\n \r\nRegards \r\nMonkey Digital \r\nhttps://www.seomonkey.net/whatsapp-us/', 0, '0', '2024-09-13 02:18:48', '2024-09-13 02:18:48', NULL),
(437, 'DavidGex', 'kayleighbpsteamship@gmail.com', '81111481383', 'Hello  i am wrote about your   price', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', 0, '0', '2024-09-13 17:51:29', '2024-09-13 17:51:29', NULL),
(438, 'MasonGex', 'alden.provitt773@gmail.com', '89457882817', 'Hallo,   write about your the price for reseller', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-09-14 00:55:14', '2024-09-14 00:55:14', NULL),
(439, 'Mike Roger', 'mikerobe@gmail.com', '88624136265', 'Whitehat SEO for utkalenterprises.net', 'Hi there \r\n \r\nI have just took an in depth look on your  utkalenterprises.net for its SEO Trend and saw that your website could use a boost. \r\n \r\nWe will improve your ranks organically and safely, using only state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.seoxdigital.net/monthly-seo/ \r\n \r\nRegards \r\nMike Roger\r\n \r\nDigital X SEO Experts \r\nhttps://www.seoxdigital.net/whatsapp-us/', 0, '0', '2024-09-15 08:12:56', '2024-09-15 08:12:56', NULL),
(440, 'TedGex', 'kayleighbpsteamship@gmail.com', '84393292955', 'Hi,   writing about     price', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 0, '0', '2024-09-15 09:22:55', '2024-09-15 09:22:55', NULL),
(441, 'Mixailseo', 'yourmail@gmail.com', '83361716911', 'Увеличу посещаемость и доходность сайта', 'Здравствуйте. Помогу увеличить посещаемость и доходность вашего сайта, а также решить все имеющиеся на сайте проблемы. Причем рост посещаемости будет идти за счет притока целевых посетителей из поисковых систем, что для вас максимально выгодно и перспективно. \r\n \r\nНемного информации о себе. Я являюсь специалистом в области создания, доработки и продвижения сайтов. Также имею знания и опыт в ряде смежных областей. Опыт работы составляет больше 19 лет. Работу всегда выполняю качественно. Расценки умеренные. \r\n \r\nОсновные направления моей деятельности: \r\n \r\n1. Внутренняя оптимизация. Все необходимые работы по сайту с целью достижения наилучших позиций в поисковых системах, улучшение конверсионных качеств и юзабилити, решение всех встреченных ошибок, при необходимости внедрение нового или улучшение старого функционала. \r\n \r\n2. Продвижение в поисковых системах. Работа с улучшением позиций по значимым для вас поисковым запросам, что способно дать большой приток целевой аудитории на сайт. \r\n \r\n3. Создание сайтов различных типов. Могу создать лендинг, интернет-магазин, сайт компании, информационный сайт, блог и т. д. \r\n \r\n4. Работа с отзывами в интернете. Создание и продвижение хороших отзывов, а также удаление плохих. \r\n \r\n5. Настройка рекламных кампаний в различных сервисах контекстной рекламы. \r\n \r\n6. Создание, доработка и продвижение групп и каналов в социальных сетях. \r\n \r\n7. Различного рода рассылки, которые обычно дают хороший единоразовый приток продаж. \r\n \r\nТакже могу помочь вам и в ряде иных вопросов. Пишите на почту: unfm44@gmail.com \r\n \r\n-------- \r\n \r\nHello. I will help increase the traffic and profitability of your site, as well as solve all the problems that exist on the site. Moreover, the traffic growth will be due to the influx of targeted visitors from search engines, which is the most profitable and promising for you. \r\n \r\nA little information about myself. I am a specialist in the field of creating, refining and promoting sites. I also have knowledge and experience in a number of related fields. I have more than 19 years of experience. I always do my job well. The prices are reasonable. \r\n \r\nThe main areas of my activity: \r\n \r\n1. Internal optimization. All necessary work on the site in order to achieve the best positions in search engines, improving conversion qualities and usability, solving all encountered errors, if necessary, introducing new or improving old functionality. \r\n \r\n2. Promotion in search engines. Work to improve positions for search queries that are important to you, which can give a large influx of target audience to the site. \r\n \r\n3. Creation of sites of various types. I can create a landing page, an online store, a company website, an information site, a blog, etc. \r\n \r\n4. Working with reviews on the Internet. Creating and promoting good reviews, as well as deleting bad ones. \r\n \r\n5. Setting up advertising campaigns in various contextual advertising services. \r\n \r\n6. Creating, finalizing and promoting groups and channels in social networks. \r\n \r\n7. Various types of mailings, which usually provide a good one-time influx of sales. \r\n \r\nI can also help you with a number of other issues. Write to the mail: unfm44@gmail.com', 0, '0', '2024-09-15 21:31:48', '2024-09-15 21:31:48', NULL),
(442, 'TedGex', 'kayleighbpsteamship@gmail.com', '88521764895', 'Hello  i am writing about your   price', 'Hallo, ek wou jou prys ken.', 0, '0', '2024-09-17 02:52:07', '2024-09-17 02:52:07', NULL),
(443, 'Malorie Blevins', 'blevins.malorie76@gmail.com', '(08) 9017 2262', 'Dear utkalenterprises.net Webmaster!', 'Hey! I wanted to share something cool with you! If you’re tired of the same old wireless plans that promise savings but don’t deliver, you should check out Roccstar Wireless. They’re shaking things up with no-nonsense plans that have everything you need without the gimmicks, and some amazing members benefits and perks. \r\n\r\nFollow @Roccstarwireless\r\n#RoccstarWireless \r\n\r\nShop plans at www.roccstarwireless.com', 0, '0', '2024-09-17 04:02:03', '2024-09-17 04:02:03', NULL),
(444, 'Susanna Mackay', 'mackay.susanna@googlemail.com', '640237149', 'Hi utkalenterprises.net Webmaster.', 'Running a business is not easy.\r\nEspecially when the cost of nearly everything continues to skyrocket.\r\n\r\nCut yourself a break from the stress of rising expenses with a working capital solution that will provide you the relief needed to get through these challenging times.\r\n\r\nGet a no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nSend me a message at my contact info below for info\r\n\r\nElizabeth Miller\r\nelizabeth.miller@helloratesfastfunding.com\r\nhttps://www.helloratesfastfunding.com', 0, '0', '2024-09-18 12:58:04', '2024-09-18 12:58:04', NULL),
(445, 'Chastity Benes', 'benes.chastity93@outlook.com', '6046968308', 'Dear utkalenterprises.net Admin!', 'The Vetted Business Directory June 2024 update is live. \r\n\r\nYour business is NOT INCLUDED because the verification email we sent was returned as undeliverable. \r\n\r\nThis same email is also used by the platform for your local leads, so it\'s important for the integrity of the platform for consumers that want your services to be able to reach you.\r\n\r\nIf the returned email was in error, see the link in my signature to update your listing email. \r\n\r\nOnce remedied, you’ll reactivate all of the world class Vetted benefits:\r\n \r\n+A robust Vetted business profile that promotes trust, transparency & credibility in your market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Local leads from consumers that use our national platform to find Vetted Businesses by category\r\n \r\nUse the link in my signature to add/ update your Vetted business details, and realize the powerful benefits of being a Vetted business in your local market, your service category and your business specialty.\r\n\r\nYours in trust & transparency,\r\n\r\nSarah McCormick\r\nVetted Business Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nsarah.mccormick@vettedpros.com\r\nhttps://vettedpros.com/1-2/?a=Get-Your-Business-Vetted!', 0, '0', '2024-09-18 20:50:21', '2024-09-18 20:50:21', NULL),
(446, 'DavidGex', 'kayleighbpsteamship@gmail.com', '83747384789', 'Aloha, i wrote about your   price', 'Dia duit, theastaigh uaim do phraghas a fháil.', 0, '0', '2024-09-18 20:59:33', '2024-09-18 20:59:33', NULL),
(447, 'Search Engine Index', 'latanya.weiser@gmail.com', '515478012', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 0, '0', '2024-09-19 05:49:28', '2024-09-19 05:49:28', NULL),
(448, 'Winona Olsen', 'olsen.winona@gmail.com', '40-32-24-02', 'You can never have enough leads', 'We are proud to present our latest product for business data\r\n\r\nExperience our searches on worldwide b2b data\r\n\r\nThis offer is a comprehensive dataset of each country\r\n\r\nWhich are all kept up to date on a monthly basis\r\n\r\nTry out the open search we offer to see the full extent of our dataset\r\n\r\nYou can never have enough leads\r\nLeadsBox.biz', 0, '0', '2024-09-19 08:52:13', '2024-09-19 08:52:13', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(449, 'Husam Orabi', 'husamorabi447@gmail.com', '83379277457', 'Good day', 'Hello, \r\n \r\nI am Husam Orabi, Qatari Investors Group\'s chief business development and delivery officer. We offer loans and credit facilities at a small interest rate for ten years and a moratorium of up to two years. \r\nWe also finance profit-oriented projects and businesses. We understand that each business is unique, so let us know what you need for your business, and we will tailor our financing to suit your specific requirements. \r\n \r\nRegards, \r\n \r\nHusam Orabi \r\nCHIEF BUSINESS DEVELOPMENT & DELIVERY OFFICER \r\n \r\nMobile: +971524239312 \r\nWhatsapp: +971524239312 \r\nhusam@qatarinvestors-group.com', 0, '0', '2024-09-19 18:07:53', '2024-09-19 18:07:53', NULL),
(450, 'Giinther Wagner', 'info@strictlydigital.top', '83141944127', 'NEW: semrush backlinks available on sale', 'Hello \r\nThis is Giinther Wagner\r\nfrom Strictly Digital \r\n \r\nLet me present to you our latest discovered from the SEO environment. \r\nWe have noticed that getting backlinks from websites that have high SEO metrics values doesn\'t always help, and in fact, what is more important is to have backlinks from sites that are actually ranking for many keywords. \r\n \r\nThus, we have built this service especially to meet these new discoveries and the results are astonishing. \r\n \r\nPlease check more details here: \r\nhttps://strictlydigital.top/semrush/ \r\n \r\n \r\n \r\nRegards, \r\nStrictly Digital SEO Team \r\n \r\nWhatsapp us for more details: \r\nhttps://strictlydigital.top/whatsapp-us/ \r\ninfo@strictlydigital.top', 0, '0', '2024-09-19 21:19:44', '2024-09-19 21:19:44', NULL),
(451, 'MasonGex', 'yjdisantoyjdissemin@gmail.com', '81691547654', 'Hello  i write about your   price', 'Salam, qiymətinizi bilmək istədim.', 0, '0', '2024-09-20 09:30:10', '2024-09-20 09:30:10', NULL),
(452, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'By reading this message you just proved that contact form blasting works great for advertising. After all, the main battle to advertising is getting people to actually read your ad and you just did that. Now let\'s get your ad blasted out there and get you some sales, followers, youtube views, etc.. Now offering high volume blasting plans designed specially for affiliate marketers and agencies.See my site for additional info\r\n\r\nhttp://96fcje.contactuspagemarketing.xyz', 0, '0', '2024-09-22 06:14:17', '2024-09-22 06:14:17', NULL),
(453, 'Search Engine Index', 'kossak.adrianne@gmail.com', '431538382', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://searchregistry.net/', 0, '0', '2024-09-23 00:42:32', '2024-09-23 00:42:32', NULL),
(454, 'Charley Adamson', 'adamson.charley@yahoo.com', '1668169716', '������������������ Event', '������������ Attention music lovers! ������������\r\n\r\nWow, All the best Sax Summer music  !!!\r\n\r\n������ Spotify: https://open.spotify.com/artist/6ShcdIT7rPVVaFEpgZQbUk\r\n������ Apple Music: https://music.apple.com/fr/artist/jimmy-sax-black/1530501936\r\n������ YouTube: https://music.youtube.com/browse/VLOLAK5uy_noClmC7abM6YpZsnySxRqt3LoalPf88No\r\n������ Other Platforms and Free Downloads :  https://fanlink.tv/jimmysaxblack\r\n\r\n\r\nGet back into the groove with Jimmy sax Black\r\nBest regards,\r\n\r\nJimmy sax Black\r\nwww.jimmysaxblack.com', 0, '0', '2024-09-23 23:37:34', '2024-09-23 23:37:34', NULL),
(455, 'Cristine Pinkham', 'cristine.pinkham@gmail.com', '6999762799', 'To the utkalenterprises.net Admin!', 'Want a surefire way to DOMINATE your local market & win more sales away from your competition?\r\n\r\nGetting Vetted is a powerful sales multiplier that helps you BOOK 63 % more deals. \r\nThat’s a game changer.\r\nVetted also provides great SEO & FREE local leads\r\nStart your 30 Day FREE trial & experience the results for yourself. \r\nSee link in my profile to learn more or to get started.\r\nUSA Businesses Only\r\n\r\nWarmly,\r\n\r\nJennifer Corbitt\r\nVetted Business Report Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nJennifer.Corbitt@Vettedprobusinessusa.com\r\nhttps://www.VettedProBusinessUSA.com', 0, '0', '2024-09-24 09:57:42', '2024-09-24 09:57:42', NULL),
(456, 'Chang Bernacchi', 'chang.bernacchi@gmail.com', '214876344', 'To the utkalenterprises.net Owner.', 'GAMIFIED VIDEOS WORK BETTER THAN OPEN AI  \r\n\r\nGet ANY Video GAMIFIED for FREE if it has over 5,000 views. ($789 Value)\r\n\r\nKeep viewers hooked, ensure full watch time, and collect their emails.\r\n\r\nSend us your video link (showing it has more than 5k views) to see if you qualify.\r\n\r\nMinimum subscriber/follower count required.\r\n\r\nTURN YOUR VIDEO INTO A VIDEO GAME TODAY.\r\n\r\nReply to me here: gamifyvideo@gmail.com', 0, '0', '2024-09-24 12:31:03', '2024-09-24 12:31:03', NULL),
(457, 'Julien Morel', 'info@speedseo.top', '84723678316', 'Improve Your Website\'s Ranking with a Comprehensive Strategy', 'Hi there, \r\n \r\nI recently reviewed the rankings for utkalenterprises.net, and I’m sorry to say that there are several areas where it\'s underperforming. \r\n \r\nUnfortunately, simply building more links won’t fix the problem. With Google’s major updates over the past year, it\'s become essential to have a well-structured, search engine-friendly website to achieve competitive rankings. \r\n \r\nWe recommend implementing a strategic website redesign to address these issues and improve your search visibility. You can find more details here: \r\nhttps://www.speedseo-digital.net/web-design/ \r\n \r\nThank you for considering this, \r\nJulien Morel\r\n \r\n \r\nSpeed Designs \r\nContact Us on WhatsApp \r\nhttps://www.speedseo-digital.net/whatapp-us/', 0, '0', '2024-09-24 22:28:43', '2024-09-24 22:28:43', NULL),
(458, 'Rachelle Huff', 'huff.rachelle63@yahoo.com', '379700818', 'Hi utkalenterprises.net Admin.', 'FINANCIAL INSTRUMENT AND GLOBAL FUNDING\r\n\r\nWe at WEALTHY CREDIT LIMITED HONG KONG -For all your financial instruments -BG/SBLC/PPP ... Also monetization and NON RECOURSE cash loan\r\n10% for any referrals and also Intermediaries/Consultants/Brokers can apply with the company. We fund globally\r\nFor more info on Non Refund cash loan; \r\n\r\nThey are the best in the world, they also  give funding meeting face to face.\r\n\r\nFeel free to follow up and contact them for more details;\r\n\r\nCalls : +852 300 16439\r\nEmail : info@fastcapitalhk.com', 0, '0', '2024-09-25 13:05:39', '2024-09-25 13:05:39', NULL),
(459, 'Tamela Massey', 'tamela.massey@gmail.com', '2657785067', 'Hello utkalenterprises.net Administrator.', 'Good People + Smart Processes + Working Capital = The Recipe for Business Success.\r\n\r\nBut most small business owners put enough thought into the Capital needed to scale and grow their business.\r\n\r\nIf you have the right people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet started with a friendly no obligation working capital quote in less than 2 minutes. \r\n\r\n++ This Offer Only For Businesses In The USA ++\r\n\r\nContact me below for details\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com', 0, '0', '2024-09-26 04:38:08', '2024-09-26 04:38:08', NULL),
(460, 'Vernita Sepulveda', 'vernita.sepulveda30@gmail.com', '745400211', 'Hello utkalenterprises.net Admin!', 'Do you have big ideas and plans to update your website, but hate the outrageous fees and slow turn times of most agencies?\r\nWhy pay $45+ per hour for web development work, when you can get higher quality results AT LESS THAN HALF THE COST? \r\n\r\nWe are a FULL SERVICE, USA managed, web development agency offering WHOLESALE PRICING.\r\n\r\nWe charge $20 per hour compared to $35 -$75 per hour in the market.\r\nWe can also do flat project based pricing if that\'s your preference.\r\n\r\nNo job too big or small. Test us out to see our value.\r\n\r\nUse the link in my signature, for a quick turn around quote.\r\n\r\nWarmly,\r\n\r\nDan Setzinger\r\nSenior Web Specialist \r\nFusion Web Experts  \r\n186 Daniel Island Drive \r\nDaniel Island, SC 29492 \r\nDan.Setzinger@FusionWebExpertsUsa.com\r\nhttps://www.FusionWebExpertsUSA.com', 0, '0', '2024-09-26 08:30:40', '2024-09-26 08:30:40', NULL),
(461, 'Domingo', 'utkalenterprises.net@live.com', '43817472', 'Contact Us', 'Hello there \r\n \r\nDefrost frozen foods in minutes safely and naturally with our THAW KING™. \r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED \r\n\r\nBuy now: https://thawking.shop\r\n \r\nHave a great time, \r\n \r\nDomingo', 0, '0', '2024-09-28 11:48:33', '2024-09-28 11:48:33', NULL),
(462, 'Summer Rubin', 'rubin.summer78@googlemail.com', '6507915200', 'Dear utkalenterprises.net Owner.', 'Rising business expenses continue to take a toll on small business owners.\r\n\r\nYou are not alone. It\'s affecting every industry.\r\n\r\nOne way to give yourself some breathing room is to obtain enough working capital to bridge you through the tough times. \r\n\r\nGet a friendly no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nContact me below for details\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com', 0, '0', '2024-09-30 08:17:41', '2024-09-30 08:17:41', NULL),
(463, 'Stefan Kraus', 'stefan.kraus@gmail.com', '514147489', 'To the utkalenterprises.net Owner.', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-10-02 06:59:47', '2024-10-02 06:59:47', NULL),
(464, 'Jonathan Singleton', 'info@collab.prboost.io', '12345678', 'Free Benzinga Article—Grow Your Reach!', 'Hey there,\r\n\r\nMy name is Jonathan, and I couldn’t help but admire your business and the amazing work you’re doing.\r\n\r\nI wanted to connect with you with an exciting opportunity: a no-cost article on the Benzinga platform! With over 14 million monthly readers, it’s a great method to increase your brand’s credibility. And for just $79, we will publish you to affiliates of FOX, CBS, and ABC plus 300 additional news platforms.\r\n\r\nWe could also get your article published on outlets like Business Insider, Yahoo Finance, and Market Watch—imagine the reach!\r\n\r\nIf you’re interested in claiming your free Benzinga article, just answer with \"YES, I would like to be featured in Benzinga\"! I’d be excited to support you get the recognition you are entitled to.\r\n\r\n{{Best|Regards|Best regards|Kind regards|Warm regards|Cheers|Thanks},\r\nJonathan\r\nPR Boost\r\n\r\n\r\n\r\n\r\nIf you don\'t want to get an email from me on this matter again, please reply back with the text: \"No, thank you\"', 0, '0', '2024-10-02 19:02:19', '2024-10-02 19:02:19', NULL),
(465, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Looking to attract millions of viewers to your website or video affordably?\r\n Get Info http://yehcjc.resultswithformblasting.xyz', 0, '0', '2024-10-03 02:20:59', '2024-10-03 02:20:59', NULL),
(466, 'Brad Steffens', 'woodson.lavonda62@gmail.com', '611011740', 'Quick question', 'Hi,\r\n\r\nAre you feeling the pinch from rising employee benefit costs? At Westside Benefits, we understand and can help you turn things around.\r\n\r\nI’m Brad Steffens, and we specialize in employee concierge benefits for companies with 50 or more employees. Many companies like yours are unaware of powerful tax incentives that can lead to significant FICA savings and reduced workers\' compensation costs.\r\n\r\nYour HR team might find new IRS laws overwhelming, and that\'s where we come in. We ensure full compliance while filling essential health and wellness needs for your employees without altering existing coverage.\r\n\r\nImagine offering:\r\n- Variety of new benefits that complement current plans\r\n- Urgent Care app for critical health decisions\r\n- Additional life insurance coverage up to $100K in Universal Life\r\n\r\nWe’re offering a complimentary quote and a 30-minute consultation to discuss how you can save $500 to $700 per employee per year. \r\n\r\n������ Schedule Your Appointment: https://bit.ly/getnewbenefits \r\n\r\nBest regards,\r\n\r\nBrad Steffens  \r\nWestside Benefits\r\n\r\nP.S. Don’t miss out on tax incentive savings—act now!', 0, '0', '2024-10-03 09:07:21', '2024-10-03 09:07:21', NULL),
(467, 'Michal Ancher', 'michal.ancher@gmail.com', '486162326', 'To the utkalenterprises.net Administrator!', 'Tired of the BBB and their antiquated 1950”s business model?\r\n\r\nIt’s funny how many business owners loathe the BBB, but still use them because they think they are the only game in town.\r\n\r\nThey are not….. \r\n\r\nConsumers don’t care about the “pay to play” BBB score.\r\nThey really just want to review the hard facts and your credentials so they can perform their due diligence and determine if you are the right company for the job.\r\n\r\nVetted Business Credential Reports allow you to host and 1 click share:\r\n\r\n+ Your Business License, Insurance & Bond\r\n+ Your Business & Professional Certifications & Accreditations\r\n+ Your Industry, Local & Trade Affiliations\r\n+ Your Trust Badges, Awards, & Associations Memberships\r\n+ Much more!\r\n\r\nGet Vetted and dominate your local market \r\nSee how Vetted can SUPERCHARGE your business with a No RISK 30 DAY FREE TRIAL\r\nSee link in my profile to learn more or to get started.\r\n \r\nWarmly,\r\n\r\nJennifer Corbitt\r\nVetted Business Report Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nJennifer.Corbitt@Vettedprobusinessusa.com\r\nhttps://www.VettedProBusinessUSA.com', 0, '0', '2024-10-04 08:45:01', '2024-10-04 08:45:01', NULL),
(468, 'Paul Martinez', 'no-replyxxx@gmail.com', '81924241674', 'Improve Your SEO with a Free Backlinks Clean-Up', 'Hi there, \r\n \r\nWhile reviewing your utkalenterprises.net ranking, I noticed several toxic backlinks that could be harming its performance. \r\n \r\nWe’re offering a free backlink cleanup to help you remove these harmful links and boost your rankings quickly. \r\nTake advantage of this free offer here: \r\nhttps://www.freeseocleanups.com/get-started/ \r\n \r\n \r\nIt’s effective, fast, and completely free. Start improving your site’s ranking today! \r\n \r\n \r\nBest regards \r\nPaul Martinez\r\n \r\nWhatsapp: https://wa.link/rx6lkm', 0, '0', '2024-10-04 17:40:09', '2024-10-04 17:40:09', NULL),
(469, 'TedGex', 'kayleighbpsteamship@gmail.com', '81532475973', 'Hi,   writing about   the price for reseller', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-10-05 01:11:02', '2024-10-05 01:11:02', NULL),
(470, 'Sven-Erik Wilson', 'no-replyxxx@gmail.com', '85616676788', 'Earn 35% Commission with Our Affiliate Program!', 'Hi, \r\n \r\nAre you looking to monetize your website with a high-converting affiliate program? Look no further! We’re offering 35% commission on every sale generated through our affiliate program, and we’d love for you to be a part of it. \r\n \r\nHere’s why webmasters love partnering with us: \r\n \r\n•	Generous 35% Commission: Earn big on every sale, no limits! \r\n•	High-Converting Products: We offer services that are in demand, making it easy for you to generate commissions. \r\n•	Real-Time Tracking: Monitor your earnings and performance with ease. \r\n•	Dedicated Affiliate Support: We’re here to help you succeed with tips, resources, and support whenever you need it. \r\n \r\nJoining is simple and completely free. Start earning by promoting our services to your audience today! \r\n \r\nSign Up Now and Start Earning: https://www.earn35percent.com/get-started/ \r\n \r\nIf you have any questions or need more details, feel free to reach out. We’re excited to partner with you and help you boost your earnings! \r\n \r\nBest regards, \r\nSven-Erik Wilson\r\n \r\nMonkey Digital \r\nhttps://wa.link/md1k3j', 0, '0', '2024-10-05 05:02:00', '2024-10-05 05:02:00', NULL),
(471, 'Jorg Huang', 'jorg.huang@yahoo.com', '3720090871', 'Hello utkalenterprises.net Webmaster.', 'Good People + Smart Processes + Working Capital = The Recipe for Business Success.\r\n\r\nBut most small business owners put enough thought into the Capital needed to scale and grow their business.\r\n\r\nIf you have the right people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet started with a friendly no obligation working capital quote in less than 2 minutes. \r\n\r\nUSA Based Businesses Only! \r\n\r\nContact me below for details\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com', 0, '0', '2024-10-05 09:57:55', '2024-10-05 09:57:55', NULL),
(472, 'Galen Raven', 'raven.galen@gmail.com', '4364584', 'To the utkalenterprises.net Admin.', 'Looking to grow your business? We offer customized business loan packages to meet your unique needs. Contact us today at info@financeworldwidehk.com to get started!\r\n\r\nBest regards,\r\nLaura Cha', 0, '0', '2024-10-05 13:09:02', '2024-10-05 13:09:02', NULL),
(473, '<strong><a href=\"https://pr-site.com\">primer-1</a></strong>', 'thomaskingial13@gmail.com', '<strong><a href=\"https://pr-site.com\">primer-5</a></strong>', '<strong><a href=\"https://pr-site.com\">primer-6</a></strong>', '<strong><a href=\"https://pr-site.com\">primer-8</a></strong>', 0, '0', '2024-10-05 14:22:26', '2024-10-05 14:22:26', NULL),
(474, 'Susan Karsh', 'octavia.tamayo@outlook.com', '563047214', 'Quick question', 'Hello,\r\n\r\nWould you be interested in dropping up to 2 pounds a week without hitting the gym?\r\n\r\nMost people don’t believe this is possible, but it is, because it has been working for me and I never gain the weight back.\r\n\r\nI work for Elebands and we make ultra-thin, fashionable body weight bands that come in 5 - 30 pound sets and they look so sexy and sleek you won’t believe they are weights. \r\n \r\nYou just put them on your wrist, ankle and waist for the entire day and you’ll burn up to 1,500 calories a day, with no workout needed.\r\n \r\nBasically, the added weight makes your body work harder and burn more calories as you go about your day.\r\n \r\nIf you want to lose up to 2 lbs a week, without going to a gym, visit our website here: https://bit.ly/elebands-info\r\n\r\nThis Week, For The Fist 50 Customers, you can get 20% off: Use discount code: TAKE20%OFF\r\n\r\nSusan Karsh\r\nBusiness Development\r\nElebands\r\n \r\nP.S. Even Phil Handy, Former LA Lakers coach said our weight bands are great and help burn calories - watch his video here: https://bit.ly/elebands-phil-handy', 0, '0', '2024-10-06 02:15:07', '2024-10-06 02:15:07', NULL),
(475, 'DavidGex', 'kayleighbpsteamship@gmail.com', '82275886932', 'Aloha,   write about your the prices', 'Sawubona, bengifuna ukwazi intengo yakho.', 0, '0', '2024-10-07 06:28:00', '2024-10-07 06:28:00', NULL),
(476, 'MasonGex', 'idipufazawum98@gmail.com', '83996461689', 'Hallo, i writing about   the price for reseller', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-10-07 09:13:32', '2024-10-07 09:13:32', NULL),
(477, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Need a way to get millions of people to follow your website without high costs?\r\n Visit: http://y6dsng.resultswithformblasting.xyz', 0, '0', '2024-10-08 04:17:34', '2024-10-08 04:17:34', NULL),
(478, 'Keenan Baier', 'keenan.baier82@msn.com', '7889587352', 'To the utkalenterprises.net Administrator.', 'Good People + Smart Processes + Working Capital = The Recipe for Business Success.\r\n\r\nBut most small business owners put enough thought into the Capital needed to scale and grow their business.\r\n\r\nIf you have the right people & the business processes in place but no working capital, then your business will be stuck in neutral.\r\n\r\nGet started with a friendly no obligation working capital quote in less than 2 minutes. \r\n\r\n== Must Be A US Based Business To Qualify ==\r\n\r\nGet in touch with me below for more info\r\n\r\nWarmly,\r\n\r\nLauren Smith\r\nHelloRates Fast Funding USA  \r\nCommercial & Business working capital with affordable payments, lowest rates, & best terms\r\nLauren.smith@helloratesfastfundingusa.com\r\nhttps://www.HelloRatesFastFundingUSA.com', 0, '0', '2024-10-10 04:09:46', '2024-10-10 04:09:46', NULL),
(479, 'Search Engine Index', 'kurtz.jonathan41@hotmail.com', '243084887', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net/', 0, '0', '2024-10-10 04:16:45', '2024-10-10 04:16:45', NULL),
(480, 'Walther Claes', 'digitalxflowxxx@gmail.com', '88871259654', 'Boost Your SEO with Country Targeted Backlinks!', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://wa.link/s6vpcy \r\n \r\nBest regards, \r\nDgital X Flow Team', 0, '0', '2024-10-10 06:51:14', '2024-10-10 06:51:14', NULL),
(481, 'Blair Lower', 'lower.blair90@yahoo.com', '881873809', 'Hi utkalenterprises.net Webmaster.', 'IMPORTANT: ACTION REQUIRED:\r\n\r\nThe Vetted Business Profile Reports September 2024 updates have been published. \r\n\r\nUNFORTUNATELY, your business was NOT INCLUDED in the update because the verification email we sent you BOUNCED & WAS RETURNED AS UNDELIVERABLE. \r\n\r\nIf the returned email was in error, please see the link in my signature to update your business profile email. \r\n\r\nOnce remedied, your profile will be published & searchable with all of the Vetted Business Report Benefits:\r\n \r\n+A Vetted Business Profile that promotes trust, transparency & credibility in your local market\r\n+Powerful SEO for your business when you add your URL link in your profile.\r\n+Leads from dedicated local consumers who rely on our award winning Vetted Platform to find credible    businesses in your category\r\n \r\nUse the link below my signature to access your Vetted Business Report Profile.\r\n\r\nYours in trust & transparency,\r\n\r\nJennifer Corbitt\r\nVetted Business Report Specialist\r\n295 Seven Farms Drive Suite C-201\r\nCharleston, SC 29492\r\nJennifer.Corbitt@Vettedprobusinessusa.com\r\nhttps://www.VettedProBusinessUSA.com', 0, '0', '2024-10-10 06:56:38', '2024-10-10 06:56:38', NULL),
(482, 'DavidGex', 'kayleighbpsteamship@gmail.com', '89935236979', 'Aloha,   writing about your   price', 'Sveiki, aš norėjau sužinoti jūsų kainą.', 0, '0', '2024-10-10 18:29:40', '2024-10-10 18:29:40', NULL),
(483, 'TedGex', 'axobajigufo34@gmail.com', '88132785592', 'Hallo  i am write about your the price', 'Hai, saya ingin tahu harga Anda.', 0, '0', '2024-10-11 09:27:18', '2024-10-11 09:27:18', NULL),
(484, 'Ethan Hansen', 'monkeyxxx@gmail.com', '85813899495', 'Earn 35% Commission for Life with Our Affiliate Program!', 'Hi there, \r\n \r\nLooking for a way to earn passive income? Join our Affiliate Program and earn 35% commission on every sale you bring in—for life! Promote our products, and whenever your referral makes a purchase, you\'ll continue earning, even years later. \r\n \r\nSign up now for free: \r\nhttps://www.seomonkey.net/affiliates/ \r\nOr chat with us on WhatsApp: https://wa.link/md1k3j \r\n \r\nBest regards, \r\nApe Reach Team', 0, '0', '2024-10-11 20:26:58', '2024-10-11 20:26:58', NULL),
(485, 'Kenneth Robinson', 'tobias.margarot84@googlemail.com', '145210327', 'Fiverr has freelancers for every budget!', 'Hello there\r\n\r\nNeed professional services on a budget? Fiverr provides a huge selection of budget-friendly freelancers—starting at just $5! If you need graphic design, marketing, web development, or any other service, Fiverr has talented professionals available to help your company thrive.\r\n\r\nTake a look here: https://bit.ly/fiverr-professional-services\r\n\r\nBest regards,\r\nThomas Jenkins', 0, '0', '2024-10-13 09:56:20', '2024-10-13 09:56:20', NULL),
(486, 'Theodore', 'info@utkalenterprises.net', 'Dwh Iteavk', 'Theodore Fishbourne', 'New Multifunction Waterproof Backpack\r\n\r\nThe best ever SUPER Backpack: Drop-proof/Scratch-resistant/USB Charging/Large capacity storage\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://thebackpack.online\r\n\r\nBest, \r\n\r\nTheodore', 0, '0', '2024-10-14 13:24:57', '2024-10-14 13:24:57', NULL),
(487, 'Rafsan Jane', 'rafsan@rafsanjane.com', '008801601701933', 'Please help me', 'Hi\r\n\r\nI\'m Rafsan. I need your help. My uncle in Palestin Gaza need help. They don\'t have food. Please help me. I need 1000$ to help my family. Please send me message back to my email: rafsan@rafsanjane.com or rafsanthedeveloper@gmail.com. My website: https://www.rafsanjane.com/ and Instagram: https://www.instagram.com/rafsanthedeveloper/', 0, '0', '2024-10-15 07:44:06', '2024-10-15 07:44:06', NULL),
(488, 'Tatiana Fergusson', 'tatiana.fergusson@outlook.com', '8421680098', 'To the utkalenterprises.net Admin!', 'Are you planning a development project? How does funding for less than 2% sound? Send me an email for more info:  jpark9000z@gmail.com\r\nThanks\r\nJoseph', 0, '0', '2024-10-15 14:14:52', '2024-10-15 14:14:52', NULL),
(489, '<<< 905305649454', NULL, '82591397699', '<<<', '<<<', 0, '0', '2024-10-17 05:05:17', '2024-10-17 05:05:17', NULL),
(490, 'MasonGex', 'somasesokiyo31@gmail.com', '84935725964', 'Hallo  i write about your   price for reseller', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2024-10-18 08:37:13', '2024-10-18 08:37:13', NULL),
(491, 'Vince McAdam', 'vince.mcadam@gmail.com', '4184648462', 'Dear utkalenterprises.net Webmaster.', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', 0, '0', '2024-10-18 22:59:13', '2024-10-18 22:59:13', NULL),
(492, 'MasonGex', 'ebojajuje04@gmail.com', '83655579142', 'Hi    wrote about     price', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-10-19 01:36:07', '2024-10-19 01:36:07', NULL),
(493, 'MasonGex', 'yawiviseya67@gmail.com', '85564742914', 'Aloha, i wrote about   the price for reseller', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-10-19 06:43:03', '2024-10-19 06:43:03', NULL),
(494, 'Shane Demko', 'shane.demko@gmail.com', '531947955', 'To the utkalenterprises.net Owner.', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-10-19 13:33:39', '2024-10-19 13:33:39', NULL),
(495, 'Search Engine Index', 'davis.reber@gmail.com', '681079771', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net/', 0, '0', '2024-10-20 05:10:27', '2024-10-20 05:10:27', NULL),
(496, 'Miguel Schulz', 'info@strictlydigital.top', '83119936768', 'Boost Your Business with High-Impact Semrush Backlinks!', 'Hi there, \r\n \r\nWant to supercharge your website\'s growth? Our Semrush Backlinks come from domains ranking for 5,000+ keywords, ensuring you get high-quality, authoritative links that will improve your SEO and help grow your business online. This is a powerful strategy to gain visibility, rank higher, and drive more traffic to your site. \r\n \r\nLearn more and order here: \r\nhttps://strictlydigital.top/semrush/ \r\nOr chat with us on WhatsApp: https://wa.link/qz8zwo \r\n \r\nBest regards, \r\nDigital Strict Team \r\ninfo@strictlydigital.top', 0, '0', '2024-10-20 09:41:33', '2024-10-20 09:41:33', NULL),
(497, 'alipovskaya', 'info@palnpaul.com', '84288491761', 'Personalized Contact Data Extraction from Google Maps', 'The secret to business success: accurate contact data! Order now and see how it transforms your outreach. https://telegra.ph/Personalized-Contact-Data-Extraction-from-Google-Maps-10-03 (or telegram: @chamerion)', 0, '0', '2024-10-21 02:33:45', '2024-10-21 02:33:45', NULL),
(498, 'TedGex', 'axobajigufo34@gmail.com', '84878673668', 'Hello    writing about   the price', 'Szia, meg akartam tudni az árát.', 0, '0', '2024-10-21 07:34:44', '2024-10-21 07:34:44', NULL),
(499, 'James Cook', 'jamescook312@outlook.com', '83489113592', 'URGENT loan offer at 3%', 'Dear sir/ma \r\nWe are a finance and investment company offering loans at 3% interest rate. We will be happy to make a loan available to your organisation for your project. Our terms and conditions will apply. Our term sheet/loan agreement will be sent to you for review, when we hear from you. Please reply to this email ONLY  hchoi382@gmail.com \r\n \r\nRegards. \r\nJames Cook', 0, '0', '2024-10-21 12:23:55', '2024-10-21 12:23:55', NULL),
(500, 'Oman Abrahams', 'tomoko.abrahams29@gmail.com', '3044682236', 'Dear utkalenterprises.net Admin.', 'Hello,\r\n\r\nAt Cateus Investment Company (CIC), we understand that securing the right funding is crucial for both startups and established businesses. That\'s why we offer flexible financing solutions designed to meet your specific needs.\r\n\r\nHere’s how we can help:\r\n\r\nDebt Financing: 3% annual interest with zero penalties for early repayment.\r\nEquity Financing: Venture capital support with a 10% equity stake—helping you expand while keeping control.\r\nWe’re ready to explore the best option for your business. Simply send us your pitch deck or executive summary, and let’s discuss the ideal investment structure to fuel your growth.\r\n\r\nLooking forward to hearing from you.\r\n\r\nBest regards,\r\nOman Rook\r\nExecutive Investment Consultant/Director\r\nCateus Investment Company (CIC)\r\n\r\nemail: oman-rook@cateusgroup.org  or cateusgroup@gmail.com \r\nhttps://cateusinvestmentgroup.com', 0, '0', '2024-10-21 17:56:22', '2024-10-21 17:56:22', NULL),
(501, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Need a budget-friendly way to get your ad seen by millions?\r\n Reach out to me at my contact info below if you’d like more information on how I do this.\r\n\r\nRegards,\r\nJens Thurston\r\nEmail: Jens.Thurston@morebiz.my\r\nWebsite: http://j2nwn6.advertise-with-contactforms.pro\r\nSkype: marketingwithcontactforms', 0, '0', '2024-10-23 02:19:56', '2024-10-23 02:19:56', NULL),
(502, 'Callum Nobelius', 'nobelius.callum10@msn.com', '7958417375', 'Dear utkalenterprises.net Admin!', 'Je suis Franck Dupapier de Rue du Print, spécialiste dans l’impression personnalisée d’objets, textiles et PLV.\r\nVous avez besoin d’attirer l’attention lors d’un salon ou d’une campagne de communication ?\r\nNous proposons des solutions sur mesure pour marquer les esprits !\r\nNotre gamme inclut : PLV, drapeaux publicitaires, stickers, bâches, T-shirts, flyers, brochures, et bien plus encore.\r\nEnvie d’en savoir plus ?\r\nDemandez un devis gratuit sur www.rueduprint.fr ou envoyez-moi un e-mail à info@rueduprint.fr.', 0, '0', '2024-10-23 17:08:34', '2024-10-23 17:08:34', NULL),
(503, 'Amelia Brown', 'ameliabrown12784@gmail.com', '71127097', 'YouTube Promotion: 700-1500 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\n The price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', 0, '0', '2024-10-23 21:11:21', '2024-10-23 21:11:21', NULL),
(504, 'Davida Chabrillan', 'writingfeedback@writingbybenjamin.com', '12345678', 'Blog Writing Specials', 'Hi there,\r\n\r\nDo you struggle to make time to create articles?\r\n\r\nHire an Experienced SEO Writer Today!\r\n\r\nI do all the research and offer high-quality SEO content to improve your search rankings and increase engagement with your visitors.\r\n\r\nNeed new articles for your website or to enhance your content marketing, take a look at our latest content offers here:\r\nhttps://bit.ly/benwriting\r\n\r\nBenjamin\r\nContact me directly at behinger@writingbybenjamin.com  or on Skype: behinger19 with any questions.\r\n\r\n\r\n\r\nIf you don\'t want to get an email from me on this matter again, please reply back with the text: \"No, thank you\"', 0, '0', '2024-10-24 02:50:37', '2024-10-24 02:50:37', NULL),
(505, 'Joanna Riggs', 'joannariggs278@gmail.com', '305555012', 'Explainer Video for your website', 'Hi,\r\n\r\nI just visited utkalenterprises.net and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nLet me know if you\'re interested in learning more and/or have any questions.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=utkalenterprises.net', 0, '0', '2024-10-24 20:50:30', '2024-10-24 20:50:30', NULL),
(506, 'Mike Morrison', 'mikexxxx@gmail.com', '89984417325', 'Improve Your Website\'s Ranking with a Comprehensive Strategy', 'Hi there, \r\n \r\nI recently reviewed the rankings for utkalenterprises.net, and I’m sorry to say that there are several areas where it\'s underperforming. \r\n \r\nUnfortunately, simply building more links won’t fix the problem. With Google’s major updates over the past year, it\'s become essential to have a well-structured, search engine-friendly website to achieve competitive rankings. \r\n \r\nWe recommend implementing a strategic website redesign to address these issues and improve your search visibility. You can find more details here: \r\nhttps://www.speedseonet.com/web-design/ \r\n \r\nThank you for considering this, \r\n \r\nMike Morrison\r\n \r\nSpeed Designs \r\nContact Us on WhatsApp:https://wa.link/r5quk9', 0, '0', '2024-10-25 21:11:48', '2024-10-25 21:11:48', NULL),
(507, 'Allaustapr', 'astremovastramirello@gmail.com', '88639161125', 'privet horoshego vsem', '<div class=\"content\">Доброго тебе, помнишь мы списывались и ты обещал скинуть информацию, по спецпроекту ? \" <a href=\"https://rutiti.ru/\" class=\"postlink\">Знакомства рядом с домом</a> \r\n\" Алина 24 года, город Львов, фото там где домик и рядом море, и на почту можешь написать  .\" \r\n</div>', 0, '0', '2024-10-26 10:17:06', '2024-10-26 10:17:06', NULL),
(508, 'Todd Halstead', 'allenjeremy183@gmail.com', '5739338865', 'Opportunity for Businesses Outside the USA.', 'Do you own and operate a business outside the USA? My name is Jeremy\r\nAllen from BNF Investments LLC, a Florida based Investment Company.\r\nWe are expanding our operations outside the USA hence; we are actively\r\nlooking for serious business owners operating outside the USA who are in\r\nneed of business funding or investments in their businesses for quick\r\naccess to funding.\r\n\r\nGet back to me if you are interested through my email:\r\njallen@bnfinvestmentsllc.com', 0, '0', '2024-10-26 22:39:07', '2024-10-26 22:39:07', NULL),
(509, 'XRDeF', 'xrumer23DeF@gmail.com', '88772244621', 'Test, just a XRumer 23 StrongAI test!', 'Hello. \r\n \r\nGood cheer to all on this beautiful day!!!!! \r\n \r\nGood luck :)', 0, '0', '2024-10-27 16:29:49', '2024-10-27 16:29:49', NULL),
(510, 'Precious Mosely', 'precious.mosely@googlemail.com', '621135219', 'To the utkalenterprises.net Admin!', 'Unlock Stress-Free Website Management—Just $25/Month\r\n\r\nExperience worry-free web hosting with our fully managed service designed to keep your website secure, fast, and always up-to-date. For only $25/month, we handle everything—WordPress core, PHP, plugin, and theme updates—along with daily offsite backups, powerful firewall protection, and proactive malware removal.\r\n\r\nPlus, our free migration service ensures your current website transitions to our optimized server with zero downtime. With 24/7 monitoring, a dedicated server, and weekly performance reports, you stay informed without lifting a finger.\r\n\r\nStop wasting time on tech headaches—let us handle it all for you!\r\n\r\nhttps://bestwebsite.link/hosting', 0, '0', '2024-10-28 23:46:03', '2024-10-28 23:46:03', NULL),
(511, 'MasonGex', 'duqotayowud23@gmail.com', '86441358558', 'Aloha  i am writing about your the price for reseller', 'Hai, saya ingin tahu harga Anda.', 0, '0', '2024-10-29 02:57:03', '2024-10-29 02:57:03', NULL),
(512, 'TedGex', 'axobajigufo34@gmail.com', '89263365689', 'Hallo, i writing about   the price', 'Kaixo, zure prezioa jakin nahi nuen.', 0, '0', '2024-10-29 05:43:33', '2024-10-29 05:43:33', NULL),
(513, 'Alexandria Tjalkabota', 'tjalkabota.alexandria@yahoo.com', 'Wp mmqjwwikcyq', 'Hello utkalenterprises.net Webmaster!', 'I offer professional, remote design services with fast turnaround times and impeccable attention to detail. From concept to completion, you\'ll receive print-ready digital files, expertly packaged and delivered. \r\nWith over 15 years of Vehicle Wrap & Graphic Design experience, I\'m ready to help your business grow. Let\'s collaborate! \r\nContact me at angranddesigns@gmail.com. See my portfolio at… https://angranddesigns.com/vehicle-wraps/', 0, '0', '2024-10-29 19:26:48', '2024-10-29 19:26:48', NULL),
(514, 'Search Engine Index', 'macmahon.efren50@googlemail.com', '345363520', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-10-30 02:44:51', '2024-10-30 02:44:51', NULL),
(515, 'Christi Stutchbury', 'christi.stutchbury@gmail.com', '2508877274', 'Hi utkalenterprises.net Owner!', 'We understand that as a financial institution, you value reliable and trustworthy partners. At First Asia Finance International Limited, we offer the best financial solutions for companies, businesses and individuals seeking loans.\r\n\r\nWe have a variety of financial services such as Business loan, Project loan, Corporate Loan and Non-recourse loan.\r\n\r\nWe also lease and monetize standby letter of credit (SBLC) and bank guarantee (BG) With us, you can trust that our services will meet your needs.\r\n\r\nEmail us now to learn more about how we can assist you.\r\n\r\n\r\nEmail: info@firstasiafinance-hk.com\r\ntelephone: +852 8003 9924\r\nWebsite: https://www.firstasiafinance-hk.com', 0, '0', '2024-10-30 22:30:35', '2024-10-30 22:30:35', NULL),
(516, 'DavidGex', 'ibucezevuda439@gmail.com', '85668881745', 'Hallo  i write about your the prices', 'Прывітанне, я хацеў даведацца Ваш прайс.', 0, '0', '2024-10-31 18:16:09', '2024-10-31 18:16:09', NULL),
(517, 'Mike Lucas Garcia', 'mikexxxx@gmail.com', '83269384478', 'Collaboration Request', 'Hello, \r\n \r\nThis is Mike Timmons\r\n from Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://wa.link/md1k3j \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Timmons\r\n \r\nmonkeydigital.co', 0, '0', '2024-10-31 22:30:55', '2024-10-31 22:30:55', NULL),
(518, 'Sharyn Dhakiyarr', 'sharyn.dhakiyarr@gmail.com', '456972159', 'Dear utkalenterprises.net Administrator!', 'I offer professional, remote design services with fast turnaround times and impeccable attention to detail. From concept to completion, you\'ll receive print-ready digital files, expertly packaged and delivered. \r\nWith over 15 years of Vehicle Wrap & Graphic Design experience, I\'m ready to help your business grow. Let\'s collaborate! \r\nContact me at angranddesigns@gmail.com. See my portfolio at… https://angranddesigns.com/vehicle-wraps/', 0, '0', '2024-11-01 23:48:09', '2024-11-01 23:48:09', NULL),
(519, 'Chelsea Hernandez', '5.cvi.r.tu.a.ls@gmail.com', '904-717-0825', 'Admin tasks piling up?', 'Hello utkalenterprises.net team\r\n\r\nAre daily tasks getting in the way of scaling your business?\r\n\r\nAt 5C Virtual Assistance, we\'ve spent 6+ years helping businesses like yours reclaim valuable time and cut operational costs by as much as 70%. Our expert virtual assistants handle your day-to-day tasks so you can dedicate more time to strategic growth.\r\n\r\nWhy industry leaders choose 5C Virtual Assistance: • Cost-effective: + Premium support at just $9/hour – a fraction of local hiring\r\n+ Flexibility: Scale support up or down based on your changing needs\r\n+ Experience: 6+ years in multiple industries\r\n+ No overhead: Zero training expenses, benefits, or office space costs\r\n+ Time-zone aligned: Seamless workflow integration with your team\r\n\r\nOur VAs excel in: \r\n- Administrative Support\r\n- Customer Service\r\n- Data Entry & Management\r\n- Calendar & Email Management\r\n- Social Media Management\r\n- Research & Reporting\r\n\r\nImagine what you could achieve with 20 to 30 more hours freed up each week. Our clients typically report:\r\n+ 40% increase in productivity\r\n+ 25% improvement in customer response times\r\n+ 15+ hours saved weekly on administrative tasks\r\n\r\nLooking to streamline your workflow? Book a free 30-minute consultation to discuss your needs. Simply reply to this email or give us a call at [phone number].\r\n\r\n-- Visit: https://bit.ly/5cvaservices\r\n\r\nBest regards,\r\nChelsea Hernandez\r\n5C Virtual Assistance\r\nhttps://bit.ly/5cvaservices\r\n\r\nP.S. Did you know? Switching to virtual assistance saves businesses an average of $3,000 monthly. Let’s discuss how we can deliver similar results for you.', 0, '0', '2024-11-02 00:14:51', '2024-11-02 00:14:51', NULL),
(520, 'Jamesquing', 'yasen.krasen.13+83168@mail.ru', '82392445479', 'Ofiefheufjwoidjwi hfjsfoiewhgifewhfjasifdj qwoifjwkawdkkwefuhfkwoapdfweh jfkewijfgrogr', 'Ojwdjiowkdeofjeij ifsfhoewdfeifhweui hieojkaskdfwjfghewejif eiwhfufdawdijwehfuihewguih jeifjeweijeruigherug utkalenterprises.net', 0, '0', '2024-11-02 04:23:36', '2024-11-02 04:23:36', NULL),
(521, 'Joanna Riggs', 'joannariggs278@gmail.com', '218985999', 'Video Promotion for utkalenterprises.net?', 'Hi,\r\n\r\nWe\'d like to introduce to you our explainer video service, which we feel can benefit your site utkalenterprises.net.\r\n\r\nCheck out a couple of our existing videos here:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nOur prices start from as little as $195 and include a professional\r\nscript and voice-over. We also provide other accents and non-English languages.\r\n\r\nIf this is something you would like to discuss further, don\'t hesitate to reply.\r\n\r\nKind Regards,\r\nJoanna', 0, '0', '2024-11-02 16:55:22', '2024-11-02 16:55:22', NULL),
(522, 'Eric Persson', 'info@professionalseocleanup.com', '89515515818', 'Improve your website`s ranks totally free', 'Hi there, \r\n \r\nWhile checking your utkalenterprises.net for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMikeEric Persson\r\n \r\nWhatsapp: https://wa.link/rx6lkm \r\nEmail us: info@professionalseocleanup.com', 0, '0', '2024-11-02 17:41:08', '2024-11-02 17:41:08', NULL),
(523, 'Elisabeth Rowcroft', 'charlotte@contactformleads.com', '5557654321', 'Boost Your Brand’s Awareness with Direct Contact Form Outreach – From $19', 'Looking to turn more visitors into customers? \r\n\r\nWe focus on contact forms to place your message right in front of key decision-makers. Reach 100M websites and turn leads into purchasers, starting at just $19. \r\n\r\nBoost your marketing strategy today with guaranteed inbox delivery.\r\n\r\n’’’’ Learn more: https://contactformleads.com\r\n\r\n\r\n\r\n\r\n\r\n\r\nIf at any point you choose to opt-out of any more correspondence from this address, kindly click the link below: https://contactformleads.com/unsubscribe/\r\nVia Vipacco 36, Uri, NY, USA, 7040', 0, '0', '2024-11-03 15:04:15', '2024-11-03 15:04:15', NULL),
(524, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', '??', 'Need a way to get millions of people to check out your video economically?\r\n Reach out to me at my contact info below if you’d like more information on how I do this.\r\n\r\nRegards,\r\nMuhammad Seagle\r\nEmail: Muhammad.Seagle@morebiz.my\r\nWebsite: http://h8569a.advertise-with-contactforms.pro\r\nSkype: marketingwithcontactforms', 0, '0', '2024-11-04 03:58:37', '2024-11-04 03:58:37', NULL),
(525, 'Nickolas McLucas', 'mclucas.nickolas27@googlemail.com', '7858045190', 'Dear utkalenterprises.net Admin.', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-11-05 10:14:49', '2024-11-05 10:14:49', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(526, 'Jonathan Martin', 'info@prboostcolab.com', '12345678', 'Boost your brand exposure with a free article on Benzinga', 'Hey there,  \r\n\r\nI hope this message finds you great. I think your business deserves more exposure.\r\n\r\nWe’re offering a free article on Benzinga, which gets more than 14M+ visitors—a great way to build credibility for your brand and increase exposure at no cost.\r\n\r\nAdditionally, for only $297, we’ll feature your brand on affiliates of FOX, NBC, CBS, ABC, and more than 300 other media outlets. Think of the visibility your brand could gain!\r\n\r\nThis offer is available only for the first 10 people who reply, so if you’d like to take advantage of your free Benzinga article, just reply with \"\"YES, I would like to be featured in Benzinga!\"\"\r\n\r\nI’d be happy to help your brand get the exposure it deserves.\r\n\r\nRegards, \r\nJonathan  \r\nPR Boost\r\n\r\n\r\n\r\n\r\nIf you don\'t want receiving notifications from us anymore, please respond here saying the words: “No thanks”.', 0, '0', '2024-11-05 19:54:43', '2024-11-05 19:54:43', NULL),
(527, 'Nitin Chaudhary', 'sales@rankinghat.co', '(209) 813-5119', 'Re: SEO Packages ##', 'Hi, \r\n\r\nHope you are doing well,\r\n\r\nWith your permission I would like to send you an Audit report of your website \"www.utkalenterprises.net\" with prices showing you a few things to greatly improve these search results for you.\r\n\r\nWould you like me to send pricing/Quote?\r\n\r\nRegards,\r\nNitin Chaudhary | International Project Manager                                                    \r\nEmail:- sales@rankinghat.co            \r\nContact Number:- +1- (209) 813-5119', 0, '0', '2024-11-05 23:54:44', '2024-11-05 23:54:44', NULL),
(528, 'Eli Pittman', 's.ec.ureyou.rfu.ndi.ng@gmail.com', '123456789', 'Looking for Interest-Free Funding? Get Details Inside!', 'Secure 12 Months of Interest-Free Funding as much as $350,000!\r\n\r\nI trust this message finds you well! I\'m Zac, and I focus on helping real estate experts, small businesses and individuals access up to $350,000 in 0% interest financing for 12 months—with no upfront fees whatsoever.\r\n\r\n--- There’s no charge until you receive the funding, which means there’s absolutely no risk to begin. \r\nWhether your aim is closing more deals or make new investments, this funding can help accelerate your business.\r\n\r\nGet all the details here >> https://bit.ly/get-me-funded', 0, '0', '2024-11-06 08:15:30', '2024-11-06 08:15:30', NULL),
(529, 'Audrea Mayorga', 'audrea.mayorga@googlemail.com', '9289139524', 'Dear utkalenterprises.net Webmaster.', 'Hi! Based on the information we found on your website only, you’re probably missing out on tens of thousands of dollars in tax credits every year. There are ~7,000 credits out there for businesses and it’s impossible to know which ones apply to you, and how to qualify for them. Our proprietary software finds them and qualifies you. The best part is we don’t get paid unless we are successful for you. Would you like to take a free look? Please reply to me at my contact info below.\r\n\r\nMelissa Lang \r\nNestWorth.US\r\n(800) 481-2198\r\nInfo@NestWorth.US', 0, '0', '2024-11-07 01:42:48', '2024-11-07 01:42:48', NULL),
(530, 'Isiah', 'utkalenterprises.net@hotmail.com', '7868424652', 'Contact Us', 'Morning \r\n\r\nLooking for a present that will truly captivate? Our Enchanted Shining Rose™ brings together beauty and magic in one beautiful gift. With its gentle light and shimmering rose surrounded by delicate lights, it’s a gift that lights up any room—and any heart.\r\n\r\nSurprise them with something special. Perfect for celebrating special moments or just to show you’re thinking of them.\r\n\r\nLimited-Time Offer: Enjoy 50% off with free shipping at https://shiningrose.biz\r\n\r\nEnjoy,\r\n\r\nIsiah', 0, '0', '2024-11-07 02:45:49', '2024-11-07 02:45:49', NULL),
(531, 'Search Engine Index', 'woods.george77@googlemail.com', '609378198', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-11-07 04:24:37', '2024-11-07 04:24:37', NULL),
(532, 'Search Engine Index', 'submissions@searchindex.site', 'Qnxwgimf', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.info/', 0, '0', '2024-11-07 05:45:09', '2024-11-07 05:45:09', NULL),
(533, 'TedGex', 'axobajigufo34@gmail.com', '82735752772', 'Hi,   wrote about     prices', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2024-11-07 22:08:53', '2024-11-07 22:08:53', NULL),
(534, 'Jere Bailey', 'morrismi1@outlook.com', '7975878122', 'Payment/deposits handler', 'A remote job opportunity for a Law Firm, the role of a Payment/Deposit Handler. This position involves managing payments and deposits, ensuring accurate processing, and maintaining financial record. This position is only for candidates based in the US. \r\n\r\nJob location:  USA \r\nWeekly wages: $2,150 per week.\r\n\r\nWe are looking for a detail-oriented individual with a good background and no criminal record.\r\n\r\nIf you are interested in joining our team, please send an email to get more details jasonmorris001@aol.com\r\n\r\nRegards.', 0, '0', '2024-11-08 18:54:52', '2024-11-08 18:54:52', NULL),
(535, 'FreyaGex', 'yawiviseya67@gmail.com', '84895458417', 'Aloha,   wrote about your the prices', 'Hola, volia saber el seu preu.', 0, '0', '2024-11-09 00:14:15', '2024-11-09 00:14:15', NULL),
(536, 'ErikGex', 'duqotayowud23@gmail.com', '88894768358', 'Aloha  i am write about     price for reseller', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2024-11-09 07:10:35', '2024-11-09 07:10:35', NULL),
(537, 'Benedict Dann', 'benedict.dann@gmail.com', '20465126', 'To the utkalenterprises.net Administrator.', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com\r\n\r\nStruggling to rank on Google? Our SEO experts can help. Contact es.olus@gmail.com', 0, '0', '2024-11-09 08:56:18', '2024-11-09 08:56:18', NULL),
(538, 'OliverGex', 'ibucezevuda439@gmail.com', '89351493131', 'Aloha  i write about your the price', 'Kaixo, zure prezioa jakin nahi nuen.', 0, '0', '2024-11-09 15:56:41', '2024-11-09 15:56:41', NULL),
(539, 'Mike Winter', 'mikexxxx@gmail.com', '82696316264', 'Boost Your SEO with Country Targeted Backlinks!', 'i there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://wa.link/s6vpcy \r\n \r\nBest regards, \r\nMike Winter\r\n \r\nDgital X Flow Team', 0, '0', '2024-11-10 10:23:09', '2024-11-10 10:23:09', NULL),
(540, 'Mike Farrell', 'mikexxxx@gmail.com', '89756639328', 'Social Ads Traffic by Country for utkalenterprises.net', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://wa.link/uqh66k \r\n \r\nRegards \r\nMike Farrell\r\n \r\nmonkeydigital.co', 0, '0', '2024-11-11 01:32:57', '2024-11-11 01:32:57', NULL),
(541, 'Oman Boler', 'leroy.boler78@gmail.com', '6186869175', 'Financing Solutions for Your Business Growth', 'Hello,\r\n\r\nAt Cateus Investment Company (CIC), we understand that securing the right funding is crucial for both startups and established businesses. That\'s why we offer flexible financing solutions designed to meet your specific needs.\r\n\r\nHere’s how we can help:\r\n\r\nDebt Financing: 3% annual interest with zero penalties for early repayment.\r\nEquity Financing: Venture capital support with a 10% equity stake—helping you expand while keeping control.\r\nWe’re ready to explore the best option for your business. Simply send us your pitch deck or executive summary, and let’s discuss the ideal investment structure to fuel your growth.\r\n\r\nLooking forward to hearing from you.\r\n\r\nBest regards,\r\nOman Rook\r\nExecutive Investment Consultant/Director\r\nCateus Investment Company (CIC)\r\n\r\nemail: oman-rook@cateusgroup.org  or cateusgroup@gmail.com https://cateusinvestmentgroup.com', 0, '0', '2024-11-12 11:21:52', '2024-11-12 11:21:52', NULL),
(542, 'Thank you for registering on our website 82946', 'info@dc-btc.cc', 'info@dc-btc.cc', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 0, '0', '2024-11-13 02:24:30', '2024-11-13 02:24:30', NULL),
(543, 'Thank you for registering on our website 82946', 'info@dc-btc.cc', 'info@dc-btc.cc', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 0, '0', '2024-11-13 02:24:34', '2024-11-13 02:24:34', NULL),
(544, 'Thank you for registering on our website 82946', 'info@dc-btc.cc', 'info@dc-btc.cc', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 0, '0', '2024-11-13 02:24:37', '2024-11-13 02:24:37', NULL),
(545, 'Thank you for registering on our website 82946', 'info@dc-btc.cc', 'info@dc-btc.cc', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 0, '0', '2024-11-13 02:24:40', '2024-11-13 02:24:40', NULL),
(546, 'Thank you for registering on our website 82946', 'info@dc-btc.cc', 'info@dc-btc.cc', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 'Thank you for registering on our website http://utkalenterprises.net oijkjrhgkfjdshfj', 0, '0', '2024-11-13 02:24:43', '2024-11-13 02:24:43', NULL),
(547, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', 'any real humans here?', 'Want to get millions of people to share your content on a budget?\r\n Let me know if you’d like more information—my contact info is listed below.\r\n\r\nRegards,\r\nWilford Frueh\r\nEmail: Wilford.Frueh@morebiz.my\r\nWebsite: http://ta90zy.advertise-with-contactforms.pro\r\nSkype: marketingwithcontactforms', 0, '0', '2024-11-13 06:59:24', '2024-11-13 06:59:24', NULL),
(548, 'Jacqueline Burge', 'oskaroliver2023@outlook.com', '353868290', 'Dear utkalenterprises.net Webmaster!', 'My name is James Broderick, and I am an attorney at Broderick & Associates LLP based in Canada. I am reaching out to discuss matters concerning your late relative payable on death.\r\n\r\nPlease feel free to contact me at your earliest convenience at the email address provided below for more information regarding their payable on death policy. Trust me it is something worthwhile you would like to hear. \r\n\r\nThank you for your attention to this matter. Contact me through my email to share more information with you about the payable on death.  jamesbroderick62@outlook.com\r\n\r\nBest regards,\r\nJames Broderick', 0, '0', '2024-11-13 08:06:19', '2024-11-13 08:06:19', NULL),
(549, 'Pearlene', 'info@utkalenterprises.net', '668427733', 'Pearlene Dillion', 'New Multifunction Waterproof Backpack\r\n\r\nThe best ever SUPER Backpack: Drop-proof/Scratch-resistant/USB Charging/Large capacity storage\r\n\r\n50% OFF for the next 24 Hours ONLY + FREE Worldwide Shipping for a LIMITED time\r\n\r\nBuy now: https://thebackpack.biz\r\n\r\nAll the best, \r\n\r\nPearlene', 0, '0', '2024-11-13 13:39:47', '2024-11-13 13:39:47', NULL),
(550, 'LeoGex', 'ibucezevuda439@gmail.com', '86472564537', 'Hallo  i am writing about your   price for reseller', 'Hola, volia saber el seu preu.', 0, '0', '2024-11-13 15:07:59', '2024-11-13 15:07:59', NULL),
(551, 'Mike Goodman', 'mikexxxx@gmail.com', '87341792346', 'Semrush links for utkalenterprises.net', 'Hi there \r\n \r\nHaving some bunch of links pointing to utkalenterprises.net could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://wa.link/u76e6a \r\n \r\nKind regards \r\nMike Goodman\r\n \r\nstrictlydigital.net', 0, '0', '2024-11-13 18:24:29', '2024-11-13 18:24:29', NULL),
(552, 'Ramona Plath', 'plath.ramona59@gmail.com', '335661222', 'Hi utkalenterprises.net Admin.', 'Hi, if your business hasn\'t submitted your claim for the $5.54 Billion Dollar Visa/Mastercard lawsuit settlement for charging customers excess fee\'s between 2004 and 2019, you can submit your claim here before the deadline expires soon. Note: You MUST be a USA based business to be eligible. https://visasettlementclaims.org', 0, '0', '2024-11-14 04:34:42', '2024-11-14 04:34:42', NULL),
(553, 'TedGex', 'axobajigufo34@gmail.com', '83627288335', 'Aloha    write about your the price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-11-14 15:58:59', '2024-11-14 15:58:59', NULL),
(554, 'RobertGex', 'ixutikob077@gmail.com', '86671781419', 'Aloha, i writing about     prices', 'Salut, ech wollt Äre Präis wëssen.', 0, '0', '2024-11-15 12:26:59', '2024-11-15 12:26:59', NULL),
(555, 'Williamzew', 'youssef.amr90@gmail.com', '89834442877', 'Limited Availability: Claim Your $167,649.19 Now https://script.google.com/macros/s/AKfycbyoFwZZOh3jXcUzQT5ad0Ut0MgqSN7yBj3E5s4nFLWDwyqverNTVqPL38nxKjtT9orr/exec', 'Alert: Your Balance Is $167,649.19—Withdraw Now! https://script.google.com/macros/s/AKfycbzgjOt9GYqJfP_zCP4rNdkARonZY4sukQqBHk0srnoizgcWG-J3sJtM5113Lgsd2Ng/exec', 0, '0', '2024-11-15 18:42:32', '2024-11-15 18:42:32', NULL),
(556, 'Williamzew', 'youssef.amr90@gmail.com', '88722195981', 'Limited Availability: Claim Your $167,649.19 Now https://script.google.com/macros/s/AKfycbyoFwZZOh3jXcUzQT5ad0Ut0MgqSN7yBj3E5s4nFLWDwyqverNTVqPL38nxKjtT9orr/exec', 'Alert: Your Balance Is $167,649.19—Withdraw Now! https://script.google.com/macros/s/AKfycbzgjOt9GYqJfP_zCP4rNdkARonZY4sukQqBHk0srnoizgcWG-J3sJtM5113Lgsd2Ng/exec', 0, '0', '2024-11-15 18:42:34', '2024-11-15 18:42:34', NULL),
(557, 'Williamzew', 'youssef.amr90@gmail.com', '86333586725', 'Limited Availability: Claim Your $167,649.19 Now https://script.google.com/macros/s/AKfycbyoFwZZOh3jXcUzQT5ad0Ut0MgqSN7yBj3E5s4nFLWDwyqverNTVqPL38nxKjtT9orr/exec', 'Alert: Your Balance Is $167,649.19—Withdraw Now! https://script.google.com/macros/s/AKfycbzgjOt9GYqJfP_zCP4rNdkARonZY4sukQqBHk0srnoizgcWG-J3sJtM5113Lgsd2Ng/exec', 0, '0', '2024-11-15 18:42:38', '2024-11-15 18:42:38', NULL),
(558, 'Williamzew', 'youssef.amr90@gmail.com', '86281331827', 'Limited Availability: Claim Your $167,649.19 Now https://script.google.com/macros/s/AKfycbyoFwZZOh3jXcUzQT5ad0Ut0MgqSN7yBj3E5s4nFLWDwyqverNTVqPL38nxKjtT9orr/exec', 'Alert: Your Balance Is $167,649.19—Withdraw Now! https://script.google.com/macros/s/AKfycbzgjOt9GYqJfP_zCP4rNdkARonZY4sukQqBHk0srnoizgcWG-J3sJtM5113Lgsd2Ng/exec', 0, '0', '2024-11-15 18:42:41', '2024-11-15 18:42:41', NULL),
(559, 'Williamzew', 'youssef.amr90@gmail.com', '82323613297', 'Limited Availability: Claim Your $167,649.19 Now https://script.google.com/macros/s/AKfycbyoFwZZOh3jXcUzQT5ad0Ut0MgqSN7yBj3E5s4nFLWDwyqverNTVqPL38nxKjtT9orr/exec', 'Alert: Your Balance Is $167,649.19—Withdraw Now! https://script.google.com/macros/s/AKfycbzgjOt9GYqJfP_zCP4rNdkARonZY4sukQqBHk0srnoizgcWG-J3sJtM5113Lgsd2Ng/exec', 0, '0', '2024-11-15 18:42:44', '2024-11-15 18:42:44', NULL),
(560, 'Search Engine Index', 'rhea.mclaurin22@gmail.com', '8022637508', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-11-16 05:49:15', '2024-11-16 05:49:15', NULL),
(561, 'Katelyn Raiden', 'katelynraiden@gmail.com', '9104225197', 'Youtube Promotion: 700 new subscribers each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', 0, '0', '2024-11-16 07:55:47', '2024-11-16 07:55:47', NULL),
(562, 'HenryGex', 'ebojajuje04@gmail.com', '86873625721', 'Hi, i wrote about your the price for reseller', 'Kaixo, zure prezioa jakin nahi nuen.', 0, '0', '2024-11-17 06:16:30', '2024-11-17 06:16:30', NULL),
(563, 'Williamzew', 'markjensen1967@gmail.com', '83555637755', 'Earn $2,400,000 with a $300 Investment – The 2024 Plan https://princetonshopping.com/sharedInc/cf/polTrack.cfm?Buspart_id=998&Enterprise_Code=POL&Sid_Code=POL&Prod_id=1372&Server_Name=telegra', '$300 COULD NET YOU $2,400,000 BY DECEMBER 2024 - FIND OUT HOW! http://www.lgb2bshop.co.kr/shop/bannerhit.php?bn_id=1&url=https%3A%2F%2Ftelegra.ph%2Feurbank-11-03%3F4685', 0, '0', '2024-11-17 16:53:17', '2024-11-17 16:53:17', NULL),
(564, 'Williamzew', 'markjensen1967@gmail.com', '86499954216', 'Earn $2,400,000 with a $300 Investment – The 2024 Plan https://princetonshopping.com/sharedInc/cf/polTrack.cfm?Buspart_id=998&Enterprise_Code=POL&Sid_Code=POL&Prod_id=1372&Server_Name=telegra', '$300 COULD NET YOU $2,400,000 BY DECEMBER 2024 - FIND OUT HOW! http://www.lgb2bshop.co.kr/shop/bannerhit.php?bn_id=1&url=https%3A%2F%2Ftelegra.ph%2Feurbank-11-03%3F4685', 0, '0', '2024-11-17 16:53:19', '2024-11-17 16:53:19', NULL),
(565, 'Williamzew', 'markjensen1967@gmail.com', '85863265854', 'Earn $2,400,000 with a $300 Investment – The 2024 Plan https://princetonshopping.com/sharedInc/cf/polTrack.cfm?Buspart_id=998&Enterprise_Code=POL&Sid_Code=POL&Prod_id=1372&Server_Name=telegra', '$300 COULD NET YOU $2,400,000 BY DECEMBER 2024 - FIND OUT HOW! http://www.lgb2bshop.co.kr/shop/bannerhit.php?bn_id=1&url=https%3A%2F%2Ftelegra.ph%2Feurbank-11-03%3F4685', 0, '0', '2024-11-17 16:53:21', '2024-11-17 16:53:21', NULL),
(566, 'Williamzew', 'markjensen1967@gmail.com', '83631228654', 'Earn $2,400,000 with a $300 Investment – The 2024 Plan https://princetonshopping.com/sharedInc/cf/polTrack.cfm?Buspart_id=998&Enterprise_Code=POL&Sid_Code=POL&Prod_id=1372&Server_Name=telegra', '$300 COULD NET YOU $2,400,000 BY DECEMBER 2024 - FIND OUT HOW! http://www.lgb2bshop.co.kr/shop/bannerhit.php?bn_id=1&url=https%3A%2F%2Ftelegra.ph%2Feurbank-11-03%3F4685', 0, '0', '2024-11-17 16:53:24', '2024-11-17 16:53:24', NULL),
(567, 'Williamzew', 'markjensen1967@gmail.com', '84575863253', 'Earn $2,400,000 with a $300 Investment – The 2024 Plan https://princetonshopping.com/sharedInc/cf/polTrack.cfm?Buspart_id=998&Enterprise_Code=POL&Sid_Code=POL&Prod_id=1372&Server_Name=telegra', '$300 COULD NET YOU $2,400,000 BY DECEMBER 2024 - FIND OUT HOW! http://www.lgb2bshop.co.kr/shop/bannerhit.php?bn_id=1&url=https%3A%2F%2Ftelegra.ph%2Feurbank-11-03%3F4685', 0, '0', '2024-11-17 16:53:27', '2024-11-17 16:53:27', NULL),
(568, 'Bridget Clarey', 'clarey.bridget90@gmail.com', '353831496', 'Your FREE 1-Month Premium Trial Awaits – Claim It Now!', 'Hi again user_name,\r\n\r\nWe’re thrilled to announce the launch of the all-new Leader CRM, and as a valued user, you and your team are invited to enjoy a free one-month trial of our premium subscription—no credit card required.\r\n\r\nThis latest version has powerful new features designed to streamline your sales process. In fact, Beta users have already reported a 42% increase in sales!\r\n\r\nWhat’s new in Leader CRM:\r\n\r\n    Multi-platform support (Android, iOS & web)\r\n    Automated workflows to save time\r\n    Advanced team collaboration tools\r\n    Easy file uploads directly into the CRM\r\n    Data-driven insights to improve performance\r\n    Full integration with Zapier for enhanced workflow\r\n\r\nYour upgrade is waiting—don’t miss this opportunity!\r\nClick here at https://app.leader.net/login to claim your offer before it expires in just 48 hours.\r\nThis is your chance to take your sales process to the next level and grow your sales.\r\n\r\n Don’t let it slip away!\r\n\r\nDOWNLOAD NOW at https://app.leader.net/login and experience the difference!\r\nEmail us at support@leader.net and Our dedicated support team  is always here to help if you have any questions or need assistance.\r\n\r\nKeep being a Leader������������ \r\nThe Leader Team', 0, '0', '2024-11-18 21:48:13', '2024-11-18 21:48:13', NULL),
(569, 'Crawford', 'may.darnell@gmail.com', '644023387', 'I have a question', 'Hi, this is a friendly reminder that this is the last chance for USA based businesses to file their claim to receive compensation from the Visa/Mastercard $5.5 Billion Dollar settlement. You could potentially receive tens of thousands, hundreds of thousands or even millions in compensation based on your usage. https://visasettlementclaim.org', 0, '0', '2024-11-19 08:40:08', '2024-11-19 08:40:08', NULL),
(570, 'Sara Whisler', 'whisler.sara@gmail.com', '719039939', 'Hey utkalenterprises.net, Quick Notiice', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', 0, '0', '2024-11-20 01:48:45', '2024-11-20 01:48:45', NULL),
(571, 'Samuel Nuzzo', 'samuel.nuzzo@gmail.com', '4835342263', 'Container House at Factory Price', 'Rick here from Container Speedy House Co., Ltd, we are the factory producing modular container houses from China. It is a pleasure to introduce you our container houses for office, accommodation, hotel, school and camping house etc. \r\n\r\nPlease contact us by  Whatsapp: +8615150130346  More information on our website: www.containerspeedyhouse.com  More videos on our youtube: https://www.youtube.com/@containerspeedyhouse', 0, '0', '2024-11-21 09:18:28', '2024-11-21 09:18:28', NULL),
(572, 'Teena Isaacs', 'isaacs.teena57@gmail.com', '6099494261', 'To the utkalenterprises.net Owner.', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-11-21 12:01:36', '2024-11-21 12:01:36', NULL),
(573, 'Steve Cullen', 'steve@consumerprodemail.com', '637774952', 'Expanding Distribution', 'Hello, I\'m Steve Cullen with Consumer Products International ( https://www.consumerproductsintl.com ).\r\n\r\nAt CPI, we specialize in helping domestic and international consumer brands expand their reach in the US market. With decades of experience and billions in generated revenue, we offer a comprehensive solution for manufacturers looking to enter or grow in America\'s consumer market.\r\n\r\nOur services include:\r\n* Distribution to major retailers (C-Stores, Food/Drug/Mass, Home Centers, Online)\r\n* FDA/Regulatory guidance\r\n* Sales and marketing support (TV, Public Relations Campaigns)\r\n* Warehousing and logistics\r\n\r\nWe pride ourselves on our turnkey approach and ability to quickly bring products to market. Our team\'s expertise and established relationships with national and regional retail chains give your brand a competitive edge.\r\n\r\nTo discuss how we can help your brand succeed in the US market, please contact us or schedule a call at https://calendly.com/stevecullen-nutricompanyinc/15-minute-call-cpi \r\n\r\nBest regards,\r\nSteve Cullen\r\nConsumer Products International', 0, '0', '2024-11-21 23:44:27', '2024-11-21 23:44:27', NULL),
(574, 'Natisha', 'info@fitchett.medicopostura.com', '353368589', 'Natisha Fitchett', 'Morning \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nHave a great time, \r\n\r\nNatisha', 0, '0', '2024-11-23 00:32:17', '2024-11-23 00:32:17', NULL),
(575, 'RobertGex', 'ixutikob077@gmail.com', '85943951199', 'Aloha  i am wrote about your   price for reseller', 'Ola, quería saber o seu prezo.', 0, '0', '2024-11-23 03:22:14', '2024-11-23 03:22:14', NULL),
(576, 'Daniel', 'dt232449@outlook.com', '83369412865', 'BLACK FRIDAY: Get a WordPress Website for $4K!', 'This Black Friday, get a professional WordPress website for $4,000! \r\n? Custom design tailored to your brand \r\n? Up to 15 pages \r\n? Mobile-friendly, SEO-ready \r\n? Hosting for $29/month with premium security and speed \r\nOffer ends November 30, 2024. Don’t miss out! \r\n \r\nClaim Your Website Now: https://bit.ly/4fDFxvt \r\n \r\n \r\n \r\n \r\nDaniel \r\nPhone: +1 (917) 744-9170 \r\nTelegram: awesomeagency', 0, '0', '2024-11-23 03:33:51', '2024-11-23 03:33:51', NULL),
(577, 'Linxex', 'yourmail@gmail.com', '85238543799', 'I propose a link exchange', 'Hello. I offer a link exchange. I place a link from my information site with several language versions to your site. And you place a link from your site to another site (not to the one from which I place the link). Links are placed on a permanent basis (forever). Links are indexed by search engines and are placed on pages already on the sites. \r\n \r\nIf you are interested, then write to: uns88@yandex.com', 0, '0', '2024-11-23 10:31:08', '2024-11-23 10:31:08', NULL),
(578, 'Fatima Olive', 'olive.fatima@gmail.com', '612689948', 'Hello utkalenterprises.net Owner!', 'Hi,\r\n\r\nIf you\'ve fallen victim to an investment scam and lost money, you\'re not alone. Scammers are becoming more sophisticated, but there is hope. Our team specializes in helping individuals like you recover lost funds through legal avenues and professional recovery services.\r\n\r\nDon’t let the scam define your future. Contact us today for a confidential consultation. We’ll guide you step-by-step and work hard to help you reclaim what you’ve lost. Click here www.madacovi.co for more details\r\n\r\nTake action now. You deserve justice and a chance to move forward.\r\n\r\nBest regards,\r\nGerard Williams\r\nMadacovi Limited\r\nhelp@madacovi.co\r\nwww.madacovi.co', 0, '0', '2024-11-23 11:11:19', '2024-11-23 11:11:19', NULL),
(579, 'XRDeF', 'xrumer23DeF@gmail.com', '82317883841', 'Test, just a XRumer 23 StrongAI test...', 'Hello. \r\n \r\nGood cheer to all on this beautiful day!!!!! \r\n \r\nGood luck :)', 0, '0', '2024-11-23 12:19:05', '2024-11-23 12:19:05', NULL),
(580, 'Mike Page', 'mikexxxx@gmail.com', '81594524279', 'Black Friday Launch: Negative SEO v2.0 – Payback Time!', 'Hi, \r\n \r\nIntroducing Negative SEO v2.0, the ultimate tool for dealing with unfair competitors. Launching just in time for Black Friday, this cutting-edge strategy is designed to deindex WordPress sites and help you take control of the competition. \r\nWhy Choose Negative SEO v2.0? \r\n \r\n? Target WordPress sites with precision \r\n? Disrupt and deindex competitors’ rankings \r\n? Innovative, proven deindexing strategy \r\n \r\nBlack Friday Special Offer \r\nGet v2.0 at an exclusive discount with coupon: 4FMDAY \r\n \r\nGrab the Deal Now \r\nhttps://www.speed-seo.net/product/negative-seo-service-v2-0/ \r\n \r\nDon’t miss out—this deal is available for a limited time only. \r\n \r\nIt’s payback time—turn the tables on unfair competitors with Negative SEO v2.0. \r\n \r\nBest regards, \r\nThe Speed SEO Team \r\nhttps://www.speed-seo.net/whatsapp-with-us/', 0, '0', '2024-11-23 23:47:09', '2024-11-23 23:47:09', NULL),
(581, 'Search Engine Index', 'winchcombe.douglas61@gmail.com', '657618023', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-11-25 03:36:25', '2024-11-25 03:36:25', NULL),
(582, 'Mike George Jensen', 'mikexxxx@gmail.com', '83161176192', 'Collaboration Request', 'Hello, \r\n \r\nThis is Mike Farmer\r\n from Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Farmer\r\n \r\nmonkeydigital.co', 0, '0', '2024-11-26 01:56:11', '2024-11-26 01:56:11', NULL),
(583, 'HellGex', 'somasesokiyo31@gmail.com', '88439357469', 'Hello  i wrote about your   price for reseller', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2024-11-26 07:53:22', '2024-11-26 07:53:22', NULL),
(584, 'Mike White', 'mikexxxx@gmail.com', '86729696552', 'Boost Your SEO with Country Targeted Backlinks!', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike White\r\n \r\nDgital X Flow Team', 0, '0', '2024-11-26 22:42:48', '2024-11-26 22:42:48', NULL),
(585, 'Bryant Ormiston', 'bryant.ormiston14@yahoo.com', '648194040', 'To the utkalenterprises.net Webmaster!', 'Hi,\r\n\r\nI am a senior web developer, highly skilled and with 10+ years of collective web design and development experience, I work in one of the best web development company.\r\n\r\n\r\nMy hourly rate is $8\r\n\r\n\r\nMy expertise includes: \r\n\r\nWebsite design - custom mockups and template designs \r\nWebsite design and development - theme development, backend customisation \r\nResponsive website - on all screen sizes and devices \r\nPlugins and Extensions Development \r\nWebsite speed optimisation and SEO on-page optimisation \r\nWebsite security \r\nWebsite migration, support and maintenance \r\nIf you have a question or requirement to discuss, I would love to help and further discuss it. Please email me at e.solus@gmail.com\r\n\r\n\r\nRegards, \r\nSachin\r\ne.solus@gmail.com', 0, '0', '2024-11-27 08:24:18', '2024-11-27 08:24:18', NULL),
(586, 'OliverGex', 'ibucezevuda439@gmail.com', '88745665466', 'Hallo    wrote about your   price', 'Ciao, volevo sapere il tuo prezzo.', 0, '0', '2024-11-27 15:37:17', '2024-11-27 15:37:17', NULL),
(587, 'TedGex', 'axobajigufo34@gmail.com', '88682342449', 'Aloha  i write about     prices', 'Hæ, ég vildi vita verð þitt.', 0, '0', '2024-11-27 16:37:07', '2024-11-27 16:37:07', NULL),
(588, 'Alicia Dawson', 'ashton@businesstechgenius.com', '5551234567', 'Simplify meeting organization with AI.', 'Hello there\r\n\r\nSick of disorganized notes and missed follow-ups? With Fireflies ai, your meetings will always result in clear, actionable outcomes.\r\n\r\nHere’s what it does:\r\n- Records and transcribes meetings automatically.\r\n- Summarizes key decisions and action items.\r\n- Turns discussions into searchable and shareable records.\r\n\r\n+ Start your free trial now and experience the change.\r\n\r\nSign up for free today at: .https://businesstechgenius.com/FirefliesAi\r\n\r\nLet me know your feedback!\r\n\r\nThanks,\r\nMarie\r\n\r\n\r\nWhenever you choose to opt-out of additional notifications from our side, please reply with the message: \"No please\"\r\nIt Swee 103, Dobbs Ferry, NY, USA, 8621 Eb', 0, '0', '2024-11-28 03:47:50', '2024-11-28 03:47:50', NULL),
(589, 'Marina Verdin', 'marina.verdin64@msn.com', '745194538', 'To the utkalenterprises.net Webmaster.', 'Let Us Take a Few Things Off Your Plate (Plus Black Friday Savings)\r\n\r\nUnlike your current host, Best Website goes above and beyond to support your business by including valuable extras as part of our fully managed WordPress hosting service, such as daily maintenance, plugin updates, security monitoring and unlimited technical support.\r\nSign up now for our industry-leading services and save 20% on 12 months of hosting with our special Black Friday pricing! \r\n\r\nhttps://bestwebsite.link/blackfriday', 0, '0', '2024-11-28 10:26:27', '2024-11-28 10:26:27', NULL),
(590, 'Phil Stewart', 'noreplyhere@aol.com', '342-123-4456', 'seeking information', 'Don\'t waste your time with ineffective advertising. Let us help you reach millions of potential customers with just one flat rate. By sending your ad text through website contact forms, your message will be read just like you\'re reading this one. Plus, there are never any per click costs.\r\n\r\n Reach out to me below if you want more details on how I make this happen.\r\n\r\nRegards,\r\nManual Maccallum\r\nEmail: Manual.Maccallum@morebiz.my\r\nWebsite: http://ny38zu.advertise-with-contactforms.pro\r\nSkype: marketingwithcontactforms', 0, '0', '2024-11-28 14:04:56', '2024-11-28 14:04:56', NULL),
(591, 'Dell Coolidge', 'morrismi1@outlook.com', '5819859175', 'Payment/deposits handler.', 'A remote job opportunity for a Law Firm, the role of a Payment/Deposit Handler. This position involves managing payments and deposits, ensuring accurate processing, and maintaining financial record. This position is only for candidates based in the US. \r\n\r\nJob location:  USA \r\nWeekly wages: $2,150 per week.\r\n\r\nWe are looking for a detail-oriented individual with a good background and no criminal record.\r\n\r\nIf you are interested in joining our team, please send an email to get more details jasonmorris001@aol.com\r\n\r\nRegards.', 0, '0', '2024-11-29 03:43:47', '2024-11-29 03:43:47', NULL),
(592, 'Ira Durr', 'ira.durr22@gmail.com', '279836646', 'hello?', 'Hi, this is a friendly reminder it\'s your last chance to file your claim for the ERC / Employee Retention Tax Credit. This is money set aside that\'s owed to you by the US Government, which reimburses you up to $32,200 per W2 you kept on payroll during the pandemic. This is your last chance to claim your money: https://claim-erc.net', 0, '0', '2024-11-29 08:02:21', '2024-11-29 08:02:21', NULL),
(593, 'Stewart', 'info@tietkens.caredogbest.com', '496807919', 'Contact Us', 'Hello there \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF: https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nSincerely, \r\n\r\nStewart', 0, '0', '2024-11-30 03:10:55', '2024-11-30 03:10:55', NULL),
(594, 'Heinz De Smet', 'info@professionalseocleanup.com', '81529183377', 'Improve your website`s ranks totally free', 'Hi there, \r\n \r\nWhile checking your utkalenterprises.net for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMikeHeinz De Smet\r\n \r\nWhatsapp: https://www.professionalseocleanup.com/whatsapp/ \r\nEmail us: info@professionalseocleanup.com', 0, '0', '2024-12-01 13:36:35', '2024-12-01 13:36:35', NULL),
(595, 'Katelyn Raiden', 'katelynraiden@gmail.com', '240883405', 'YouTube Promotion: 700-1500 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\n The price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', 0, '0', '2024-12-01 16:05:31', '2024-12-01 16:05:31', NULL),
(596, 'Lenaalinna', 'astremovastramirello@gmail.com', '83298246586', 'privet horoshego vsem', '<div class=\"content\">Тема Знакомства что мы обсуждали, актуальна и сегодня, приятные люди уже рядом, как ты помнишь, прежде всего интересно еще, фишки \" <a href=\"https://rutiti.ru/\" class=\"postlink\">Знакомства</a> \r\n\" Благодарим за участие, внимание к деталям и что зашли на наш сайт и нашли то, что вам нужно .\" \r\n</div>', 0, '0', '2024-12-02 05:33:54', '2024-12-02 05:33:54', NULL),
(597, 'LeoGex', 'ibucezevuda439@gmail.com', '83747678789', 'Hello  i am wrote about     price', 'Dia duit, theastaigh uaim do phraghas a fháil.', 0, '0', '2024-12-02 11:22:43', '2024-12-02 11:22:43', NULL),
(598, 'Fae Hedges', 'hedges.fae@googlemail.com', '140503205', 'Monetize Your Website Effortlessly – Earn from Traffic Alone', 'Are you ready to earn money from your website with minimal effort? ������ With ForeMedia.net, you can start making revenue from ad impressions alone—clicks are just a bonus!\r\n\r\nHere’s why website owners love us:\r\n✅ Instant approval for new publishers\r\n✅ Earnings from traffic, not just clicks\r\n✅ Hassle-free setup in minutes\r\n\r\n������ Register Now Her: https://foremedia.pro/omxR0  and start monetizing your traffic today!\r\n\r\nBest,\r\nThe ForeMedia Team', 0, '0', '2024-12-03 08:07:20', '2024-12-03 08:07:20', NULL),
(599, 'Aaron High', 'oskaroliver2023@outlook.com', '3427870964', 'Dear utkalenterprises.net Admin!', 'My name is James Broderick, and I am an attorney at Broderick & Associates LLP based in Canada. I am reaching out to discuss matters concerning your late relative payable on death sum of Eleven Million Eight Hundred Thousand, Twenty United States Dollars ($11,800,020.00).\r\n\r\nPlease feel free to contact me at your earliest convenience at the email address provided below for more information regarding their payable on death policy. Trust me it is something worthwhile you would like to hear. \r\n\r\nThank you for your attention to this matter. Contact me through my email to share more information with you about the payable on death.  jamesbroderick63@outlook.com\r\n\r\nBest regards,\r\nJames Broderick', 0, '0', '2024-12-03 10:06:50', '2024-12-03 10:06:50', NULL),
(600, 'Houston Mata', 'mata.houston@gmail.com', '6501495311', 'Monetize Your Website Effortlessly – Earn from Traffic Alone', 'Are you ready to earn money from your website with minimal effort? ������ With ForeMedia.net, you can start making revenue from ad impressions alone—clicks are just a bonus!\r\n\r\nHere’s why website owners love us:\r\n✅ Instant approval for new publishers\r\n✅ Earnings from traffic, not just clicks\r\n✅ Hassle-free setup in minutes\r\n\r\n������ Register Now Her: https://foremedia.pro/omxR0  and start monetizing your traffic today!\r\n\r\nBest,\r\nThe ForeMedia Team', 0, '0', '2024-12-03 19:59:58', '2024-12-03 19:59:58', NULL),
(601, 'Tobias Corley', 'tobias.corley@outlook.com', '7077904002', 'have a query', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-12-04 09:48:52', '2024-12-04 09:48:52', NULL),
(602, 'Search Engine Index', 'roby.hye7@gmail.com', '3772558171', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-12-05 02:55:55', '2024-12-05 02:55:55', NULL),
(603, 'Sheldon', 'info@sever.bangeshop.com', '6994248911', 'Contact Us', 'Good Morning, \r\n\r\nI hope you\'re doing well. I wanted to let you know about our new BANGE backpacks and sling bags that just released.\r\n\r\nBange is perfect for students, professionals and travelers. The backpacks and sling bags feature a built-in USB charging port, making it easy to charge your devices on the go.  Also they are waterproof and anti-theft design, making it ideal for carrying your valuables.\r\n\r\nBoth bags are made of durable and high-quality materials, and are perfect for everyday use or travel.\r\n\r\nOrder yours now at 50% OFF with FREE Shipping: http://bangeshop.com\r\n\r\nBest regards,\r\n\r\nSheldon', 0, '0', '2024-12-07 10:56:51', '2024-12-07 10:56:51', NULL),
(604, 'Mike Harrison', 'mikexxxx@gmail.com', '84558344565', 'Social Ads Traffic by Country for utkalenterprises.net', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Harrison\r\n \r\nmonkeydigital.co', 0, '0', '2024-12-08 01:28:38', '2024-12-08 01:28:38', NULL),
(605, 'Denny Lebron', 'denny.lebron@outlook.com', '245074433', 'To the utkalenterprises.net Administrator!', 'Looking for the right financial solution for your business? At DAC, we offer a variety of services tailored to meet your needs—whether it’s funding, resources, or guidance.\r\n������ https://www.davidallencapital.com/kristi\r\n\r\nLet’s help your business thrive!', 0, '0', '2024-12-08 02:17:22', '2024-12-08 02:17:22', NULL),
(606, 'Latonya Sigler', 'latonya.sigler@yahoo.com', '255163033', 'Hello utkalenterprises.net Webmaster.', 'Hi utkalenterprises.net owner,\r\n\r\nI hope you’re doing well.\r\n\r\nI’m reaching out from Virgo T3. We are looking to purchase backlinks from high-quality websites like yours, and after reviewing your site, we believe there’s a great opportunity for us to collaborate.\r\n\r\nWe are willing to pay for placing a link on your website that points to one of our high-quality resources. The payment will be based on the metrics of your site, and we are happy to discuss the terms further to ensure it works for both of us.\r\n\r\nHere are the details:\r\n\r\nLink Type: Contextual Backlink, within a blog post, etc.\r\nPayment: We will compensate you based on your site\'s metrics (e.g., traffic, DA, etc.).\r\nContent: We will provide a nicely written/ High quality copyscape passed content.\r\nIf you\'re interested, please let me know, and we can discuss the details and arrange payment accordingly.\r\n\r\nLooking forward to hearing from you! Email me at virgot.3@gmail.com\r\n\r\nBest regards,\r\nSam\r\nvirgot.3@gmail.com', 0, '0', '2024-12-08 03:29:08', '2024-12-08 03:29:08', NULL),
(607, 'Rafael Lightner', 'rafael.lightner78@outlook.com', '642955148', '5 Million Instagram USA leads for DM or Cold Emailling', 'Hello,\r\n\r\nAs a digital professional, you know how difficult it is to find qualified leads. \r\nHere\'s the solution \"5 Million Instagram 2024 USA LEADS\" for only $40, using code \"LASTCHANCE\" which gives you a 60% off. \r\nThis code is valid for 3 DAYS ONLY !\r\n\r\nGet 20K FREE SAMPLE ->   https://onacadevenirfou.systeme.io/7e7d41ea  \r\n\r\nKey benefits:\r\nPrecise Keyword Filtering: Profiles can be easily filtered by keywords present in the bios, such as fitness, beauty, food, travel, etc…, directly in Excel.\r\nOutreach : You can use Our database to reach your ideal prospect via Insta DM or Cold Emailling.\r\nImportant note : This file is large, so make sure your system can handle it!\r\n \r\n\r\nBest,', 0, '0', '2024-12-08 10:34:20', '2024-12-08 10:34:20', NULL),
(608, 'Mike Lewis', 'mikexxxx@gmail.com', '83936955576', 'Boost Your SEO with Country Targeted Backlinks!', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike Lewis\r\n \r\nDgital X Flow Team', 0, '0', '2024-12-08 11:20:09', '2024-12-08 11:20:09', NULL),
(609, 'TedGex', 'axobajigufo34@gmail.com', '86472266533', 'Hallo  i am wrote about     price', 'Kaixo, zure prezioa jakin nahi nuen.', 0, '0', '2024-12-08 21:26:50', '2024-12-08 21:26:50', NULL),
(610, 'Hwa Jaques', 'morrismi1@outlook.com', '7761052858', 'Dear utkalenterprises.net Administrator!', 'My name is Ahmet. I\'m a bank staff in a Turkish bank. I\'ve been looking for someone who has the same nationality as you. A citizen of your country died in the recent earthquake in Turkey, he had in our bank fixed deposit of $11.5 million. \r\n\r\nMy Bank management is yet to know of his death. If my bank executive finds out about his death ,They would use the funds for themselves and get richer and I would like to prevent that from happening only if I get your cooperation, I knew about it because I was his account manager. Last week my bank management held a meeting for the purpose of a bank audit to note the dormant and abandoned deposit accounts.  I know this will happen and that\'s why I\'m looking for a solution to deal with this situation because if my bank discovers his death, they will divert the funds to the board of directors.  I don\'t want that to happen. \r\n \r\nI request your cooperation to introduce you as the kin/heir of the account as you are of the same nationality as him.  There is no risk;  the transaction is carried out under a legal agreement that protects you from infringement. I suggest we split the funds, 60/40 and 40 for me. I need this fund for my daughter\'s surgery so keep this info confidential. email me so i can provide you with more information. ahmetturkiye1974@outlook.com', 0, '0', '2024-12-10 09:38:44', '2024-12-10 09:38:44', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(611, 'CJ Ebanks', 'ab.cm.a.r.k.et.in.g.servi.ce.sv.psale.s@gmail.com', '1661103938', 'Support Workflows With Expert Help', 'Hi,  \r\n\r\nLooking for ways to streamline operations, enhance efficiency, and cut costs by up to 50% through outsourcing?  \r\n\r\nWe have two state-of-the-art tech centers with over 1,000 agent positions available for:  \r\n- Multi-channel Customer Support & Help Desk via voice, text, chat, and email.  \r\n- Lead Recovery: Turn abandoned e-commerce leads into new sales.  \r\n- Virtual Assistants: Support in finance, healthcare, legal, and more.  \r\n- Market Outreach: Improve lead generation, set sales appts and demos for software.  \r\n\r\nLet us take the hassle out of operations while saving you money and driving growth!  \r\n\r\nSchedule a no-obligation consultation today: https://bit.ly/abcmarketingservices  \r\n\r\nWarm regards,  \r\nC.J. Ebanks  \r\nABC Services Webpage: https://bit.ly/abccorporate \r\n1-866-904-6927 \r\n\r\n\r\n\r\n\r\n\r\n\r\nWhenever you no longer want to receive any more communications from us, feel free to visit and fill the form at https://bit.ly/removeuspls\r\nAvenida Jose Galli 1277, Araraquara, NY, USA, 14806-580', 0, '0', '2024-12-11 18:34:43', '2024-12-11 18:34:43', NULL),
(612, 'Jurgen Tancred', 'jurgen.tancred@hotmail.com', '7820159421', 'Make $10k+ a month', 'Hi! \r\n\r\nIs your website not making the sales that it should? \r\n\r\nWe build highly branded shopify stores.  \r\n\r\nBe your own boss, you want a BUSINESS, not a website only! \r\nThe best value for your money (17k happy clients) \r\nWe provide you with lifetime support! \r\n\r\n\r\nNo sales in 30 days from our system? Get a full refund \r\n\r\nCome get your shopify site built for you and dominate your market. \r\nPCX Group.com', 0, '0', '2024-12-12 09:47:04', '2024-12-12 09:47:04', NULL),
(613, 'RobertGex', 'ixutikob077@gmail.com', '82828163594', 'Hallo  i wrote about     prices', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 0, '0', '2024-12-12 16:30:29', '2024-12-12 16:30:29', NULL),
(614, 'Finn Underhill', 'finn.underhill@gmail.com', '9163312654', 'Hi utkalenterprises.net Admin!', 'Hi\r\n\r\nDo you use Google Maps for finding companies / suppliers / clients?\r\n\r\nWe grabbed all 25 million companies from google maps, including addresses, Industries, Phones, Emails, Websites, Lat/Long, many more..\r\n\r\nGet it today for $4.99 \r\n\r\nhttps://b2bdata.mysellix.io/product/all-countries\r\n\r\nStart your 2025 off with a lot of clients in the bag.\r\n\r\nOffer valid today.', 0, '0', '2024-12-13 10:03:42', '2024-12-13 10:03:42', NULL),
(615, 'Roger Prior', 'roger.prior@msn.com', '198697469', 'query', 'Transform your business reach with our ad-blasting service. For one flat rate, we send your message to millions of website contact forms. No per click costs - just pure results. Try it now!\r\n\r\n Let me know if you’d like more information—my contact info is listed below.\r\n\r\nRegards,\r\nRoger Prior\r\nEmail: Roger.Prior@morebiz.my\r\nWebsite: http://zcp6le.advertise-with-contactforms.pro\r\nConnect with me via Skype: https://join.skype.com/invite/nVcxdDgQnfhA', 0, '0', '2024-12-14 13:53:26', '2024-12-14 13:53:26', NULL),
(616, 'OliverGex', 'ibucezevuda439@gmail.com', '89949753232', 'Hi, i write about your   price for reseller', 'Γεια σου, ήθελα να μάθω την τιμή σας.', 0, '0', '2024-12-14 16:43:55', '2024-12-14 16:43:55', NULL),
(617, 'Search Engine Index', 'lampungmeiua.benito4@googlemail.com', '3991802590', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-12-15 06:21:49', '2024-12-15 06:21:49', NULL),
(618, 'Mike Morten Vincent', 'mikexxxx@gmail.com', '83384748863', 'Semrush links for utkalenterprises.net', 'Hi there \r\n \r\nHaving some bunch of links pointing to utkalenterprises.net could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Morten Vincent\r\n \r\nstrictlydigital.net', 0, '0', '2024-12-15 07:13:47', '2024-12-15 07:13:47', NULL),
(619, 'TedGex', 'moqagides18@gmail.com', '81387593235', 'Hello  i write about your   price for reseller', 'Hola, quería saber tu precio..', 0, '0', '2024-12-15 20:51:01', '2024-12-15 20:51:01', NULL),
(620, 'Joanna Riggs', 'joannariggs278@gmail.com', '592442961', 'Video Promotion for utkalenterprises.net?', 'Hi,\r\n\r\nI just visited utkalenterprises.net and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', 0, '0', '2024-12-15 23:31:07', '2024-12-15 23:31:07', NULL),
(621, 'Nora Harris', 'h.ortzste.v.en@gmail.com', '504645381', 'Get a FREE 15 minute call consultation regarding your website', 'Hello there,\r\n\r\nutkalenterprises.net stood out to me, making me think you’d find this offer compelling.\r\n\r\nImagine having these specs to optimize your performance:\r\n- 6x AMD EPYC CPU vCores\r\n- Linux, Windows-ready\r\n- 24 GB RAM\r\n- 180GB high-speed NVMe storage\r\n- Speeds reaching up to 5 Gbit/s Connectivity\r\n  ...all for just $12.50/month!\r\n\r\nOur servers, hosted in Frankfurt, are built for performance, with features such as:\r\n- KVM/ISO options & individual ISO uploads\r\n- Quick up/downgrade management through the UI\r\n- 5 restore points + 5 Backup Slots included\r\n\r\nThis deal is perfect for [specific use case, e.g., scaling applications, hosting secure databases, or running resource-intensive projects].\r\n\r\n++ Don’t miss out on this unbeatable offer—grab your high-performance server now!\r\nhttps://bit.ly/serverbest\r\n\r\n\r\n\r\n\r\n\r\nIn case you hear from us, take a moment to fill out the form at this link: https://bit.ly/delist-us', 0, '0', '2024-12-17 06:22:14', '2024-12-17 06:22:14', NULL),
(622, 'Jani Mahan', 'jani.mahan@gmail.com', '5528206698', 'inquiring', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-12-18 07:27:23', '2024-12-18 07:27:23', NULL),
(623, 'Napoleon Ulmer', 'morrismi1@outlook.com', '641884457', 'Assets/payment handler.', 'A remote job opportunity for a Law Firm, the role of a Payment/Deposit Handler. This position involves managing payments and deposits, ensuring accurate processing, and maintaining financial record. This position is only for candidates based in the US. \r\n\r\nJob location:  USA \r\nWeekly wages: $2,150 per week.\r\n\r\nWe are looking for a detail-oriented individual with a good background and no criminal record.\r\n\r\nIf you are interested in joining our team, please send an email to get more details  jasonmorris001@aol.com\r\n\r\nRegards.', 0, '0', '2024-12-18 10:06:21', '2024-12-18 10:06:21', NULL),
(624, 'LeoGex', 'ibucezevuda439@gmail.com', '83966941336', 'Hello    wrote about     price for reseller', 'Hi, I wanted to know your price.', 0, '0', '2024-12-19 03:26:58', '2024-12-19 03:26:58', NULL),
(625, 'Susan Fowles', 'susan.fowles@googlemail.com', '261981918', 'Hello utkalenterprises.net Owner.', 'Are you still looking at getting your website done/ completed? Contact e.solus@gmail.com\r\n\r\nStruggling to rank on Google? Our SEO experts can help. Contact es.olus@gmail.com', 0, '0', '2024-12-19 04:21:09', '2024-12-19 04:21:09', NULL),
(626, 'Cassandra', 'info@conforti.pawtrim.shop', '5193925260', 'Cassandra Conforti', 'Hi there \r\n \r\nIs your dog\'s nails getting too long? If you\'re tired of going to the vet or groomer to get them trimmed, why not try PawSafer™? \r\nWith PawSafer™, you can trim your dog\'s nails from the comfort of your own home, and it only takes a few minutes!\r\n\r\nPawSafer™ is the safest and most convenient way to trim your dog\'s nails, and it\'s very affordable. \r\n\r\nGet it while it\'s still 50% OFF + FREE Shipping\r\n\r\nBuy here: https://pawtrim.shop\r\n \r\nThe Best, \r\n \r\nCassandra', 0, '0', '2024-12-19 04:21:42', '2024-12-19 04:21:42', NULL),
(627, 'Markus Witt', 'markus.witt@googlemail.com', '632650041', 'Dear utkalenterprises.net Administrator!', 'We improve MOZ  Domain authority 30+ in 15 Days its help to improve google rank, improve your website SEO, and you get traffic from google \r\n\r\nDA - 0 to 30 - (Only $29) - Yes, Limited time !!\r\n\r\n>> 100% Guarantee \r\n>> Improve Ranking \r\n>> White Hat Process \r\n>> Permanent Work\r\n>> 100% Manual Work \r\n>> 0% Spam score increase \r\n\r\n\r\n⚡ From our work your website keyword get rank on google and get organic traffic from google through keywords\r\n\r\nContact now: intrug@gmail.com', 0, '0', '2024-12-20 11:22:49', '2024-12-20 11:22:49', NULL),
(628, 'NARETGR4853549NERTYTRY', 'charlesrago1927@estabamail.com', '83939198844', 'TOTYJTRT4853549TIGFNMYUM', 'MERTYHR4853549MARTHHDF', 0, '0', '2024-12-20 15:30:22', '2024-12-20 15:30:22', NULL),
(629, 'Winston', 'redfordwinston54@gmail.com', '1-319-435-1790‬', 'Could we talk soon?', 'Happy holidays from Iowa, Winston here.  I\'m always watching to see what newer sites are going up and I just wanted to see if you would like an extra hand with getting some targeted traffic, Create custom AI bots to answer questions from visitors on your site or walk them through a sales process/funnel - I could even make a persona of yourself or employee to field questions about your business. I create/edit videos/images/adcopy, create/revamp/update sites, remove negative listings, the list goes on.  I\'ll even shoulder 90% of the costs, dedicating my time and tools that I\'ve created myself and bought over the years.  I\'ve been doing this for over 22 years, helped thousands of people and have loved every minute of it.\r\n\r\nThere\'s virtually no cost on my end to do any of this for you except for my time starting at 99 a month. I don\'t mean to impose; I was just curious if I could lend a hand.  \r\n\r\nBrief history, I\'ve been working from home for a couple decades now and I love helping others.  I\'m married, have three girls and if I can provide for them by helping you and giving back by using the tools and knowledge I\'ve built and learned over the years, I can\'t think of a better win-win.\r\n\r\nIt amazes me that no one else is helping others quite like I do and I\'d love to show you how I can help out.  So, if you need any extra help in any way, please let me know either way as I value your time and don\'t want to pester you.\r\n\r\nPS – If I didn’t mention something you might need help with just ask, I only mentioned a handful of things to keep this brief :-)\r\n\r\n\r\nAll the best,\r\n\r\nWinston\r\nCell - 1-319-435-1790‬\r\nMy Site (w/Live Chat) - https://cutt.ly/bec4xzTQ', 0, '0', '2024-12-20 17:16:59', '2024-12-20 17:16:59', NULL),
(630, 'Katelyn Raiden', 'katelynraiden@gmail.com', '7833322469', 'Youtube Promotion: Grow your subscribers by 700 each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nKatelyn', 0, '0', '2024-12-20 17:56:53', '2024-12-20 17:56:53', NULL),
(631, 'JohnGex', 'arikerer278@gmail.com', '85733526779', 'Hi    writing about your   prices', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2024-12-21 02:05:06', '2024-12-21 02:05:06', NULL),
(632, 'HenryGex', 'ebojajuje04@gmail.com', '83679162416', 'Hallo, i write about your   price for reseller', 'Hi, ego volo scire vestri pretium.', 0, '0', '2024-12-21 05:46:20', '2024-12-21 05:46:20', NULL),
(633, 'Trent Bunny', 'trent.bunny77@gmail.com', '6922612904', 'seeking information', 'Don\'t miss out—boost your website traffic with real PPV visitors today! Spots are limited, so act fast to grow your audience before it\'s too late!  \r\nSee how it works: http://realhumanwebtraffic.top', 0, '0', '2024-12-21 09:01:15', '2024-12-21 09:01:15', NULL),
(634, 'Gay Nickle', 'gay.nickle@yahoo.com', '6233309341', 'Hey utkalenterprises.net, Quick Notiice', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', 0, '0', '2024-12-21 12:16:47', '2024-12-21 12:16:47', NULL),
(635, 'Mike Sander Lambert', 'mikexxxx@gmail.com', '82455539846', 'Unlock Your utkalenterprises.net Potential with a Free SEO Score Check', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Sander Lambert\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', 0, '0', '2024-12-21 20:01:53', '2024-12-21 20:01:53', NULL),
(636, 'Viola Jacquez', 'jacquez.viola@gmail.com', '40637808', 'Supercharge Your Online Presence with Mintsuite – Limited Time Offer!', 'Hi there,\r\n\r\nWe’re excited to introduce Mintsuite, the ultimate platform to enhance your online presence and drive results. Mintsuite empowers you to create stunning websites, manage social media like a pro, and generate traffic effortlessly.\r\n\r\nCreate Stunning Websites\r\nManage Social Media Effortlessly\r\nGenerate Unlimited Traffic\r\n\r\nGrab Mintsuite now for just $16 (normally $197)!\r\n\r\nCheck out the amazing features of Mintsuite here: https://furtherinfo.info/mint\r\n\r\nThanks for your time,\r\nViola', 0, '0', '2024-12-22 03:38:25', '2024-12-22 03:38:25', NULL),
(637, 'Sean Haenke', 'haenke.sean@googlemail.com', '7820923141', 'question for you', 'USA businesses: Did you process Visa/Mastercard payments from 2004 to 2019? If yes, you could be eligible for a portion of a $5.54 billion settlement.\r\nThe filing deadline is February 4, 2025. Don’t leave money on the table!\r\nVisit http://cardsettlement.top to claim your share.', 0, '0', '2024-12-23 02:57:43', '2024-12-23 02:57:43', NULL),
(638, 'Caleb Cortez', 'mcalister.jasmin@gmail.com', '9371346200', 'Send Your Brand to 100M Websites – Starting at $22', '<h1>Contact Form Bulk Submissions</h1>\r\n\r\n<b>Just like as you got this message, we can submit your message to millions of contact forms.</b>\r\n\r\n  \r\n    Need cost-effective <b>lead generation?</b> \r\n    We specialize in <i>delivering</i> messages directly through <b>business</b> contact forms, ensuring your message <i>lands in</i> the right inboxes.\r\n  \r\n\r\n  <ul>\r\n    <li>Begin reaching <b>100M</b> potential customers today, all starting from just <b>$22!</b></li>\r\n    <li>We’ll send your message to connect with <b>millions of</b> website owners/managers, that is your potential customers, driving high-value traffic and prospects to your site.</li>\r\n    <li>Our solution ensures your message is delivered <i>right to the source</i>, starting at just <b>$22.</b></li>\r\n  </ul>\r\n\r\n  <b>Let’s strengthen brand recognition together!</b>\r\n\r\n  Looking for more brand <i>visibility?</i>\r\n\r\n  \r\n    <table border=\"1\" cellpadding=\"5\">\r\n      <tr>\r\n        <th>Feature</th>\r\n        <th>Benefit</th>\r\n      </tr>\r\n      <tr>\r\n        <td>Contact Form Outreach</td>\r\n        <td>Ensures your message sends to website owners and key players.</td>\r\n      </tr>\r\n      <tr>\r\n        <td>Pricing</td>\r\n        <td>Starting from just <b>$22.</b></td>\r\n      </tr>\r\n    </table>\r\n  \r\n\r\n  ++++ <b>Check out:</b> https://bit.ly/bulkcontactforms\r\n  \r\n<img src=\"https://bit.ly/cfleads-image\" alt=\"Bulk Form Submissions\" style=\"width: 400px; height: auto;\">\r\n\r\n\r\n<img src=\"https://bit.ly/cfleadsimage\" alt=\"\" style=\"display:none;\" width=\"3\" height=\"2\">\r\n\r\n\r\n\r\n\r\n\r\n\r\nIf you no longer want to receive additional notifications from our side, just <b>visit</b> <a href=\"https://bit.ly/removethissite\" target=\"_blank\">the link here </a>', 0, '0', '2024-12-23 05:11:01', '2024-12-23 05:11:01', NULL),
(639, 'RobertGex', 'ixutikob077@gmail.com', '87165919761', 'Aloha, i am write about your   price', 'Ողջույն, ես ուզում էի իմանալ ձեր գինը.', 0, '0', '2024-12-23 17:04:56', '2024-12-23 17:04:56', NULL),
(640, 'Mike Mark Nilsen', 'mikexxxx@gmail.com', '87229147426', 'Collaboration Request', 'Hello, \r\n \r\nThis is Mike Alsopp\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Mark Nilsen\r\n \r\nmonkeydigital.co', 0, '0', '2024-12-23 18:48:30', '2024-12-23 18:48:30', NULL),
(641, 'Summer Forest', 'summer.forest@gmail.com', '143200054', 'Android app for utkalenterprises.net', 'Want a mobile App for utkalenterprises.net for $15?\r\n\r\nCome join checkout our Christmas special and get your App now\r\n\r\nhttps://zundee.click/?affid=affiliateking&url=utkalenterprises.net', 0, '0', '2024-12-23 20:31:43', '2024-12-23 20:31:43', NULL),
(642, 'Bryce Costa', 'bryce.costa@gmail.com', '2505746754', 'quick question', 'Don’t Let Upfront Costs Drive Clients Away. Are you losing business because clients can’t afford the upfront costs? Without flexible financing options, you risk losing valuable opportunities. Let Client Financing and Credee help you secure more clients by making your services more affordable and accessible.\r\n\r\nDon’t miss out—act now before your competitors do!\r\n������ Unlock these advantages:\r\n\r\nMore client approvals\r\nFaster decision-making\r\nA seamless process for you and your clients\r\n������ Get started:\r\n\r\nhttp://9gd696.credeefastapproval.top\r\nhttp://n23mj6.clientfinancing-quickapproval.top', 0, '0', '2024-12-25 05:40:50', '2024-12-25 05:40:50', NULL),
(643, 'Search Engine Index', 'mckinney.jason@outlook.com', '524784197', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2024-12-25 07:18:43', '2024-12-25 07:18:43', NULL),
(644, 'Terry Kent', 'kent.terry@yahoo.com', '890657683', 'From Someday to Success', 'Do you have a project you’ve been dreaming of completing for years? A book you want to write or publish? A business you’re ready to start or grow? Imagine having your own dedicated team to help you get it across the finish line.\r\nAt WCD Marketing, we offer Accountability Coaching designed to turn your ideas into achievements. From “someday” to “success.”  We know how easy it is for goals to stall when life gets busy, and that’s why we’re here to keep you focused, motivated, and moving forward.\r\nWhether it’s a creative project, a business venture, or a personal milestone, our proven strategies and expert guidance will help you overcome obstacles, stay on track, and achieve the success you’ve envisioned. We don’t just set goals; we make them happen—together.\r\nDon’t let another year pass with your dreams on hold. Contact us today and take the first step toward making your vision a reality.  Contact me at wilene@wcdenterprises.com or WCD Marketing and let’s start your journey to success.\r\nYour breakthrough is waiting—let’s make it happen!\r\n\r\n----------------\r\nHere is the link to the form\r\nhttps://wcdmarketing.com/contact/', 0, '0', '2024-12-25 09:05:48', '2024-12-25 09:05:48', NULL),
(645, 'FreyaGex', 'yawiviseya67@gmail.com', '85262844542', 'Aloha, i write about   the price', 'হাই, আমি আপনার মূল্য জানতে চেয়েছিলাম.', 0, '0', '2024-12-25 12:21:34', '2024-12-25 12:21:34', NULL),
(646, 'unetueds', 'exc2svi4@hotmail.com', '89869398161', 'Your account will be closed in 24 hours', 'Your account has been dormant for 364 days. To avoid deletion and claim your balance, please sign in and request a payout within 24 hours. For assistance, visit our Telegram group: https://t.me/s/attention567563', 0, '0', '2024-12-26 04:36:33', '2024-12-26 04:36:33', NULL),
(647, 'Christopher Patton', 'christopher.patton@gmail.com', '893896572', 'To the utkalenterprises.net Administrator.', 'Hi,\r\n\r\nAt Cloud Animations, we specialize in high-quality 2D/3D animation, CGI/VFX, and motion graphics.\r\nWith 60+ experts and advanced tech-driven animation, we deliver faster turnarounds and exceptional results for today\'s and tomorrow\'s brands.\r\n\r\nFrom explainer videos to architectural visualization, motion graphics, anime, and 3D animation, we redefine narratives with groundbreaking results.\r\n\r\nLet’s collaborate and hit the home run!\r\n\r\nmike@cloudanimations.com\r\n(332) 208-1772', 0, '0', '2024-12-26 12:19:48', '2024-12-26 12:19:48', NULL),
(648, 'Tera Mackay', 'tera.mackay@outlook.com', '9441220326', 'Dear utkalenterprises.net Admin!', 'Struggling to rank on Google? Our high-quality backlink services will push your site to the top. Trusted by businesses worldwide! Start now and watch your traffic soar! \r\n\r\nWe Create 1200 Backlinks for you in Just $12\r\n\r\n> Boost Google Ranking\r\nGet HIGH-QUALITY backlinks for any website\r\nBacklink works for GMB, MAP, Youtube Videos ALSO\r\nBacklinks from Blogs, Wiki Articles, Social BookMarking etc\r\nReport within 10 days\r\n\r\nBoost Your Website Visitor And REVENUE\r\n\r\nContact us at intrug@gmail.com', 0, '0', '2024-12-27 23:43:13', '2024-12-27 23:43:13', NULL),
(649, 'Lydia Sun', 'sun.lydia@hotmail.com', '628331913', 'i have a question', 'Hey there, I apologize for using your contact form, but I wasn\'t sure who the right person was to speak with in your company.\r\n\r\nI want to ask you if you\'re interested in buying/renting Google Ads accounts with free spending ads credit limit of 10k monthly on each account ($329 daily budget & $120k a year of free ppc ads spend limit) for a very cheap price starting at $500-$1000? It works for all types of Google Ads policy niches like E-Commerce stores, affiliate marketing, dropshipping ads, lead generation, etc... in the search ads placement (website traffic or call leads). The best Google Ads placement feature to easily boost your online digital presence and business.\r\n \r\n\r\nLet\'s connect on FB and check out my recent post: http://fbpost2024.xyz   \r\n\r\nWant more info: http://ad-accounts2024.xyz\r\n\r\nIf you\'re interested or have any questions private email me at 1800ivanr@gmail.com \r\n\r\nLearn more about me -  http://successwithivan.xyz\r\n\r\nSubscribe to my YouTube channel: http://yt-ivanramirez.xyz\r\n\r\n\r\nThanks & Regards,\r\nIvan Ramirez', 0, '0', '2024-12-28 05:52:48', '2024-12-28 05:52:48', NULL),
(650, 'AndrewHef', 'roc420247@gmail.com', '82961937928', 'URGENT! CLAIM YOUR $179,465.27 CASH REWARD NOW', 'Hello. \r\nRepeat notification. \r\nDecember 25, 2024 - you won $179,465.27. \r\nClaim your winnings of $179,465.27 urgently before December 31 inclusive: https://script.google.com/macros/s/AKfycbwccAiOucXcmBZOWm_8ochjX1UYueamnI5C4xFInK6W-JkrTIgPDvnRwHUmlR4vymQJ9Q/exec \r\nThis amount will expire on January 1. \r\nUnfortunately, this is part of our rules for paying out winnings.', 0, '0', '2024-12-28 05:58:06', '2024-12-28 05:58:06', NULL),
(651, 'AndrewHef', 'roc420247@gmail.com', '85151392344', 'URGENT! CLAIM YOUR $179,465.27 CASH REWARD NOW', 'Hello. \r\nRepeat notification. \r\nDecember 25, 2024 - you won $179,465.27. \r\nClaim your winnings of $179,465.27 urgently before December 31 inclusive: https://script.google.com/macros/s/AKfycbwccAiOucXcmBZOWm_8ochjX1UYueamnI5C4xFInK6W-JkrTIgPDvnRwHUmlR4vymQJ9Q/exec \r\nThis amount will expire on January 1. \r\nUnfortunately, this is part of our rules for paying out winnings.', 0, '0', '2024-12-28 05:58:09', '2024-12-28 05:58:09', NULL),
(652, 'AndrewHef', 'roc420247@gmail.com', '85285883273', 'URGENT! CLAIM YOUR $179,465.27 CASH REWARD NOW', 'Hello. \r\nRepeat notification. \r\nDecember 25, 2024 - you won $179,465.27. \r\nClaim your winnings of $179,465.27 urgently before December 31 inclusive: https://script.google.com/macros/s/AKfycbwccAiOucXcmBZOWm_8ochjX1UYueamnI5C4xFInK6W-JkrTIgPDvnRwHUmlR4vymQJ9Q/exec \r\nThis amount will expire on January 1. \r\nUnfortunately, this is part of our rules for paying out winnings.', 0, '0', '2024-12-28 05:58:11', '2024-12-28 05:58:11', NULL),
(653, 'AndrewHef', 'roc420247@gmail.com', '89148527965', 'URGENT! CLAIM YOUR $179,465.27 CASH REWARD NOW', 'Hello. \r\nRepeat notification. \r\nDecember 25, 2024 - you won $179,465.27. \r\nClaim your winnings of $179,465.27 urgently before December 31 inclusive: https://script.google.com/macros/s/AKfycbwccAiOucXcmBZOWm_8ochjX1UYueamnI5C4xFInK6W-JkrTIgPDvnRwHUmlR4vymQJ9Q/exec \r\nThis amount will expire on January 1. \r\nUnfortunately, this is part of our rules for paying out winnings.', 0, '0', '2024-12-28 05:58:14', '2024-12-28 05:58:14', NULL),
(654, 'AndrewHef', 'roc420247@gmail.com', '89984624899', 'URGENT! CLAIM YOUR $179,465.27 CASH REWARD NOW', 'Hello. \r\nRepeat notification. \r\nDecember 25, 2024 - you won $179,465.27. \r\nClaim your winnings of $179,465.27 urgently before December 31 inclusive: https://script.google.com/macros/s/AKfycbwccAiOucXcmBZOWm_8ochjX1UYueamnI5C4xFInK6W-JkrTIgPDvnRwHUmlR4vymQJ9Q/exec \r\nThis amount will expire on January 1. \r\nUnfortunately, this is part of our rules for paying out winnings.', 0, '0', '2024-12-28 05:58:16', '2024-12-28 05:58:16', NULL),
(655, 'Mike Helmuth Smith', 'info@professionalseocleanup.com', '86663584719', 'Improve your website`s ranks totally free', 'Improve your website`s ranks totally free \r\n \r\nMessage: \r\nHi there, \r\n \r\nWhile checking your utkalenterprises.net for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMike Helmuth Smith\r\n \r\nWhatsapp: https://www.professionalseocleanup.com/whatsapp/ \r\nEmail us: info@professionalseocleanup.com', 0, '0', '2024-12-28 12:31:48', '2024-12-28 12:31:48', NULL),
(656, 'Rodrick Trouette', 'trouette.rodrick@outlook.com', 'H kyku', 'question', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2024-12-29 04:18:00', '2024-12-29 04:18:00', NULL),
(657, 'Kellee Dodds', 'dodds.kellee14@gmail.com', '3205372348', 'inquiring', 'Are you tired of expensive and ineffective marketing strategies? Our service sends your ad text to millions of website contact forms at a flat rate. No extra costs. Your message will be read and noticed.\r\n\r\n Reach out to me below if you want more details on how I make this happen.\r\n\r\nRegards,\r\nKellee Dodds\r\nEmail: Kellee.Dodds@uniqueadvertising.pro\r\nWebsite: http://jwdaf4.marketing-with-contactforms.top', 0, '0', '2024-12-29 05:58:08', '2024-12-29 05:58:08', NULL),
(658, 'OliverGex', 'ibucezevuda439@gmail.com', '87443911583', 'Hi  i am writing about     price', 'Salut, ech wollt Äre Präis wëssen.', 0, '0', '2024-12-29 09:06:08', '2024-12-29 09:06:08', NULL),
(659, 'RobertGex', 'ixutikob077@gmail.com', '81734381231', 'Hello    write about your   prices', 'Прывітанне, я хацеў даведацца Ваш прайс.', 0, '0', '2024-12-30 17:28:45', '2024-12-30 17:28:45', NULL),
(660, 'Cameron Aunger', 'cameron.aunger@gmail.com', '181960966', 'Hi utkalenterprises.net Administrator!', 'Would you like this New Year to be the year you let go of your hurtful past?  Make the resolution to make the change to become your Best Self.\r\n\r\n     Have you heard of Se-REM? (Self effective - Rapid Eye Movement). Many people don\'t know that REM brain activity dramatically improves the processing of traumatic emotion. It creates peace and empowers the listener. Se-REM is an advanced version of EMDR therapy. It is more powerful because it combines elements of 6 different therapies, EMDR, hypnosis, mindfulness, Gestalt child within work, music therapy, and Awe therapy,(connecting profoundly with nature).\r\n     It has helped thousands of people overcome PTSD, and anxiety. But it is also helpful in a great many situations, any experience that has been traumatic.  Se-REM\'s mission statement is \"Trauma relief at as close to free as possible\". This not-for-profit program downloads to a smart phone or computer and can be used at home.         \r\n      Read and download at: https://Se-REM.com.   Once you own the program, you are encouraged to give it away to others who will benefit. \r\nhttps://Se-REM.com  is in use in 33 countries.', 0, '0', '2024-12-31 06:44:14', '2024-12-31 06:44:14', NULL),
(661, 'unetueds', 'yjmdw64r@yahoo.com', '88988879975', 'Your will be deleted in 1 day', 'Your account has been inactive for 364 days. To avoid deletion and retrieve your funds, please log in and request a withdrawal within 24 hours. For assistance, join our Telegram group: https://t.me/s/attention678671', 0, '0', '2024-12-31 23:54:02', '2024-12-31 23:54:02', NULL),
(662, 'Jeff Bailey', 'avitayoga17@gmail.com', '210791699', 'How’s arthritis treating you this month?', 'Hello there, Jeff here from Boulder.  I think a lot about joint pain and how to solve it - but who doesn’t? Whether it\'s from old injuries or the prevailing effects of time and gravity, most deal with rigidity and arthritis at some point. It’s tough to avoid, and if you are like me, you’ve tried many remedies. \r\n\r\nTwelve years ago, at the age of 48, I had a severe hip injury that challenged everything. I was good at following orders and doing my PT, but nothing helped! It got worse. Doctors told me it would be a matter of years before I needed a hip replacement. \r\n\r\nI remember praying sincerely for a better way, and I believe the heart\'s prayer is always answered - the trick is recognizing it. :)\r\n\r\nA promising way out of discomfort and arthritis was given to me, and as I started benefiting, I wanted only to share it with others. \r\n\r\nIt’s not a pill. It’s not exercise. It’s not complicated. It’s so simple that you might wonder why you never thought of it.\r\n\r\nJoints love pressure - the right kind, of course. A few minutes of steady compression and release keep them healthy and mobile. Have you ever noticed how cats, dogs, horses, and other quadrupeds rest? Look at their legs and imagine the body weight impacting their bones and joints. \r\n\r\nWe humans can take a similar, slow, thoughtful approach to cleanse our joints and resolve pain. It works! But it’s not so much what you do, but how you do it. At first, it seems a little weird, but as the results come, you’ll start to enjoy it. \r\n\r\nIt’s a way to make joints healthy and strong without strain or intensity. It’s all about slow, mindful movement that helps your body heal from the inside out. It’s not exercise in the traditional sense - no sweating or heavy breathing - just a gentle, consistent practice that’s made a difference for me.\r\n\r\nWhat’s cool is that you don’t have to spend hours each day doing this. Just a little time, a few times a week, and you can start seeing and feeling the difference. I’ve seen it work wonders, even for people in their 70s and 80s.\r\n\r\nHave you ever tried something like this for your joints? I’d love to chat and share what’s been working for me.\r\n\r\nI’m here to help,\r\n\r\nJeff Bailey\r\nAVITA Founder, Teacher\r\nhttps://cutt.ly/jeNtHFqX', 0, '0', '2025-01-01 04:51:13', '2025-01-01 04:51:13', NULL),
(663, 'Louisa', 'info@borovansky.medicopostura.com', '3647166206', 'Louisa Borovansky', 'Hi \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nEnjoy, \r\n\r\nLouisa', 0, '0', '2025-01-01 09:17:42', '2025-01-01 09:17:42', NULL),
(664, 'RobertGex', 'ixutikob077@gmail.com', '81181259136', 'Hi, i am write about your the price', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2025-01-03 15:58:13', '2025-01-03 15:58:13', NULL),
(665, 'Lorri Herlitz', 'lorri.herlitz@gmail.com', '3583804431', 'Hi utkalenterprises.net Owner!', 'Hi,\r\n\r\nI am a senior web developer, highly skilled and with 10+ years of collective web design and development experience, I work in one of the best web development company.\r\n\r\n\r\nMy hourly rate is $8\r\n\r\n\r\nMy expertise includes: \r\n\r\nWebsite design - custom mockups and template designs \r\nWebsite design and development - theme development, backend customisation \r\nResponsive website - on all screen sizes and devices \r\nPlugins and Extensions Development \r\nWebsite speed optimisation and SEO on-page optimisation \r\nWebsite security \r\nWebsite migration, support and maintenance \r\nIf you have a question or requirement to discuss, I would love to help and further discuss it. Please email me at e.solus@gmail.com\r\n\r\n\r\nRegards, \r\nSachin\r\ne.solus@gmail.com', 0, '0', '2025-01-03 22:15:42', '2025-01-03 22:15:42', NULL),
(666, 'TedGex', 'moqagides18@gmail.com', '89473287281', 'Hallo, i writing about your the prices', 'Aloha, makemake wau eʻike i kāu kumukūʻai.', 0, '0', '2025-01-04 06:00:51', '2025-01-04 06:00:51', NULL),
(667, 'Mike Richard Lefevre', 'mike@monkeydigital.co', '87727685495', 'Social Ads Traffic by Country for utkalenterprises.net', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Richard Lefevre\r\n \r\nmonkeydigital.co', 0, '0', '2025-01-04 07:40:20', '2025-01-04 07:40:20', NULL),
(668, 'MichealClape', 'raymondrobe@gmail.com', '81995121814', 'Your emails will be delivered without fail.', 'Hi! utkalenterprises.net \r\n \r\nDid you know that it is possible to send proposals absolutely legitimately? \r\nWhen such business offers are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals safely and securely. Messages sent via Communication Forms are least likely to be flagged as spam, since they are viewed as highly significant. \r\nYou can use our service with no cost to you. \r\nWe shall send up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis message was automatically generated. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\nWe only use chat for communication.', 0, '0', '2025-01-05 08:52:17', '2025-01-05 08:52:17', NULL),
(669, 'Mike Enzo Bernard', 'mikexxxx@gmail.com', '89965284562', 'Boost Your SEO with Country Targeted Backlinks!', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike Enzo Bernard\r\n \r\nDgital X Flow Team', 0, '0', '2025-01-05 12:25:14', '2025-01-05 12:25:14', NULL),
(670, 'LeoGex', 'ibucezevuda439@gmail.com', '89866516175', 'Hi    write about your   price for reseller', 'Zdravo, htio sam znati vašu cijenu.', 0, '0', '2025-01-05 17:40:36', '2025-01-05 17:40:36', NULL),
(671, 'Search Engine Index', 'bright.winona@outlook.com', '353197173', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2025-01-06 05:19:23', '2025-01-06 05:19:23', NULL),
(672, 'Lucienne Sterling', 'morrismi1@outlook.com', '3953546574', 'Payment/deposits handler.', 'A remote job opportunity for a Law Firm, the role of a Payment/Deposit Handler. This position involves managing payments and deposits, ensuring accurate processing, and maintaining financial record. This position is only for candidates based in the US. \r\n\r\nJob location:  USA \r\nWeekly wages: $2,150 per week.\r\n\r\nWe are looking for a detail-oriented individual with a good background and no criminal record.\r\n\r\nIf you are interested in joining our team, please send an email to get more details    jasonmorris001@aol.com\r\n\r\nRegards.', 0, '0', '2025-01-06 23:37:49', '2025-01-06 23:37:49', NULL),
(673, 'Hannah Ward', 'i.s.lndsa.les@googlemail.com', '7346572036', 'Glide into the next chapter of water recreation.', 'Excited about a new, eco-friendly adventure on the water? Our Inflatable Cruising Island, launching on crowdsourcing platforms this February, is your pass to zero-emission fun. It’s beyond a floating island—it’s a jump into the next generation of water recreation, driven by clean, solar energy.\r\n\r\nCheck it out: https://bit.ly/inflatable-island\r\n\r\nHere’s what distinguishes our Inflatable Floating Islands unique: \r\n- Motor-ready design with a mount for electric motors \r\n- Overhead solar panel charging system for ongoing, clean power \r\n- Built-in canopy for cooling and ease \r\n- Padded seating and accessible cup holders \r\n- Durable, puncture-tough construction \r\n\r\nEager to experience the next level of water recreation? Visit https://bit.ly/inflatable-island and send us an email to get notified about our crowdfunding campaign this February. Sign up for our mailing list today for limited early bird rewards and be among the first to experience this new wave of sustainable water fun!\r\n\r\n\r\n\r\nIn case you wish to stop to receive notifications from me in the future, kindly send a reply to this email with the phrase: “No thanks”.', 0, '0', '2025-01-07 01:08:57', '2025-01-07 01:08:57', NULL),
(674, 'Jackson Zimmerman', 'd.osbornele.n.ds2.02.5@gmail.com', '4101400113', 'Fast Approvals – Funding Up to $5M Available!', 'Hi there,\r\n\r\nAre you looking for ways to access more working capital or flexible funding options?\r\n\r\nOur expertise lies in delivering quick, straightforward funding solutions customized for your business.\r\n\r\nExplore our tailored funding options:\r\n - Lines of Credit and Term Loans to handle expenses and drive growth.\r\n - SBA and Working Capital Loans for seamless operations.\r\n - Commercial and Equipment Financing to facilitate necessary upgrades.\r\n - Flexible Merchant Cash Advances that adapt to your revenue.\r\n\r\nWhy Work with Us?\r\n - Simple Application Process: A one-page form gets you started.\r\n - Fast Funding: Approvals in as little as 24 hours, with up to $5 million available.\r\n - Business-Centered Requirements: Forget the FICO score—what matters is your performance.\r\n\r\nBasic Eligibility Requirements:\r\n - Your business should be at least 6 months old.\r\n - Business checking account.\r\n - A minimum monthly revenue of $5,000.\r\n\r\nReady to explore how we can support your business goals? \r\nVisit https://bit.ly/BLNFunding or contact us to start now.\r\n\r\n\r\n\r\n\r\n\r\nIf at any point you decide not to hear from us with emails from us, just reply to this communication with the words \"No Thank You\".\r\nChausseestr. 92, Hornell, NY, USA, 25421', 0, '0', '2025-01-07 17:01:03', '2025-01-07 17:01:03', NULL),
(675, 'Martina Courtice', 'martina.courtice@googlemail.com', '89433151', 'inquiry', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2025-01-08 03:35:38', '2025-01-08 03:35:38', NULL),
(676, 'Casie Heard', 'casie.heard@googlemail.com', '9099680291', 'need assistance', 'Don’t Let High Upfront Costs Cost You Clients\r\nEvery time a client hesitates because of upfront costs, you’re losing potential revenue. Without offering flexible financing, you risk watching your competitors gain the business you deserve. With Client Financing and Credee, you can turn hesitant prospects into committed clients and avoid losing out on valuable opportunities.\r\n\r\nTake action now before you lose more business!\r\n\r\n✅ Key Features:\r\n\r\nFlexible plans for clients\r\nIncreased conversions\r\nStress-free financing management\r\n������ Explore now:\r\n\r\nhttp://xuv2n8.credeefastapproval.top\r\nhttp://h6bctw.clientfinancing-quickapproval.top', 0, '0', '2025-01-08 05:31:32', '2025-01-08 05:31:32', NULL),
(677, 'Claudine Salinas', 'info@globalwidepr.com', '12345678', 'Be Showcased: No-Cost Digital Journal Offer', 'Hi,  \r\n\r\nWant to elevate your brand to the next level?  \r\n\r\nWith Global Wide PR, we specialize in helping businesses like yours get featured on influential platforms.  \r\n\r\nGetting featured boosts trust, draws new customers, and ensures your brand stays ahead of the competition.  \r\n\r\nCurrently, we’re giving away a free feature on Digital Journal to demonstrate the value of professional media exposure.  \r\n\r\nThink about showcasing an “As Seen On” badge on your site—it’s a tested strategy for increasing trust and driving sales.  \r\n\r\nIf this opportunity sounds right for you, just reply with \"FREEPR\" and I’ll explain how to get started.  \r\n\r\nLooking forward to helping your business grow!  \r\n\r\nBest regards,  \r\nClaudine \r\nGlobal Wide PR\r\n\r\n\r\nIf you prefer not to get further updates from us, you can do so easily. Just visit https://bit.ly/unsub-us and provide your website information.', 0, '0', '2025-01-08 22:40:45', '2025-01-08 22:40:45', NULL),
(678, 'FreyaGex', 'yawiviseya67@gmail.com', '85518413771', 'Aloha,   wrote about     prices', 'Hej, jeg ønskede at kende din pris.', 0, '0', '2025-01-09 06:11:01', '2025-01-09 06:11:01', NULL),
(679, 'Nelson Sargent', 'nelson.sargent@gmail.com', '1469389329', 'Hello utkalenterprises.net Webmaster!', 'Hey from Zundee!\r\n\r\nHappy new year to you!\r\n\r\nWe have made all our databases / client lists available to companies. \r\n\r\nCompanies, People, Job Titles, Phones, Emails, you name it!\r\n\r\nVisit us: https://zundee.click', 0, '0', '2025-01-09 13:35:54', '2025-01-09 13:35:54', NULL),
(680, 'RobertGex', 'ixutikob077@gmail.com', '87318218631', 'Hallo  i am wrote about     price for reseller', 'Прывітанне, я хацеў даведацца Ваш прайс.', 0, '0', '2025-01-09 21:21:26', '2025-01-09 21:21:26', NULL),
(681, 'Guitaricet', 'investor.relations@liminal-capital.com', '85156929751', 'Personalized Contact Data Extraction from Google Maps', 'Success starts with accurate information! Order data extraction and enhance your chances of growth. https://telegra.ph/Personalized-Contact-Data-Extraction-from-Google-Maps-10-03 (or telegram: @chamerion)', 0, '0', '2025-01-10 08:57:01', '2025-01-10 08:57:01', NULL),
(682, 'Karolin Bramlett', 'bramlett.karolin76@gmail.com', '5092519160', 'wondering', 'Want to get your message in front of millions of potential customers? Our service can help. By sending your ad text to website contact forms, your message will be read just like you\'re reading this one. And with one flat rate, you can reach a massive audience without any per click costs. Start growing your business today.\r\n\r\n Contact me at the details below if you’d like to explore this further.\r\n\r\nRegards,\r\nKarolin Bramlett\r\nEmail: Karolin.Bramlett@uniqueadvertising.pro\r\nWebsite: http://vyjk94.advertiseviaforms.my', 0, '0', '2025-01-10 18:00:25', '2025-01-10 18:00:25', NULL),
(683, 'Mike Filip Janssens', 'mikexxxx@gmail.com', '81588734367', 'Semrush links for utkalenterprises.net', 'Hi there \r\n \r\nHaving some bunch of links pointing to utkalenterprises.net could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Filip Janssens\r\n \r\nstrictlydigital.net', 0, '0', '2025-01-11 00:55:55', '2025-01-11 00:55:55', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(684, 'Ellen Smith', 'rose.osmond@gmail.com', '(332) 222-4058', 'Dear utkalenterprises.net Webmaster.', 'Impact Explainers specializes in high-quality 2D/3D animation, CGI/VFX, and motion graphics. With a team of 60+ experts and cutting-edge technology, we deliver exceptional results and fast turnarounds. \r\nUse animation to enhance sales, marketing, business intros, product mock-ups, YouTube videos, social media ads, or demo videos. Whether it’s architectural visualization, motion graphics, anime, or explainer videos, we bring your ideas to life with groundbreaking results. \r\n\r\nExplore our portfolio or chat with us at www.impactexplainer.com. You can also email us at ellen@impactexplainer.com or call (332) 222-4058. Let’s create something amazing together!\r\n\r\nEllen Smith\r\nellen@impactexplainer.com\r\n(332) 222-4058', 0, '0', '2025-01-11 04:50:47', '2025-01-11 04:50:47', NULL),
(685, 'Delmar Baugh', 'delmar.baugh@gmail.com', '6628038670', 'i have a question', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2025-01-13 09:23:37', '2025-01-13 09:23:37', NULL),
(686, 'unetueds', 's8u725mb@gmail.com', '89228918385', 'Your will be closed in 1 day', 'Your account has been dormant for 364 days. To prevent removal and retrieve your funds, please log in and initiate a payout within 24 hours. For support, visit our Telegram group: https://tinyurl.com/2cfdzl7m', 0, '0', '2025-01-13 21:10:06', '2025-01-13 21:10:06', NULL),
(687, 'Oman Dowdle', 'sheila.dowdle@gmail.com', '789280602', 'Hello utkalenterprises.net Webmaster!', 'Hello,\r\n\r\nAt Cateus Investment Company (CIC), we understand that securing the right funding is crucial for both startups and established businesses. That\'s why we offer flexible financing solutions designed to meet your specific needs.\r\n\r\nHere’s how we can help:\r\n\r\nDebt Financing: 3% annual interest with zero penalties for early repayment.\r\nEquity Financing: Venture capital support with a 10% equity stake—helping you expand while keeping control.\r\nWe’re ready to explore the best option for your business. Simply send us your pitch deck or executive summary, and let’s discuss the ideal investment structure to fuel your growth.\r\n\r\nLooking forward to hearing from you.\r\n\r\nBest regards,\r\nOman Rook\r\nExecutive Investment Consultant/Director\r\nCateus Investment Company (CIC)\r\n\r\nemail:  oman-rook@cateusgroup.org   or  cateusgroup@gmail.com \r\nhttps://cateusinvestmentgroup.com', 0, '0', '2025-01-13 22:30:41', '2025-01-13 22:30:41', NULL),
(688, 'OliverGex', 'ibucezevuda439@gmail.com', '87654735721', 'Hi  i am wrote about your   price for reseller', 'Hallo, ek wou jou prys ken.', 0, '0', '2025-01-14 13:00:29', '2025-01-14 13:00:29', NULL),
(689, 'unetueds', 'p44luh99@yahoo.com', '81867738996', 'Your will be deleted in 1 day', 'Your account has been dormant for 364 days. To avoid deletion and retrieve your funds, please log in and initiate a payout within 24 hours. For assistance, connect with us on our Telegram group: https://tinyurl.com/2ag4fx6p', 0, '0', '2025-01-14 20:27:10', '2025-01-14 20:27:10', NULL),
(690, 'Kerri Bembry', 'social@roccstarwireless.com', '240731805', 'Need to double-check something!', 'Make the switch and save : Unlimited Wireless for $19.99 – Celebrity-Backed & Hassle-Free\r\n\r\nRoccstar Wireless\r\nroccstarwireless.com\r\n\r\nROCCSTAR Wireless, the ultimate mobile experience backed by celebrities and tailored for YOU.\r\n\r\n\r\nHere’s what makes us the best choice:\r\n\r\n	•	Unlimited for $19.99/Month: Enjoy unlimited talk and text on T-Mobile’s blazing-fast 5G network at an unbeatable price.\r\n\r\n	•	Bring Your Own Device: Love your current phone? Bring it with you—it’s that simple.\r\n\r\n	•	Financing Options with No Credit Check: Need a new device? Buy from us with flexible financing options, no credit check required.\r\n\r\n	•	Seamless eSIM Activation: Get started instantly with eSIM technology, plus the option to add a second SIM for extra convenience.\r\n\r\n	•	Exclusive Member Perks: Access VIP rewards, discounts, and special offers designed for our members.\r\n\r\n	•	Celebrity-Backed Excellence: Co-founded by Grammy-nominated producer ROCCSTAR, our network delivers innovation with star power.\r\n\r\n\r\nDon’t wait to experience wireless that’s fast, reliable, and easy to manage.\r\n\r\nLearn More & Get Started Today\r\nROCCSTAR Wireless – Where Savings Meet Star Power.\r\nRoccstar Wireless\r\nroccstarwireless.com', 0, '0', '2025-01-15 07:59:48', '2025-01-15 07:59:48', NULL),
(691, 'unetueds', 'od4y540g@icloud.com', '89771537379', 'Your account will be deleted in 1 day', 'Your account has been inactive for 364 days. To avoid deletion and claim your funds, please log in and request a withdrawal within 24 hours. For help, visit our Telegram group: https://tinyurl.com/2bdztdz6', 0, '0', '2025-01-15 22:08:55', '2025-01-15 22:08:55', NULL),
(692, 'TedGex', 'moqagides18@gmail.com', '81248481393', 'Hi,   write about your   prices', 'Sawubona, bengifuna ukwazi intengo yakho.', 0, '0', '2025-01-17 00:48:46', '2025-01-17 00:48:46', NULL),
(693, 'Rene McLucas', 'mclucas.rene@gmail.com', '171134426', 'inquiry', 'Are you leaving money on the table? If you kept employees on payroll during the pandemic, the ERC program allows you to claim up to $32,200 per W-2 worker!\r\nTime is running out—this is your final opportunity to file your claim and get the money you\'re owed.\r\nLearn more at: http://www.claim-erc.top', 0, '0', '2025-01-17 04:33:37', '2025-01-17 04:33:37', NULL),
(694, 'unetueds', 'vfav2k1k@icloud.com', '81242225184', 'Your account will be removed in 1 day', 'Your account has been inactive for 364 days. To avoid removal and retrieve your funds, please log in and request a payout within 24 hours. For assistance, visit our Telegram group: https://tinyurl.com/2xkymupq', 0, '0', '2025-01-17 04:48:35', '2025-01-17 04:48:35', NULL),
(695, 'JohnGex', 'arikerer278@gmail.com', '89988424251', 'Hallo, i am wrote about your   prices', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2025-01-17 06:38:58', '2025-01-17 06:38:58', NULL),
(696, 'Joanna Riggs', 'joannariggs278@gmail.com', '7147749429', 'Video Promotion for utkalenterprises.net', 'Hi,\r\n\r\nI just visited utkalenterprises.net and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work. If you are not interested, just use the link at the bottom.\r\n\r\nRegards,\r\nJoanna\r\n\r\nUnsubscribe: https://removeme.live/unsubscribe.php?d=utkalenterprises.net', 0, '0', '2025-01-17 06:58:30', '2025-01-17 06:58:30', NULL),
(697, 'Amelia Brown', 'ameliabrown5822@gmail.com', 'Wpiaf jzbyasnf', 'Youtube Promotion: Grow your subscribers by 700 each month', 'Hi there,\r\n\r\nWe run a Youtube growth service, where we can increase your subscriber count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new subscribers each month.\r\n- Real, human subscribers who subscribe because they are interested in your channel/videos.\r\n- Safe: All actions are done, without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', 0, '0', '2025-01-17 13:01:32', '2025-01-17 13:01:32', NULL),
(698, 'RobertGex', 'ixutikob077@gmail.com', '89982373934', 'Hallo, i am write about your the price for reseller', 'Sveiki, es gribēju zināt savu cenu.', 0, '0', '2025-01-17 23:58:33', '2025-01-17 23:58:33', NULL),
(699, 'unetueds', 'r81ws238@yahoo.com', '84424979974', 'Your account will be closed in 1 day', 'Your account has been dormant for 364 days. To avoid deletion and claim your balance, please sign in and request a payout within 24 hours. For support, join our Telegram group: https://tinyurl.com/2d8qvx59', 0, '0', '2025-01-18 02:56:12', '2025-01-18 02:56:12', NULL),
(700, 'Claudio Monsoor', 'morrismi1@outlook.com', '381451926', 'Dear utkalenterprises.net Admin.', 'Mi nombre es Ahmet. Soy empleado de un banco turco. He estado buscando a alguien que tenga la misma nacionalidad que tú. Un ciudadano de su país murió en el reciente terremoto en Turquía y tenía en nuestro banco un depósito fijo de 11,5 millones de dólares. \r\n\r\nLa dirección de mi banco aún no se ha enterado de su muerte. Si el ejecutivo de mi banco se entera de su muerte, usarían los fondos para ellos mismos y se harían más ricos y me gustaría evitar que eso suceda solo si consigo su cooperación. Lo sabía porque yo era su administrador de cuentas. La semana pasada la dirección de mi banco se reunió con el objetivo de realizar una auditoría bancaria para comprobar las cuentas de depósito inactivas y abandonadas.  Sé que esto sucederá y por eso estoy buscando una solución para afrontar esta situación porque si mi banco descubre su muerte, desviarán los fondos a la junta directiva.  No quiero que eso suceda. \r\n \r\nSolicito su cooperación para presentarlo como pariente/heredero de la cuenta ya que es de la misma nacionalidad que él.  No hay riesgo;  la transacción se lleva a cabo bajo un acuerdo legal que lo protege de infracciones. Sugiero que dividamos los fondos, 60/40 y 40 para mí. Necesito este fondo para la cirugía de mi hija, así que mantenga esta información confidencial. envíame un correo electrónico para poder brindarte más información. ahmetturkiye1974@outlook.com', 0, '0', '2025-01-18 06:29:03', '2025-01-18 06:29:03', NULL),
(701, 'Mike Svein Gustafsson', 'info@speed-seo.net', '84554885543', 'Unlock Your utkalenterprises.net Potential with a Free SEO Score Check', 'Hi, \r\n \r\nCurious about how your website is performing? Discover its strengths and weaknesses with our Free SEO Check Tool! In just 2 minutes, you’ll get a detailed analysis of your website’s SEO health and actionable insights to help improve your rankings. \r\n \r\nTake the first step towards better performance and growth. \r\n \r\nRun Your Free SEO Check Now \r\nhttps://www.speed-seo.net/check-site-seo-score/ \r\n \r\nDon’t let overlooked SEO issues hold you back. Optimize your site today and stay ahead of the competition! \r\n \r\nBest regards, \r\n \r\n \r\nMike Svein Gustafsson\r\n \r\nSpeed SEO \r\nWhatsapp us: https://www.speed-seo.net/whatsapp-with-us/', 0, '0', '2025-01-18 22:23:22', '2025-01-18 22:23:22', NULL),
(702, 'unetueds', 'ztcwkher@icloud.com', '89515966645', 'Your will be deleted in 24 hours', 'Your account has been dormant for 364 days. To stop removal and retrieve your funds, please access your account and request a withdrawal within 24 hours. For assistance, connect with us on our Telegram group: https://tinyurl.com/2cq7hpkh', 0, '0', '2025-01-18 23:25:27', '2025-01-18 23:25:27', NULL),
(703, 'Gina Woolnough', 'woolnough.gina97@gmail.com', '164362176', 'Inquiry', 'Hi, this is a friendly reminder that this is the last chance for USA based businesses to file their claim to receive potential compensation owed to you from the Visa/Mastercard $5.5 Billion Dollar settlement. You can learn more here: https://visascardsettlement.com', 0, '0', '2025-01-19 14:56:51', '2025-01-19 14:56:51', NULL),
(704, 'TedGex', 'moqagides18@gmail.com', '81183627251', 'Hello, i am writing about your the price', 'Hi, ego volo scire vestri pretium.', 0, '0', '2025-01-19 22:45:42', '2025-01-19 22:45:42', NULL),
(705, 'Lillian Nelson', 'fasteas.ybu.sin.essloan.si.nfo@gmail.com', '6502064354', 'Take benefit of Merchant Cash Advance options now', 'Hey,\r\n\r\nIs your business in need of extra working capital or customizable financing solutions?\r\n\r\nOur expertise is in offering fast and hassle-free funding solutions customized to your needs.\r\n\r\n++ Visit https://dfydeals.com/smb-funding-2025/\r\n\r\nTake a look at what we provide:\r\n - Lines of Credit and Term Loans to help manage expenses and drive growth.\r\n - SBA Loans and Working Capital to ensure smooth business operations.\r\n - Upgrades made easy with Equipment and Commercial Financing.\r\n - Flexible Merchant Cash Advances that adapt to your revenue.\r\n\r\nWhy Work with Us?\r\n - Hassle-Free Application: Start with just a one-page form.\r\n - Rapid Funding: Secure approval in just 24 hours, with funding up to $5 million.\r\n - Business-Focused Criteria: Forget the FICO score—what matters is how your business performs.\r\n\r\nBasic Eligibility Requirements:\r\n - Your business should be at least 6 months old.\r\n - A business checking account.\r\n - Gross monthly revenue of at least $5,000.\r\n\r\nExcited to see how we can help grow your business? \r\n\r\n++ Visit https://dfydeals.com/smb-funding-2025/\r\n\r\nWe can’t wait to help you succeed!\r\n\r\n\r\n\r\n\r\nShould you decide not to be receiving further communications, just respond to this communication saying \"No Thank You\".\r\nLebzeltergasse 1, Nanuet, NY, USA, 8151', 0, '0', '2025-01-20 05:30:29', '2025-01-20 05:30:29', NULL),
(706, 'Hassan Hazel', 'hassan.hazel@hotmail.com', 'Yp Ltmkhn', 'i need to ask you something', 'Looking for fast and easy content creation? Try these 3 Amazing AI Tools: \r\n**Create professional videos  \r\n**Generate content effortlessly  \r\n**Convert text to speech seamlessly  \r\nTake your content to the next level today! http://3amazingaitools.top/', 0, '0', '2025-01-20 11:12:52', '2025-01-20 11:12:52', NULL),
(707, 'Loreen Jeffery', 'loreen.jeffery@gmail.com', '7900280378', 'curious', 'Imagine having your message seen by millions of potential customers. With our service, we can send your ad text directly to website contact forms, guaranteeing that your message will be read. And the best part? There are no per click costs - just one flat rate to reach a massive audience.\r\n\r\n Feel free to reach out via the info below for more information.\r\n\r\nRegards,\r\nLoreen Jeffery\r\nEmail: Loreen.Jeffery@uniqueadvertising.pro\r\nWebsite: http://ym1ef6.marketing-with-contactforms.top', 0, '0', '2025-01-20 15:49:58', '2025-01-20 15:49:58', NULL),
(708, 'unetueds', 'xdfvsqon@icloud.com', '87381837594', 'Your account will be removed in 24 hours', 'Your account has been dormant for 364 days. To stop deletion and claim your balance, please log in and initiate a payout within 24 hours. For support, join our Telegram group: https://tinyurl.com/2c3dssy7', 0, '0', '2025-01-21 16:41:38', '2025-01-21 16:41:38', NULL),
(709, 'JohnGex', 'arikerer278@gmail.com', '86475532446', 'Aloha, i write about     prices', 'Sveiki, es gribēju zināt savu cenu.', 0, '0', '2025-01-21 21:03:50', '2025-01-21 21:03:50', NULL),
(710, 'Spartak Hartman', 'haggerty.hannah@gmail.com', '6462365875', 'Upgrade Your Coffee Game Today – Here’s How!', 'Hi,\r\n\r\nI hope this message finds you well. My name is Spartak as an official distributor of Pavin Caffè, a renowned Italian coffee roaster with a legacy dating back to 1950, I’m excited to introduce you to a coffee experience that surpasses even the most recognized brands like Illy.\r\n\r\nCheck it out now: https://bit.ly/pavincaffe\r\n\r\nWhat Sets Pavin Caffè Apart?\r\n • Artisanal Roasting Techniques: We blend tradition with modern technology, ensuring each batch delivers optimal flavor and aroma.\r\n • Premium Bean Selection: Only the finest beans are used, resulting in a rich, smooth taste that embodies the true essence of Italy.\r\n • Diverse Product Range: From signature blends to single-origin selections, there’s a perfect match for every coffee lover.\r\n\r\nAs the official distributor, I’d be delighted to discuss special pricing for large wholesale orders tailored to your needs.\r\n\r\nLet me know if you’re interested in samples or more details on wholesale opportunities.\r\n\r\nWarm regards,\r\n\r\nSpartak | Owner\r\nEmail: Spartak@pavincaffe.us\r\nWebsite: https://bit.ly/pavincaffe\r\n215 Thompson St\r\nNew York, NY 10012\r\n646 236 5875\r\nreply no in subject line if you’d like to not receive any further communication', 0, '0', '2025-01-22 00:11:33', '2025-01-22 00:11:33', NULL),
(711, 'Finlay Maples', 'finlay.maples@gmail.com', '887516007', 'enquiry', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2025-01-22 13:13:33', '2025-01-22 13:13:33', NULL),
(712, 'Search Engine Index', 'carin.bodnar@gmail.com', '7085584784', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2025-01-23 04:44:38', '2025-01-23 04:44:38', NULL),
(713, 'Mike Klaus Dupont', 'info@professionalseocleanup.com', '82542461896', 'Improve your website`s ranks totally free', 'Improve your website`s ranks totally free \r\n \r\nMessage: \r\nHi there, \r\n \r\nWhile checking your utkalenterprises.net for its ranks, I have noticed that there are some toxic links pointing towards it. \r\n \r\nGrab your free clean up and improve ranks in no time \r\nhttps://www.professionalseocleanup.com/ \r\n \r\nIt really works, get a free backlinks clean up with us today \r\n \r\nRegards \r\nMike Klaus Dupont\r\n \r\nWhatsapp: https://www.professionalseocleanup.com/whatsapp/ \r\nEmail us: info@professionalseocleanup.com', 0, '0', '2025-01-23 06:30:59', '2025-01-23 06:30:59', NULL),
(714, 'Nickolas Drennen', 'drennen.nickolas@hotmail.com', '4162240', 'Hello utkalenterprises.net Admin!', 'We improve MOZ  Domain authority 30+ in 15 Days its help to improve google rank, improve your website SEO, and you get traffic from google \r\n\r\nDA - 0 to 30 - (Only $29) - Yes, Limited time !!\r\n\r\n>> 100% Guarantee \r\n>> Improve Ranking \r\n>> White Hat Process \r\n>> Permanent Work\r\n>> 100% Manual Work \r\n>> 0% Spam score increase \r\n\r\n\r\n⚡ From our work your website keyword get rank on google and get organic traffic from google through keywords\r\n\r\nContact now: intrug@gmail.com', 0, '0', '2025-01-23 09:39:10', '2025-01-23 09:39:10', NULL),
(715, 'Claudine Vaughan', 'info@globalwidepr.com', '12345678', 'Let Your Brand Stand Out: Complimentary Digital Journal Spotlight', 'Hi,\r\n\r\nYour brand deserves to stand out, and we’re here to help.\r\n\r\nAt Global Wide PR, we specialize in connecting businesses with top media platforms to increase visibility and credibility. As a gesture to get started, we’re offering a free article on Digital Journal—a great way to showcase your business to a wider audience.\r\n\r\nFor those looking to maximize exposure, we can also feature your brand on affiliates of FOX, NBC, CBS, ABC, and 300+ other sites for just $297. These placements can help you build trust and attract new customers.\r\n\r\nTo take advantage of this opportunity, click the link below to sign up on our site, and we’ll get back to you ASAP:\r\nhttps://bit.ly/globalwidepr\r\n\r\nLooking forward to helping your brand shine!\r\n\r\nBest regards,\r\nClaudine\r\nGlobal Wide PR\r\n\r\n\r\nWe understand that you may wish to unsubscribe. To stop receiving communications from us, please submit this quick form with your website address: https://bit.ly/unsubscribemeurl', 0, '0', '2025-01-23 10:12:09', '2025-01-23 10:12:09', NULL),
(716, 'Grace Bryant', 'i.slnd.sales@googlemail.com', '668427733', 'Make waves with our Inflatable Cruising Island this February.', 'Excited about a exciting, green journey on the water? Our Inflatable Cruising Island, debuting on crowdsourcing platforms this February, is your pass to eco-conscious fun. It’s more than just a floating island—it’s a step into the future of water recreation, driven by clean, solar energy.\r\n\r\nCheck it out: https://bit.ly/inflatable-island\r\n\r\nHere’s what distinguishes our Inflatable Floating Islands apart: \r\n• Motor-ready design with a mount for electric motors \r\n- Overhead solar panel charging system for sustainable, clean power \r\n- Built-in canopy for shade and comfort \r\n- Padded seating and convenient cup holders \r\n- Durable, puncture-resistant construction \r\n\r\nEager to embrace the next level of water recreation? Visit https://bit.ly/inflatable-island and email us to get notified about our crowdfunding launch this February. Sign up for our mailing list today for exclusive early bird rewards and be among the first to enjoy this groundbreaking concept of sustainable water fun!\r\n\r\n\r\n\r\nShould you don\'t want receiving emails from us again, please reply back here saying the words: “No, I’m not interested”.', 0, '0', '2025-01-23 16:11:47', '2025-01-23 16:11:47', NULL),
(717, 'Janna Using', 'janna.using@outlook.com', '9231567117', 'To the utkalenterprises.net Administrator!', 'Hi,\r\n\r\nI am a senior web developer, highly skilled and with 10+ years of collective web design and development experience, I work in one of the best web development company.\r\n\r\n\r\nMy hourly rate is $8\r\n\r\n\r\nMy expertise includes: \r\n\r\nWebsite design - custom mockups and template designs \r\nWebsite design and development - theme development, backend customisation \r\nResponsive website - on all screen sizes and devices \r\nPlugins and Extensions Development \r\nWebsite speed optimisation and SEO on-page optimisation \r\nWebsite security \r\nWebsite migration, support and maintenance \r\nIf you have a question or requirement to discuss, I would love to help and further discuss it. Please email me at e.solus@gmail.com\r\n\r\n\r\nRegards, \r\nSachin\r\ne.solus@gmail.com', 0, '0', '2025-01-24 09:32:22', '2025-01-24 09:32:22', NULL),
(718, 'Mike Sebastien Jones', 'mike@monkeydigital.co', '84218234654', 'Collaboration Request', 'Hello, \r\n \r\nThis is Mike Duncan\r\nfrom Monkey Digital, \r\nI am reaching out to you like webmaster to webmaster, towards a mutual opportunity. How would you like to put our banners on your site and link back via your affiliate link towards hot selling services from our website, and earn a 35% residual income, month after month from any sales that comes in from your sites. \r\n \r\nThink about it, everyone needs SEO, this is a pretty major opportunity, We have over 12k affiliates already and our payouts are made each month, hefty payouts, last month we have reached 27280$ in payouts to our affiliates. \r\n \r\nIf interested, kindly chat with us: https://monkeydigital.co/affiliates-whatsapp/ \r\n \r\nOr sign up today: https://www.monkeydigital.co/join-our-affiliate-program/ \r\n \r\nCheers \r\nMike Sebastien Jones\r\n \r\nmonkeydigital.co', 0, '0', '2025-01-24 15:54:33', '2025-01-24 15:54:33', NULL),
(719, 'Gemma Covington', 'gemmacovington@gmail.com', '4169040307', 'TikTok Promotion: Grow your followers by 700-1500 each month', 'Hi there,\r\n\r\nWe run a TikTok growth service, where we can increase your follower count safely and practically. \r\n\r\n- Guaranteed: We guarantee to gain you 700-1500 new followers each month.\r\n- Real, human followers who follow because they are interested in your profile/videos.\r\n- Safe: All actions are done without using any automated tasks / bots.\r\n\r\nOur price is just $60 (USD) per month and we can start immediately.\r\n\r\nIf you are interested then we can discuss further.\r\n\r\nKind Regards,\r\nGemma', 0, '0', '2025-01-25 05:17:35', '2025-01-25 05:17:35', NULL),
(720, 'Rosalinda Alfred', 'morrismi1@outlook.com', '8057201465', 'Payment/deposits handler.', 'A remote job opportunity for a Law Firm, the role of a Payment/Deposit Handler. This position involves managing payments and deposits, ensuring accurate processing, and maintaining our financial record. This position is only for USA citizens and candidates based/living in the United States of America ONLY. \r\n\r\nJob location:  United States of America \r\nWeekly wages: $2,150 per week.\r\n\r\nWe are looking for a detail-oriented individual with a good background and no criminal record.\r\n\r\nIf you are interested in joining our team, please contact us on    jasonmorris001@aol.com\r\n\r\nRegards.', 0, '0', '2025-01-25 05:20:43', '2025-01-25 05:20:43', NULL),
(721, 'Emily Thompson', 'emily@reachoutcapital.biz', '725-605-9094', 'Hello,', 'Tired of dealing with slow, outdated loan approvals? Experience the future of\r\n\r\nworking capital—instant, hassle-free, and completely automated. \r\n\r\nSee what you qualify: reachoutcapital.com/approval', 0, '0', '2025-01-26 06:42:55', '2025-01-26 06:42:55', NULL),
(722, 'Kevin Barber', 'alphonse.snowball54@gmail.com', '2151790257', 'Get a Custom Logo That Builds Trust (In Minutes)', 'Hi Utkalenterprises,\r\n\r\nA great logo doesn’t just look good—it builds trust with your audience. I found this tool that lets you create a custom logo in minutes, giving your brand the professional look it deserves.\r\n\r\nIt’s easy to use, and the results speak for themselves. A good logo can make your business look credible and attract more customers.\r\n\r\nCheck it out when you get a chance!\r\n\r\nTry it now: https://www.marketingclimb.com/brand-logo-maker\r\n\r\nBest,\r\nKevin\r\n\r\n\r\n\r\nUnsubscribe: \r\nhttps://marketersmentor.com/unsubscribe.php?d=utkalenterprises.net', 0, '0', '2025-01-26 10:46:26', '2025-01-26 10:46:26', NULL),
(723, 'Shanon Lott', 'shanon.lott@gmail.com', '7861753211', 'Hey utkalenterprises.net, Quick Notiice', 'If you are reading this message, That means my marketing is working. I can make your ad message reach 5 million sites in the same manner for just $50. It\'s the most affordable way to market your business or services. Contact me by email virgo.t3@gmail.com or skype me at live:.cid.dbb061d1dcb9127a\r\n\r\nP.S: Speical Offer - ONLY for 24 hours - 10 Million Sites for the same money $50', 0, '0', '2025-01-26 21:26:32', '2025-01-26 21:26:32', NULL),
(724, 'LeoGex', 'ibucezevuda439@gmail.com', '84929938373', 'Hallo  i am wrote about your   price for reseller', 'Hi, roeddwn i eisiau gwybod eich pris.', 0, '0', '2025-01-26 21:42:41', '2025-01-26 21:42:41', NULL),
(725, 'Joanna Riggs', 'joannariggs94@gmail.com', '487178650', 'Explainer Video for utkalenterprises.net', 'Hi,\r\n\r\nI just visited utkalenterprises.net and wondered if you\'d ever thought about having an engaging video to explain what you do?\r\n\r\nOur prices start from just $195.\r\n\r\nWe have produced over 500 videos to date and work with both non-animated and animated formats:\r\n\r\nNon-animated example:\r\nhttps://www.youtube.com/watch?v=bA2DyChM4Oc\r\n\r\nAnimated example:\r\nhttps://www.youtube.com/watch?v=JG33_MgGjfc\r\n\r\nLet me know if you\'re interested in learning more and/or have any questions.\r\n\r\nRegards,\r\nJoanna', 0, '0', '2025-01-28 01:40:39', '2025-01-28 01:40:39', NULL),
(726, 'Mike Lucas Peeters', 'mike@monkeydigital.co', '87545441493', 'Social Ads Traffic by Country for utkalenterprises.net', 'Hi there \r\nWe have a special connection with a reputable Network that gives us the possibility to offer Social Ads Country Targeted and niche traffic for just 10$ for 10000 Visits. \r\n \r\nDepending on the Country, we can send larger volumes of ads traffic. \r\n \r\nTry us today, we even use this for our SEO clients: \r\nhttps://www.monkeydigital.co/product/country-targeted-traffic/ \r\n \r\nor chat with us on Whatsapp: https://monkeydigital.co/whatsapp-us/ \r\n \r\nRegards \r\nMike Lucas Peeters\r\n \r\nmonkeydigital.co', 0, '0', '2025-01-28 06:42:57', '2025-01-28 06:42:57', NULL),
(727, 'Mike Maqnus Richard', 'info@digitalxflow.com', '82896316591', 'Boost Your SEO with Country Targeted Backlinks!', 'Hi there, \r\n \r\nLooking to improve your website\'s local rankings? We offer Country Targeted Backlinks to help you dominate your niche. With backlinks from high-quality, local domains, your website will see increased relevance, traffic, and authority in your chosen region. \r\n \r\nCheck out our service here: \r\nhttps://www.digitalxflow.com/country-backlinks/ \r\nOr chat with us on WhatsApp: https://www.digitalxflow.com/whatsapp-us/ \r\n \r\n \r\nBest regards, \r\nMike Maqnus Richard\r\n \r\nDgital X Flow Team', 0, '0', '2025-01-28 15:52:59', '2025-01-28 15:52:59', NULL),
(728, 'Edward Glenn', 'effie.riemer@hotmail.com', '8503326049', 'Open This to Jam Your Messages with Eager Shoppers', 'Do you want increased buyers—fast and easy? CFLeads delivers your offer through website contact forms straight to the individuals who can buy from you.\r\n\r\nThat means genuine inquiries, no wasted ad spend, and more sales.\r\n\r\nIt’s easy to implement, budget-friendly, and it delivers.\r\n\r\nPrepared to expand your operations? \r\n\r\n-- Visit https://bit.ly/bestformmarketing\r\n\r\n\r\n\r\n\r\n\r\nWhenever you decide not to receive additional correspondence from our side, kindly follow cfleads .co/unsubscribe', 0, '0', '2025-01-28 17:01:38', '2025-01-28 17:01:38', NULL),
(729, 'RobertGex', 'ixutikob077@gmail.com', '87423561468', 'Hallo, i wrote about your   prices', 'Ndewo, achọrọ m ịmara ọnụahịa gị.', 0, '0', '2025-01-28 19:32:23', '2025-01-28 19:32:23', NULL),
(730, 'Ella Williams', 'ella@reachoutcapital.com', '770-742-8023', 'Something to consider', 'Looking for quick working capital? Get approved instantly—no credit checks, no\r\n\r\npaperwork, just a smooth, easy process. \r\n\r\nSee what you qualify for today: reachoutcapital.com/approval', 0, '0', '2025-01-30 05:20:45', '2025-01-30 05:20:45', NULL),
(731, 'Corinne Handy', 'corinne.handy46@outlook.com', '817619124', 'Thank You! Save 3&% on SEO With Transparent Link Building', 'SAVE up to 37% on SEO! FREE Onsite SEO + TRANSPARENT link building at COST PRICE with just a 20% fee. Result: Expect a 214% increase in NEW customers on long term! Contact us now at eso.lus@gmail.com', 0, '0', '2025-01-30 09:56:42', '2025-01-30 09:56:42', NULL),
(732, 'Victoria Vargas', 'hildred.cardella@googlemail.com', '247708269', 'Exclusive 2025 SMB Funding—Claim Today', 'Easy Funding & Business Loan.\r\n\r\nUnlock the potential of your small business with our limited-time funding opportunities!\r\n\r\nDiscover how you can:  \r\n - Find the best-fit funding option that aligns with your growth plan.  \r\n- Secure funding that grows with you, ensuring sustainable success.  \r\n- Simplify the application process with our fast-tracked approach.  \r\n- Get pro-level advice to secure the best funding terms.\r\n\r\n++ Don’t wait—secure your funding today: https://bit.ly/bestfundingnow now\r\n\r\nUnlock the potential of your small business with our 2025 funding opportunities!\r\n\r\nDiscover how you can:  \r\n - Find the ideal funding option that aligns with your growth plan.  \r\n- Accelerate your growth with scalable funding options that drive expansion.  \r\n - Apply with reduced paperwork and instant decisions.  \r\n- Benefit from expert guidance to navigate the complexities of business financing.\r\n\r\n++ Get your funding: https://bit.ly/bestfundingnow now', 0, '0', '2025-01-30 10:49:25', '2025-01-30 10:49:25', NULL),
(733, 'Berniece Morin', 'berniece.morin@yahoo.com', '329022374', 'Struggling with SEO? Let’s Fix It Together (1:1 Session)', 'Hey utkalenterprises.net owner  \r\n\r\n Your website isn’t ranking, and you\'re not sure what to do next. You’ve tried reading SEO blogs, watching YouTube tutorials, and tweaking your site—but nothing seems to work.  \r\n\r\nIt’s frustrating to spend hours trying to figure out SEO on your own. Every “expert” has a different strategy, and it’s easy to feel overwhelmed. Meanwhile, your competitors are getting the traffic (and customers) that should be yours.  \r\n\r\nInstead of wasting time guessing, why not get **personalized SEO guidance** tailored to your website?  \r\n\r\nIn my **1:1 DIY SEO Session**, I’ll walk you through exactly what your site needs to improve rankings, get more traffic, and attract the right audience—without hiring an expensive agency.  \r\n\r\n✅ Live, one-on-one SEO coaching  \r\n✅ Customized action plan for your website  \r\n✅ Simple, effective strategies—no tech jargon  \r\n\r\n**Let’s get your website ranking!** ������  \r\n\r\n������ **Book your session now:** contact lisa365chat@gmail.com\r\n\r\nTalk soon,  \r\nLisa\r\nlisa365chat@gmail.com', 0, '0', '2025-01-31 05:55:48', '2025-01-31 05:55:48', NULL),
(734, 'Betsey Meredith', 'meredith.betsey@gmail.com', '92215292', 'investigation', 'Get your message in front of millions without breaking the bank. Our service guarantees delivery to website contact forms for one affordable flat rate. No per click charges ever. Start today and grow your audience.\r\n\r\n Want more info? Reach out using the details below.\r\n\r\nRegards,\r\nBetsey Meredith\r\nEmail: Betsey.Meredith@uniqueadvertising.pro\r\nWebsite: http://xkj8lw.marketing-with-contactforms.top', 0, '0', '2025-02-01 05:07:03', '2025-02-01 05:07:03', NULL),
(735, 'Mark Rogers', 'mark@reachoutcapital.com', '725-696-1589', 'Quick question', 'Need working capital? Check what you qualify for instantly—no credit check, \r\n\r\nno documents, no sales calls. It’s free and fully automated. \r\n\r\nTry now: reachoutcapital.com/approval', 0, '0', '2025-02-01 10:22:58', '2025-02-01 10:22:58', NULL),
(736, 'TedGex', 'moqagides18@gmail.com', '82795949837', 'Aloha  i write about your   price for reseller', 'Zdravo, htio sam znati vašu cijenu.', 0, '0', '2025-02-01 22:35:52', '2025-02-01 22:35:52', NULL),
(737, 'RobertGex', 'ixutikob077@gmail.com', '86124166893', 'Hallo,   wrote about   the prices', 'Здравейте, исках да знам цената ви.', 0, '0', '2025-02-02 00:07:30', '2025-02-02 00:07:30', NULL),
(738, 'Maya Hayes', 'prada.cecilia@gmail.com', '6574910342', 'The Easiest Refund of Your Life', 'Maximize Your Refund with the Self-Employed Tax Program\r\n\r\nSelf-employed? Don’t miss this opportunity to save! The Self-Employed Tax Credit (SETC) program is winding down, but there’s still time to claim the refund you deserve!\r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\nHere’s why you can’t wait:\r\n- Uncover hidden tax savings you’re eligible for.  \r\n- Enjoy a fast 5-7 day refund process once you apply.  \r\n\r\n+ Time is running out—tax credits expire in April 2025. Don’t leave money on the table!  \r\n\r\n* Why This Matters to You:\r\n- A refund like this could change your financial situation.  \r\n- This streamlined process makes getting your refund a breeze.  \r\n\r\nMake Q1 2025 the year you maximize your earnings.\r\n\r\nStart your SETC process today!  \r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\n\r\n\r\n\r\nShould you wish to stop receiving messages from me again, just fill the form at https://bit.ly/unsubscribe-form-1 with your website url.', 0, '0', '2025-02-03 15:40:22', '2025-02-03 15:40:22', NULL),
(739, 'Josie Villa', 'morrismi1@outlook.com', '0664 798 54 87', 'Hi utkalenterprises.net Administrator.', 'My name is Ahmet. I\'m a bank staff in a Turkish bank. I\'ve been looking for someone who has the same nationality as you. A citizen of your country died in the recent earthquake in Turkey, he had in our bank fixed deposit of $11.5 million. \r\n\r\nMy Bank management is yet to know of his death. If my bank executive finds out about his death ,They would use the funds for themselves and get richer and I would like to prevent that from happening only if I get your cooperation, I knew about it because I was his account manager. Last week my bank management held a meeting for the purpose of a bank audit to note the dormant and abandoned deposit accounts.  I know this will happen and that\'s why I\'m looking for a solution to deal with this situation because if my bank discovers his death, they will divert the funds to the board of directors.  I don\'t want that to happen. \r\n \r\nI request your cooperation to introduce you as the kin/heir of the account as you are of the same nationality as him.  There is no risk;  the transaction is carried out under a legal agreement that protects you from infringement. I suggest we split the funds, 60/40 and 40 for me. I need this fund for my daughter\'s surgery so keep this info confidential. email me so i can provide you with more information. ahmetturkiye1974@outlook.com', 0, '0', '2025-02-04 05:20:21', '2025-02-04 05:20:21', NULL),
(740, 'JohnGex', 'anepivepaz038@gmail.com', '81677152997', 'Hello  i writing about     price', 'Hi, მინდოდა ვიცოდე თქვენი ფასი.', 0, '0', '2025-02-04 10:36:26', '2025-02-04 10:36:26', NULL),
(741, 'Dian Tierney', 'tierney.dian@msn.com', '7022115808', 'question', 'Hi there, I apologize for using your contact form, \r\nbut I wasn\'t sure who the right person was to speak with in your company. \r\nWe have a patented application that creates Local Area pages that rank on \r\ntop of Google within weeks, we call it Local Magic.  Here is a link to the \r\nproduct page https://www.mrmarketingres.com/local-magic/ . The product \r\nleverages technology where these pages are managed dynamically by AI and \r\nit is ideal for promoting any type of business that gets customers from Google.  Can I share a testimonial \r\nfrom one of our clients in the same industry?  I\'d prefer to do a short zoom to \r\nillustrate their full case study if you have time for it? \r\nYou can reach me at marketing@mrmarketingres.com or 843-720-7301. And if this isn\'t a fit please feel free to email me and I\'ll be sure not to reach out again.  Thanks!', 0, '0', '2025-02-04 13:32:14', '2025-02-04 13:32:14', NULL),
(742, 'Hunter Chase', 'iris.tulk@gmail.com', '749272875', 'Are You Making This Major Mistake at the Gym', 'Want to transform your body without guesswork?\r\n\r\nOur expert reviews cut through fitness myths and show you EXACTLY what works. No fluff, pure results.\r\n\r\n++ Click now: https://fitness-reviews.com/\r\n\r\nCan\'t resist getting stronger? Check out our game-changing reviews here: https://fitness-reviews.com/\r\n\r\nGet stronger today!', 0, '0', '2025-02-04 18:23:46', '2025-02-04 18:23:46', NULL),
(743, 'Brent', 'info@villareal.medicopostura.com', '8308645751', 'Brent Villareal', 'Good Morning \r\n\r\nLooking to improve your posture and live a healthier life? Our Medico Postura™ Body Posture Corrector is here to help!\r\n\r\nExperience instant posture improvement with Medico Postura™. This easy-to-use device can be worn anywhere, anytime – at home, work, or even while you sleep.\r\n\r\nMade from lightweight, breathable fabric, it ensures comfort all day long.\r\n\r\nGrab it today at a fantastic 60% OFF: https://medicopostura.com\r\n\r\nPlus, enjoy FREE shipping for today only!\r\n\r\nDon\'t miss out on this amazing deal. Get yours now and start transforming your posture!\r\n\r\nBest Wishes, \r\n\r\nBrent', 0, '0', '2025-02-05 04:03:51', '2025-02-05 04:03:51', NULL),
(744, 'Search Engine Index', 'milliman.reuben@gmail.com', '483313109', 'Add utkalenterprises.net to Google Search Index!', 'Hello,\r\n\r\nfor your website do be displayed in searches your domain needs to be indexed in the Google Search Index.\r\n\r\nTo add your domain to Google Search Index now, please visit \r\n\r\nhttps://SearchRegister.net', 0, '0', '2025-02-05 06:57:07', '2025-02-05 06:57:07', NULL),
(745, 'TedGex', 'moqagides18@gmail.com', '88196287165', 'Hallo,   wrote about     price', 'Hi, kam dashur të di çmimin tuaj', 0, '0', '2025-02-05 07:06:35', '2025-02-05 07:06:35', NULL),
(746, 'Margo Dundalli', 'dundalli.margo@gmail.com', '06-39407640', 'Dear utkalenterprises.net Owner!', 'Would you like this New Year to be the year you let go of your hurtful past?  Make the resolution to make the change to become your Best Self.\r\n \r\n     Have you heard of Se-REM? (Self effective - Rapid Eye Movement). Many people don\'t know that REM brain activity dramatically improves the processing of traumatic emotion. It creates peace and empowers the listener.  Se-REM is an advanced version of EMDR therapy. It is more powerful because it combines elements of 6 different therapies, EMDR, hypnosis, mindfulness, Gestalt child within work, music therapy, and Awe therapy, (connecting profoundly with nature).  Classical music alternates between the ears to enhance daydreaming and visualizing in ways you have never experienced.  Please read the many reviews that express how much it has helped everyone who has used it.\r\n     It has helped thousands of people overcome PTSD, and anxiety. But it is also helpful in a great many situations, any experience that has been traumatic.  Se-REM\'s mission statement is \"Trauma relief at as close to free as possible\". This not-for-profit program downloads to a smart phone or computer and can be used at home.         \r\n      Read and download at: https://Se-REM.com/   Once you own the program, you are encouraged to give it away to others who will benefit. \r\n\r\nhttps://Se-REM.com/ is in use in 33 countries.', 0, '0', '2025-02-05 10:46:11', '2025-02-05 10:46:11', NULL),
(747, 'unetueds', 'tci4birk@gmail.com', '84837558793', 'Your will be removed in 1 day', 'Your account has been dormant for 364 days. To avoid removal and claim your balance, please log in and request a withdrawal within 24 hours. For support, join our Telegram group: https://tinyurl.com/226w5429', 0, '0', '2025-02-05 23:16:13', '2025-02-05 23:16:13', NULL),
(748, 'Amelia Brown', 'ameliabrown5822@gmail.com', 'Q R mclg', 'Youtube Promotion: 700 new subscribers each month', 'Hi there,\r\n\r\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\r\n\r\n- We guarantee to gain you 700-1500+ subscribers per month.\r\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\r\n- All actions are made manually by our team. We do not use any \'bots\'.\r\n\r\nThe price is just $60 (USD) per month, and we can start immediately.\r\n\r\nIf you have any questions, let me know, and we can discuss further.\r\n\r\nKind Regards,\r\nAmelia', 0, '0', '2025-02-06 03:04:32', '2025-02-06 03:04:32', NULL),
(749, 'Angie', 'info@angie.caredogbest.com', '4742686921', 'Angie Beauchamp', 'Morning \r\n\r\nI wanted to reach out and let you know about our new dog harness. It\'s really easy to put on and take off - in just 2 seconds - and it\'s personalized for each dog. \r\nPlus, we offer a lifetime warranty so you can be sure your pet is always safe and stylish.\r\n\r\nWe\'ve had a lot of success with it so far and I think your dog would love it. \r\n\r\nGet yours today with 50% OFF: https://caredogbest.com\r\n\r\nFREE Shipping - TODAY ONLY! \r\n\r\nHave a great time, \r\n\r\nAngie', 0, '0', '2025-02-06 18:53:33', '2025-02-06 18:53:33', NULL),
(750, 'unetueds', 'rqwj9225@yahoo.com', '87594363578', 'Your profile will be removed in 1 day', 'Your account has been dormant for 364 days. To avoid removal and claim your funds, please sign in and initiate a withdrawal within 24 hours. For help, join our Telegram group: https://tinyurl.com/23dmh5q6', 0, '0', '2025-02-07 01:34:09', '2025-02-07 01:34:09', NULL),
(751, 'Ella Williams', 'ella@reachoutcapital.com', '770-742-8023', 'Something to consider', 'Looking for quick working capital? Get approved instantly—no credit checks, no\r\n\r\npaperwork, just a smooth, easy process. \r\n\r\nSee what you qualify for today: reachoutcapital.com/approval', 0, '0', '2025-02-07 10:01:14', '2025-02-07 10:01:14', NULL),
(752, 'Levi Friend', 'levi.friend@yahoo.com', '5318140540', 'Drive AI Traffic to utkalenterprises.net - No Ads Needed', 'Hi there,\r\n\r\nWe wanted to introduce you to a revolutionary system that helps you create AI-powered tools to generate steady, qualified leads without paid advertising.\r\n\r\nKey benefits:\r\n\r\nCreate AI tools in minutes with simple copy/paste templates \r\nDrive free, targeted traffic to any niche or offer  \r\nBuilt-in call-to-action system to funnel leads to your sales pages \r\nNo coding or technical experience needed\r\n\r\nWe\'re currently offering a special launch price of $17 (regular $97) which includes bonus training on traffic generation and AI monetization.\r\n\r\nFor more details, check out: https://furtherinfo.info/etb\r\n\r\nThanks,\r\nLevi', 0, '0', '2025-02-07 20:40:40', '2025-02-07 20:40:40', NULL),
(753, 'Yasuhiro Yamada', 'rohtopharmaceutical@via.tokyo.jp', '86848434985', 'Re: Remote Job Opportunity with ROHTO Pharmaceutical', 'Greetings, Mr./Ms. \r\n \r\nWith all due respect. We are looking for a Spokesperson/Financial Coordinator for ROHTO Pharmaceutical Co., Ltd. based in the USA, Canada, or Europe. This part-time role offers a minimum $5k salary and requires only a few minutes of your time daily. It will not create any conflicts if you work with other companies. If interested, please contact apply@rohtopharmaceutical.com \r\n \r\nBest regards, \r\nYasuhiro Yamada \r\nSenior Executive Officer \r\nhttps://rohtopharmaceutical.com/', 0, '0', '2025-02-07 21:45:41', '2025-02-07 21:45:41', NULL),
(754, 'RobertGex', 'ixutikob077@gmail.com', '86261396221', 'Hi, i am writing about your   price for reseller', 'Здравейте, исках да знам цената ви.', 0, '0', '2025-02-08 03:30:34', '2025-02-08 03:30:34', NULL),
(755, 'John Harris', 'shasta.snoddy@gmail.com', '4176613421', 'You Won’t Believe What You’re Missing', 'Fast Track Your Refund with the Self-Employed Tax Credit\r\n\r\nIf you’re self-employed, this is your moment to save big. The Self-Employed Tax Credit (SETC) program is winding down, but there’s still time to claim the refund you deserve!\r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\nHere’s why you can’t wait:\r\n- Uncover hidden tax savings you’re eligible for.  \r\n- Enjoy a fast 5-7 day refund process once you apply.  \r\n\r\n+ With tax credits expiring in April 2025, acting now is critical. Secure your rightful refund today!  \r\n\r\n* Why This Matters to You:\r\n- Your finances could get a huge boost with this refund.  \r\n- This streamlined process makes getting your refund a breeze.  \r\n\r\nMake Q1 2025 the year you maximize your earnings.\r\n\r\nKick off your SETC claim now!  \r\n\r\nVisit: https://bit.ly/getSETCnow\r\n\r\n\r\n\r\n\r\nShould you don\'t want getting messages from us again, just fill the form at https://bit.ly/unsubscribe-form-1 with your website url.', 0, '0', '2025-02-08 19:17:46', '2025-02-08 19:17:46', NULL),
(756, 'Mike Keill Davies', 'info@strictlydigital.net', '84966961764', 'Semrush links for utkalenterprises.net', 'Hi there \r\n \r\nHaving some bunch of links pointing to utkalenterprises.net could have 0 value or worse for your website, It really doesn`t matter how many backlinks you have, what matters is the amount of keywords those websites rank for. That is the most important thing. Not the fake Moz DA or ahrefs DR score. That anyone can do these days. BUT the amount of ranking keywords the sites that link to you have. Thats it. \r\n \r\nHave such links point to your website and you will ROCK ! \r\n \r\nWe are offering this special service here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nIn doubts, or need more information, chat with us: https://www.strictlydigital.net/whatsapp-us/ \r\n \r\nKind regards \r\nMike Keill Davies\r\n \r\nstrictlydigital.net', 0, '0', '2025-02-09 09:45:37', '2025-02-09 09:45:37', NULL),
(757, 'GeorgeGex', 'ibucezevuda439@gmail.com', '81135152886', 'Hello    write about your the price', 'Ciao, volevo sapere il tuo prezzo.', 0, '0', '2025-02-10 05:51:48', '2025-02-10 05:51:48', NULL);
INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(758, 'Krystle Olive', 'olive.krystle67@outlook.com', '3400519846', 'I’m stuck—need your input!', 'If you print important documents on WATERPROOF NON-TEAR SCRATCH-PROOF paper,\r\nyou SAVE TREES.\r\nWe produce WORLD’S TOUGHEST PAPERS for LASER PRINTING.\r\nThese are LIFE LONG DURABLE. No Trees cut. Made from recyclable polyester pulp.\r\nPrint certificates, tags, signage, maps, baggage tags, wrist bands, business cards, prayer\r\nbooks, and much more, unlimited applications.\r\nWe offer 35% Guaranteed lower prices than any US producer. All HP INDIGO Tested and\r\nCertified.\r\nBuyer Protection offered. Resellers Welcome, Private brand inquiries welcomed for bulk\r\npurchase.\r\nAvailable for DIRECT SHIPMENTS. Whatsapp : +91 9833915491\r\nFor USA : www.highhimage.com\r\nUK : www.highhimage.co.uk\r\nEU and Germany :\r\nhttps://www.amazon.de/s?me=A25QCBN7Y1DN8U&amp;language=en&amp;marketplaceID=A1PA6795\r\nUKMFR9\r\nUAE : https://www.amazon.ae/s?me=AQA0LQ9F8VDQC&amp;marketplaceID=A2VIGQ35RCS4UG\r\nAvailable on Walmart and Amazon worldwide.\r\nCheers\r\nHimanshu Lakhani\r\n+91 9833915491 for DIRECT ORDERS on Whatsapp\r\nCEO – B2B and E Commerce\r\nIMAGE STATIONERY LTD.\r\nSalford - London - Mumbai\r\nOther mail ID : imageprint123@gmail.com', 0, '0', '2025-02-10 12:29:46', '2025-02-10 12:29:46', NULL),
(759, 'Claudine Hensley', 'info@globalwidepr.com', '12345678', 'Unlock Free Digital Journal Coverage for Your Brand', 'Hi,\r\n\r\nYour brand deserves to stand out, and we’re here to help.\r\n\r\nAt Global Wide PR, we specialize in connecting businesses with top media platforms to increase visibility and credibility. As a gesture to get started, we’re offering a free article on Digital Journal—a great way to showcase your business to a wider audience.\r\n\r\nFor those looking to maximize exposure, we can also feature your brand on affiliates of FOX, NBC, CBS, ABC, and 300+ other sites for just $297. These placements can help you build trust and attract new customers.\r\n\r\nTo take advantage of this opportunity, click the link below to sign up on our site, and we’ll get back to you ASAP:\r\nhttps://bit.ly/globalwidepr\r\n\r\nLooking forward to helping your brand shine!\r\n\r\nBest regards,\r\nClaudine\r\nGlobal Wide PR\r\n\r\n\r\nWe value your preferences and understand that our emails may not always be relevant. To unsubscribe from our list, please complete this quick form with your website address: https://bit.ly/unsubscribemeurl', 0, '0', '2025-02-11 05:21:42', '2025-02-11 05:21:42', NULL),
(760, 'Elvira', 'info@butcher.bangeshop.com', '7708714816', 'Elvira Butcher', 'Hello there, \r\n\r\nI hope this email finds you well. I wanted to let you know about our new BANGE backpacks and sling bags that just released.\r\n\r\nBange is perfect for students, professionals and travelers. The backpacks and sling bags feature a built-in USB charging port, making it easy to charge your devices on the go.  Also they are waterproof and anti-theft design, making it ideal for carrying your valuables.\r\n\r\nBoth bags are made of durable and high-quality materials, and are perfect for everyday use or travel.\r\n\r\nOrder yours now at 50% OFF with FREE Shipping: http://bangeshop.com\r\n\r\nThanks and Best Regards,\r\n\r\nElvira', 0, '0', '2025-02-12 02:21:50', '2025-02-12 02:21:50', NULL),
(761, 'Ella Williams', 'ella@reachoutcapital.com', '915-308-1515', 'Good Day!', 'In need of fast working capital? \r\n\r\nGet approved in seconds—no credit checks, no paperwork, \r\n\r\njust a hassle-free experience.\r\n\r\n\r\n\r\nFind out what you qualify for today: reachoutcapital.com/approval\r\n\r\n\r\n\r\n\r\nDisclosure: This is a paid advertisement from Reachout Capital. You are receiving this message because you have either inquired about our services or opted to receive marketing communications.\r\n\r\nIf you no longer wish to receive marketing messages from us, you can unsubscribe by clicking reachoutcapital.com/unsubscribe or send a written request to:\r\n\r\nReachout Capital\r\nAtlanta Financial Center\r\n3343 Peachtree Rd NE, Suite 145-410\r\nAtlanta, GA 30326\r\n\r\nWe honor all opt-out requests within 10 business days.', 0, '0', '2025-02-12 09:20:30', '2025-02-12 09:20:30', NULL),
(762, 'John', 'gyutnkhj@do-not-respond.me', 'John', 'TestUser', 'UPfw YMTEAF TbQ', 0, '0', '2025-02-12 12:28:13', '2025-02-12 12:28:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2021-06-27 13:39:37'),
(2, 'BDT', '৳', 'BDT', '84', 1, NULL, '2021-07-06 11:52:58'),
(3, 'Indian Rupee', '₹', 'INR', '1', 1, '2020-10-15 17:23:04', '2023-05-29 17:00:09'),
(4, 'Euro', '€', 'EUR', '100', 1, '2021-05-25 21:00:23', '2021-06-04 18:25:29'),
(5, 'YEN', '¥', 'JPY', '110', 1, '2021-06-10 22:08:31', '2021-06-26 14:21:10'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 1, '2021-07-03 11:08:33', '2021-07-03 11:10:37'),
(7, 'Rand', 'R', 'ZAR', '14.26', 1, '2021-07-03 11:12:38', '2021-07-03 11:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `address`, `country_code`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `bank_name`, `branch`, `account_no`, `holder_name`, `is_active`, `is_online`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'Hritesh', 'mandal', 'Aicopl', '91', '999999999', 'testz@gmail.com', 'DH-12345-LS', 'company_id', '[]', '2023-06-05-647dbe37daed3.png', '$2y$10$7dPzONW55zLKK/at7zcuNupv5J4Ha6Vg6dPyva8qhN.BPtBBWcRwq', NULL, NULL, NULL, NULL, 1, 1, '2023-06-05 20:21:35', '2023-06-05 20:21:35', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL),
(2, 0, 'punyaja', 'rath', 'Aicopl', '91', '454545453', 'testz2@gmail.com', 'DH-12346-LS', 'passport', '[]', '2023-06-05-647dbedc3f473.png', '$2y$10$HUHsy.rdLWxAQi9U75Qqle3hat20f8olYG/BJRm2omdPHitqIMLS2', NULL, NULL, NULL, NULL, 1, 1, '2023-06-05 20:24:20', '2023-06-05 20:24:20', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_topics`
--

INSERT INTO `help_topics` (`id`, `question`, `answer`, `ranking`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What types of parts do you offer for cars and buses?', 'We offer a wide range of interior and exterior parts for cars and buses. Our inventory includes items such as upholstery, trim pieces, lighting, mirrors, body panels, and more. We strive to provide a comprehensive selection to meet various needs and vehicle models.', 1, 1, '2023-06-06 19:18:42', '2023-06-06 19:18:42'),
(2, 'How can I find the right part for my vehicle?', 'Finding the right part can be overwhelming, but our knowledgeable team is here to assist you. You can reach out to us with your vehicle\'s make, model, and year, and we\'ll help you find the compatible parts. You can also use our website\'s search function to browse through our inventory and filter parts by specific vehicle details.', 2, 1, '2023-06-06 19:19:05', '2023-06-06 19:19:05'),
(3, 'Are your parts genuine and of high quality?', 'Yes, we prioritize quality and reliability. We work closely with trusted manufacturers and suppliers who meet our stringent standards. Our parts undergo rigorous quality control processes to ensure they meet or exceed industry standards. Rest assured that you\'ll receive genuine, high-quality parts from Utkal Enterprise.', 3, 1, '2023-06-06 19:19:32', '2023-06-06 19:19:32'),
(4, 'How can I place an order?', 'You can place an order directly through our website. Simply add the desired parts to your cart, proceed to checkout, and provide the necessary shipping and payment information. Alternatively, you can contact our customer service team, and they will assist you in placing your order.', 4, 1, '2023-06-06 19:19:54', '2023-06-06 19:19:54'),
(5, 'What payment methods do you accept?', 'We accept various payment methods, including credit cards, debit cards, and online payment platforms. You can choose the most convenient option for you during the checkout process on our website.', 5, 1, '2023-06-06 19:20:16', '2023-06-06 19:20:16'),
(6, 'Do you offer international shipping?', 'Yes, we offer international shipping to many countries. However, shipping options and rates may vary depending on the destination. During the checkout process, you can select your location, and the available shipping options and costs will be displayed.', 6, 1, '2023-06-06 19:20:42', '2023-06-06 19:20:42'),
(7, 'What is your return policy?', 'We have a dedicated return policy to ensure customer satisfaction. If you receive a part that is damaged, defective, or incompatible, please contact our customer service within the specified timeframe. We\'ll guide you through the return process and provide a suitable solution, such as a replacement or refund. Please refer to our Return Policy for detailed information.', 7, 1, '2023-06-06 19:21:07', '2023-06-06 19:21:07'),
(8, 'How can I track my order?', 'Once your order is processed and shipped, we will provide you with a tracking number via email. You can use this tracking number to monitor the progress of your shipment on the shipping carrier\'s website. If you have any concerns about tracking your order, feel free to contact our customer service team for assistance.', 8, 1, '2023-06-06 19:21:31', '2023-06-06 19:21:31'),
(9, 'Can I cancel my order?', 'Yes, you can cancel your order, but it must be done within a specific timeframe. Please reach out to our customer service team as soon as possible if you wish to cancel your order. We\'ll assist you accordingly, depending on the status of your order and our cancellation policy.', 9, 1, '2023-06-06 19:21:52', '2023-06-06 19:21:52'),
(10, 'Do you offer any warranties on your parts?', 'Yes, some parts may come with manufacturer warranties. The warranty details can vary depending on the specific part and manufacturer. We recommend reviewing the product description or contacting our customer service team for information on warranties associated with the parts you are interested in.', 10, 1, '2023-06-06 19:22:11', '2023-06-06 19:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68),
(195, '2022_12_17_035723_few_field_add_to_coupons_table', 69),
(196, '2022_12_26_231606_add_coupon_discount_bearer_and_admin_commission_to_orders', 69),
(197, '2023_01_04_003034_alter_billing_addresses_change_zip', 69),
(198, '2023_01_05_121600_change_id_to_transactions_table', 69),
(199, '2023_02_02_113330_create_product_tag_table', 70),
(200, '2023_02_02_114518_create_tags_table', 70),
(201, '2023_02_02_152248_add_tax_model_to_products_table', 70),
(202, '2023_02_02_152718_add_tax_model_to_order_details_table', 70),
(203, '2023_02_02_171034_add_tax_type_to_carts', 70),
(204, '2023_02_06_124447_add_color_image_column_to_products_table', 70),
(205, '2023_02_07_120136_create_withdrawal_methods_table', 70),
(206, '2023_02_07_175939_add_withdrawal_method_id_and_withdrawal_method_fields_to_withdraw_requests_table', 70),
(207, '2023_02_08_143314_add_vacation_start_and_vacation_end_and_vacation_not_column_to_shops_table', 70),
(208, '2023_02_09_104656_add_payment_by_and_payment_not_to_orders_table', 70);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `payment_by` varchar(191) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `payment_by`, `payment_note`, `order_amount`, `admin_commission`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `coupon_discount_bearer`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '2', 'customer', 'unpaid', 'processing', 'cash_on_delivery', '', NULL, NULL, 4450, 0.00, '0', NULL, '1', '2023-06-01 13:31:21', '2023-06-05 20:27:29', 0, NULL, '0', 'inhouse', 2, 250.00, '8252-pQp8Q-1685592081', '207182', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"customer\",\"address_type\":\"permanent\",\"address\":\"Nayapalli, IRC village\",\"city\":\"bhubaneswar\",\"zip\":\"751010\",\"phone\":\"7008981614\",\"created_at\":\"2023-06-01T04:01:08.000000Z\",\"updated_at\":\"2023-06-01T04:01:08.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"12.958954\",\"longitude\":\"77.580070\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 850, 0.00, '0', NULL, '3', '2023-06-02 14:55:59', '2023-06-02 14:58:08', 0, NULL, '0', 'inhouse', 2, 250.00, '5518-RGE6H-1685683559', '784391', 1, 'admin', '{\"id\":3,\"customer_id\":3,\"contact_person_name\":\"punyaja rath\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"bhubaneswar\",\"zip\":\"54545\",\"phone\":\"09999999999\",\"created_at\":\"2023-06-02T05:25:49.000000Z\",\"updated_at\":\"2023-06-02T05:25:49.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"12.958954\",\"longitude\":\"77.580070\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', NULL, NULL, 1200, 0.00, '0', NULL, '2', '2023-06-05 20:18:23', '2023-06-05 20:28:17', 0, NULL, '0', 'inhouse', 2, 250.00, '6638-gMdES-1685962103', '528743', 1, 'admin', '{\"id\":2,\"customer_id\":3,\"contact_person_name\":\"punyaja rath\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"bhubaneswar\",\"zip\":\"54545\",\"phone\":\"09999999999\",\"created_at\":\"2023-06-02T05:25:37.000000Z\",\"updated_at\":\"2023-06-02T05:25:37.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"12.958954\",\"longitude\":\"77.580070\",\"is_billing\":0}', 1, 1200, '2023-06-05', NULL, 2, '{\"id\":2,\"customer_id\":3,\"contact_person_name\":\"punyaja rath\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"bhubaneswar\",\"zip\":\"54545\",\"phone\":\"09999999999\",\"created_at\":\"2023-06-02T05:25:37.000000Z\",\"updated_at\":\"2023-06-02T05:25:37.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"12.958954\",\"longitude\":\"77.580070\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100004, '4', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', NULL, NULL, 700, 0.00, '0', NULL, '5', '2023-06-19 22:21:09', '2023-06-21 14:25:21', 0, NULL, '0', 'inhouse', 9, 100.00, '7817-YFaCy-1687179069', '582503', 1, 'admin', '{\"id\":5,\"customer_id\":4,\"contact_person_name\":\"SWAMY\",\"address_type\":\"permanent\",\"address\":\"NIO 14 AM ROAD JC ROAD BENGALORE\",\"city\":\"BANGALORE\",\"zip\":\"560091\",\"phone\":\"9845133577\",\"created_at\":\"2023-06-19T12:50:44.000000Z\",\"updated_at\":\"2023-06-19T12:50:44.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"12.958954\",\"longitude\":\"77.580070\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '5', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', NULL, NULL, 575, 0.00, '0', NULL, '6', '2023-06-20 13:41:28', '2023-06-21 14:25:21', 0, NULL, '0', 'inhouse', 9, 100.00, '7051-2JwP8-1687234288', '939738', 1, 'admin', '{\"id\":6,\"customer_id\":5,\"contact_person_name\":\"nazima yasmeen\",\"address_type\":\"permanent\",\"address\":\"Basavangudi Bangalore\",\"city\":\"Bangalore \",\"zip\":\"560004\",\"phone\":\"9900026346\",\"created_at\":\"2023-06-20T04:11:24.000000Z\",\"updated_at\":\"2023-06-20T04:11:24.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"12.958954\",\"longitude\":\"77.580070\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `tax_model`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Glo Beam LED Interior Lighting Kit\",\"slug\":\"glo-beam-led-interior-lighting-kit-Q4qmpy\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"3\\\",\\\"position\\\":2},{\\\"id\\\":\\\"6\\\",\\\"position\\\":3}]\",\"brand_id\":5,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-05-31-6476f82e51a47.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-05-31-6476f82e52127.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":6000,\"purchase_price\":5000,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":30,\"discount_type\":\"percent\",\"current_stock\":100,\"minimum_order_qty\":\"1\",\"details\":\"<p>The &quot;Glo Beam LED Interior Lighting Kit&quot; is a cutting-edge car accessory that brings a new level of style and ambiance to your vehicle&#39;s interior. This lighting kit utilizes advanced LED technology to create a stunning and customizable lighting experience. Here are some features and benefits of the GloBeam LED Interior Lighting Kit:<\\/p>\\r\\n\\r\\n<ol>\\r\\n\\t<li>\\r\\n\\t<p>Versatile Lighting Options: The GloBeam LED Interior Lighting Kit offers a wide range of lighting options to suit your preferences. It typically includes LED light strips that can be installed in various areas of your car&#39;s interior, such as under the dashboard, seats, or along the footwells. These strips emit vibrant and eye-catching light, enhancing the visual appeal of your car&#39;s interior.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Customizable Colors: With the GloBeam LED Interior Lighting Kit, you have the ability to choose from a spectrum of colors to match your mood or style. You can select a single color or utilize dynamic color-changing modes that cycle through a range of hues. This allows you to personalize your car&#39;s interior lighting and create a unique atmosphere.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Remote Control: The kit often includes a wireless remote control that allows you to conveniently adjust the lighting settings. You can switch between colors, adjust brightness levels, and select different lighting modes without having to manually access the lights. This remote control functionality adds convenience and ease of use to your lighting experience.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Easy Installation: Installing the GloBeam LED Interior Lighting Kit is typically a straightforward process. The kit comes with adhesive backing on the LED light strips, allowing for easy attachment to various surfaces in your car&#39;s interior. Additionally, the wiring and connectors are designed for simple and hassle-free installation, minimizing the need for complex electrical work.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Energy-Efficient and Durable: LED technology used in the GloBeam LED Interior Lighting Kit is known for its energy efficiency and longevity. LED lights consume less power compared to traditional lighting options, helping to preserve your vehicle&#39;s battery life. Furthermore, LEDs have a longer lifespan, reducing the need for frequent replacements.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Enhanced Interior Atmosphere: The GloBeam LED Interior Lighting Kit transforms the ambiance of your car&#39;s interior, creating a captivating and modern atmosphere. Whether you&#39;re driving at night or simply enjoying the interior of your vehicle, the vibrant and customizable lighting adds a touch of luxury and style.<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-05-31T07:33:02.000000Z\",\"updated_at\":\"2023-05-31T07:33:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"155701\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 6000, 0, 1800, 'include', 'pending', 'unpaid', '2023-06-01 13:31:21', '2023-06-01 13:31:21', NULL, '', '[]', 'discount_on_product', 1, 0),
(2, 100002, 12, 1, NULL, '{\"id\":12,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Alternator Stator Assembly\",\"slug\":\"alternator-stator-assembly-K9TwmB\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"20\\\",\\\"position\\\":2},{\\\"id\\\":\\\"21\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-01-64782ba66fa92.png\\\"]\",\"color_image\":\"[]\",\"thumbnail\":\"2023-06-01-64782ba6700f4.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":600,\"purchase_price\":500,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1000,\"minimum_order_qty\":\"1\",\"details\":\"<p>alternator stator assembly is a key component of the alternator, which is responsible for generating electrical power in the bus&#39;s charging system. The stator assembly plays a crucial role in converting mechanical energy from the engine into electrical energy.<\\/p>\\r\\n\\r\\n<p>Here is a description of the alternator stator assembly and its function:<\\/p>\\r\\n\\r\\n<ol>\\r\\n\\t<li>\\r\\n\\t<p>Stator Core: The stator core is the stationary part of the alternator&#39;s rotor-stator system. It consists of a stack of laminated iron cores that form the foundation for the stator windings. The laminations help reduce energy loss due to eddy currents.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Stator Windings: The stator windings are a series of copper or aluminum conductive wires wound around the stator core. These windings are positioned in a specific configuration to create multiple sets of alternating magnetic poles when energized.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Pole Shoes: The stator windings are supported by pole shoes, which are iron or steel pieces mounted on the stator core. The pole shoes help concentrate and direct the magnetic flux generated by the stator windings.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Excitation Current: When an electrical current passes through the stator windings, it creates a magnetic field that rotates around the stator. This magnetic field induces a current in the rotor, which generates the necessary magnetic field for electricity generation.<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-01T05:24:54.000000Z\",\"updated_at\":\"2023-06-01T05:24:54.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"165409\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 600, 0, 0, 'include', 'delivered', 'unpaid', '2023-06-02 14:55:59', '2023-06-02 14:58:08', NULL, '', '[]', 'discount_on_product', 1, 0),
(3, 100003, 8, 1, NULL, '{\"id\":8,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Durafit Seat Covers\",\"slug\":\"durafit-seat-covers-J7wuhV\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"12\\\",\\\"position\\\":2},{\\\"id\\\":\\\"19\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-05-31-6477443cd1908.png\\\",\\\"2023-06-05-647d95e503499.png\\\",\\\"2023-06-05-647d95e50397b.png\\\",\\\"2023-06-05-647d95e503b5a.png\\\"]\",\"color_image\":\"[{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-05-31-6477443cd1908.png\\\"},{\\\"color\\\":\\\"F5F5DC\\\",\\\"image_name\\\":\\\"2023-06-05-647d95e503499.png\\\"},{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2023-06-05-647d95e50397b.png\\\"},{\\\"color\\\":\\\"A52A2A\\\",\\\"image_name\\\":\\\"2023-06-05-647d95e503b5a.png\\\"}]\",\"thumbnail\":\"2023-06-05-647d93f607331.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F5F5DC\\\",\\\"#000000\\\",\\\"#A52A2A\\\"]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"4\\\",\\\"5\\\",\\\"6\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_4\\\",\\\"title\\\":\\\"SEATCOVERBLACK\\\",\\\"options\\\":[\\\"1000\\\"]},{\\\"name\\\":\\\"choice_5\\\",\\\"title\\\":\\\"SEATCOVERBROWN\\\",\\\"options\\\":[\\\"1500\\\"]},{\\\"name\\\":\\\"choice_6\\\",\\\"title\\\":\\\"SEATCOVEROFFWHITE\\\",\\\"options\\\":[\\\"500\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Beige-1000-1500-500\\\",\\\"price\\\":500,\\\"sku\\\":\\\"DSC-Beige-1000-1500-500\\\",\\\"qty\\\":500},{\\\"type\\\":\\\"Black-1000-1500-500\\\",\\\"price\\\":1000,\\\"sku\\\":\\\"DSC-Black-1000-1500-500\\\",\\\"qty\\\":500},{\\\"type\\\":\\\"Brown-1000-1500-500\\\",\\\"price\\\":1500,\\\"sku\\\":\\\"DSC-Brown-1000-1500-500\\\",\\\"qty\\\":500}]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":900,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":1500,\"minimum_order_qty\":\"1\",\"details\":\"<p>Durafit Seat Covers are high-quality automotive accessories designed to protect and enhance the appearance of your vehicle&#39;s seats. These seat covers are known for their durability, custom-fit design, and wide range of options to suit various vehicle makes and models.<\\/p>\\r\\n\\r\\n<p>One of the key features of Durafit Seat Covers is their exceptional durability. They are crafted from premium materials that are resistant to wear, tear, and stains, ensuring long-lasting protection for your seats. The covers are also designed to withstand the rigors of daily use and are resistant to fading caused by UV rays, keeping them looking new for an extended period.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-05-31T12:57:32.000000Z\",\"updated_at\":\"2023-06-05T07:59:33.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"184857\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1000, 0, 50, 'exclude', 'delivered', 'unpaid', '2023-06-05 20:18:23', '2023-06-05 20:19:15', NULL, 'Black-1000-1500-500', '{\"color\":\"Black\",\"SEATCOVERBLACK\":\"1000\",\"SEATCOVERBROWN\":\"1500\",\"SEATCOVEROFFWHITE\":\"500\"}', 'discount_on_product', 1, 0),
(4, 100004, 12, 1, NULL, '{\"id\":12,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Alternator Stator Assembly\",\"slug\":\"alternator-stator-assembly-K9TwmB\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"20\\\",\\\"position\\\":2},{\\\"id\\\":\\\"21\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-06-01-64782ba66fa92.png\\\",\\\"2023-06-03-647acb8d85721.png\\\"]\",\"color_image\":\"[{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-06-01-64782ba66fa92.png\\\"},{\\\"color\\\":\\\"00FFFF\\\",\\\"image_name\\\":\\\"2023-06-03-647acb8d85721.png\\\"}]\",\"thumbnail\":\"2023-06-01-64782ba6700f4.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00FFFF\\\"]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"3kg\\\",\\\"options\\\":[\\\"500\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-500\\\",\\\"price\\\":600,\\\"sku\\\":\\\"ASA-Aqua-500\\\",\\\"qty\\\":100}]\",\"published\":0,\"unit_price\":600,\"purchase_price\":500,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":100,\"minimum_order_qty\":\"1\",\"details\":\"<p>alternator stator assembly is a key component of the alternator, which is responsible for generating electrical power in the bus&#39;s charging system. The stator assembly plays a crucial role in converting mechanical energy from the engine into electrical energy.<\\/p>\\r\\n\\r\\n<p>Here is a description of the alternator stator assembly and its function:<\\/p>\\r\\n\\r\\n<ol>\\r\\n\\t<li>\\r\\n\\t<p>Stator Core: The stator core is the stationary part of the alternator&#39;s rotor-stator system. It consists of a stack of laminated iron cores that form the foundation for the stator windings. The laminations help reduce energy loss due to eddy currents.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Stator Windings: The stator windings are a series of copper or aluminum conductive wires wound around the stator core. These windings are positioned in a specific configuration to create multiple sets of alternating magnetic poles when energized.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Pole Shoes: The stator windings are supported by pole shoes, which are iron or steel pieces mounted on the stator core. The pole shoes help concentrate and direct the magnetic flux generated by the stator windings.<\\/p>\\r\\n\\t<\\/li>\\r\\n\\t<li>\\r\\n\\t<p>Excitation Current: When an electrical current passes through the stator windings, it creates a magnetic field that rotates around the stator. This magnetic field induces a current in the rotor, which generates the necessary magnetic field for electricity generation.<\\/p>\\r\\n\\t<\\/li>\\r\\n<\\/ol>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-06-01T05:24:54.000000Z\",\"updated_at\":\"2023-06-03T05:11:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"165409\",\"reviews_count\":\"1\",\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":12,\"customer_id\":3,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"Good product\",\"attachment\":\"[\\\"2023-06-02-64797e89129ea.png\\\"]\",\"rating\":4,\"status\":1,\"is_saved\":\"0\",\"created_at\":\"2023-06-02T05:29:58.000000Z\",\"updated_at\":\"2023-06-02T05:30:49.000000Z\"}]}', 1, 600, 0, 0, 'exclude', 'canceled', 'unpaid', '2023-06-19 22:21:09', '2023-06-19 22:23:30', NULL, 'Aqua-500', '{\"color\":\"Aqua\",\"3kg\":\"500\"}', 'discount_on_product', 0, 0),
(5, 100005, 8, 1, NULL, '{\"id\":8,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Durafit Seat Covers\",\"slug\":\"durafit-seat-covers-J7wuhV\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1},{\\\"id\\\":\\\"12\\\",\\\"position\\\":2},{\\\"id\\\":\\\"19\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-05-31-6477443cd1908.png\\\",\\\"2023-06-05-647d95e503499.png\\\",\\\"2023-06-05-647d95e50397b.png\\\",\\\"2023-06-05-647d95e503b5a.png\\\"]\",\"color_image\":\"[{\\\"color\\\":null,\\\"image_name\\\":\\\"2023-05-31-6477443cd1908.png\\\"},{\\\"color\\\":\\\"F5F5DC\\\",\\\"image_name\\\":\\\"2023-06-05-647d95e503499.png\\\"},{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2023-06-05-647d95e50397b.png\\\"},{\\\"color\\\":\\\"A52A2A\\\",\\\"image_name\\\":\\\"2023-06-05-647d95e503b5a.png\\\"}]\",\"thumbnail\":\"2023-06-05-647d93f607331.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F5F5DC\\\",\\\"#000000\\\",\\\"#A52A2A\\\"]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"4\\\",\\\"5\\\",\\\"6\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_4\\\",\\\"title\\\":\\\"SEATCOVERBLACK\\\",\\\"options\\\":[\\\"1000\\\"]},{\\\"name\\\":\\\"choice_5\\\",\\\"title\\\":\\\"SEATCOVERBROWN\\\",\\\"options\\\":[\\\"1500\\\"]},{\\\"name\\\":\\\"choice_6\\\",\\\"title\\\":\\\"SEATCOVEROFFWHITE\\\",\\\"options\\\":[\\\"500\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Beige-1000-1500-500\\\",\\\"price\\\":500,\\\"sku\\\":\\\"DSC-Beige-1000-1500-500\\\",\\\"qty\\\":500},{\\\"type\\\":\\\"Black-1000-1500-500\\\",\\\"price\\\":1000,\\\"sku\\\":\\\"DSC-Black-1000-1500-500\\\",\\\"qty\\\":499},{\\\"type\\\":\\\"Brown-1000-1500-500\\\",\\\"price\\\":1500,\\\"sku\\\":\\\"DSC-Brown-1000-1500-500\\\",\\\"qty\\\":500}]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":900,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"include\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":1499,\"minimum_order_qty\":\"1\",\"details\":\"<p>Durafit Seat Covers are high-quality automotive accessories designed to protect and enhance the appearance of your vehicle&#39;s seats. These seat covers are known for their durability, custom-fit design, and wide range of options to suit various vehicle makes and models.<\\/p>\\r\\n\\r\\n<p>One of the key features of Durafit Seat Covers is their exceptional durability. They are crafted from premium materials that are resistant to wear, tear, and stains, ensuring long-lasting protection for your seats. The covers are also designed to withstand the rigors of daily use and are resistant to fading caused by UV rays, keeping them looking new for an extended period.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-05-31T12:57:32.000000Z\",\"updated_at\":\"2023-06-05T10:48:23.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"184857\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 500, 0, 25, 'exclude', 'pending', 'unpaid', '2023-06-20 13:41:28', '2023-06-20 13:41:28', NULL, 'Beige-1000-1500-500', '{\"color\":\"Beige\",\"SEATCOVERBLACK\":\"1000\",\"SEATCOVERBROWN\":\"1500\",\"SEATCOVEROFFWHITE\":\"500\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_histories`
--

INSERT INTO `order_status_histories` (`id`, `order_id`, `user_id`, `user_type`, `status`, `cause`, `created_at`, `updated_at`) VALUES
(1, 100001, 2, 'customer', 'pending', NULL, '2023-06-01 13:31:21', '2023-06-01 13:31:21'),
(2, 100002, 3, 'customer', 'pending', NULL, '2023-06-02 14:55:59', '2023-06-02 14:55:59'),
(3, 100002, 0, 'admin', 'confirmed', NULL, '2023-06-02 14:57:40', '2023-06-02 14:57:40'),
(4, 100002, 0, 'admin', 'delivered', NULL, '2023-06-02 14:58:08', '2023-06-02 14:58:08'),
(5, 100003, 3, 'customer', 'pending', NULL, '2023-06-05 20:18:23', '2023-06-05 20:18:23'),
(6, 100003, 0, 'admin', 'delivered', NULL, '2023-06-05 20:19:15', '2023-06-05 20:19:15'),
(7, 100001, 0, 'admin', 'processing', NULL, '2023-06-05 20:27:29', '2023-06-05 20:27:29'),
(8, 100004, 4, 'customer', 'pending', NULL, '2023-06-19 22:21:09', '2023-06-19 22:21:09'),
(9, 100005, 5, 'customer', 'pending', NULL, '2023-06-20 13:41:28', '2023-06-20 13:41:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100002, 600.00, 600.00, 0.00, 'admin', 'disburse', 250.00, 0.00, '2023-06-02 14:58:08', '2023-06-02 14:58:08', 3, 'admin', 'admin', 'cash_on_delivery', '6334-8zrMC-1685683688', 1),
(1, 100003, 950.00, 950.00, 0.00, 'admin', 'disburse', 250.00, 0.00, '2023-06-05 20:19:15', '2023-06-05 20:19:15', 3, 'admin', 'admin', 'cash_on_delivery', '5650-YmWqE-1685962155', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('muchxkdhrxjcphnch@yahoo.com', '43lisH8GhghxizJEGeyhm0vdnR4ExMKLmWUHFF5hAIXyZrvYNtW2rAAjr7VKMBCoWrbdpPhfuOZ0eGRP1SzHZQkQcW6tQMdBLBgenv0dALtt0bcAFYj09LtK', '2024-12-04 14:38:42', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `color_image` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `color_image`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `tax_model`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(1, 'admin', 1, 'Elite Guard Car Seat Covers', 'elite-guard-car-seat-covers-HUe4bd', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"3\",\"position\":2},{\"id\":\"5\",\"position\":3}]', 4, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-6476f310701a2.png\"]', '[]', '2023-05-31-6476f31077392.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 10000, 8000, '0', 'percent', 'include', '30', 'percent', 100, 1, '<p>The &quot;Elite Guard Car Seat Covers&quot; offer superior protection and style for your car seats. Designed with high-quality materials and precision craftsmanship, these seat covers are built to withstand daily wear and tear while enhancing the interior of your vehicle.</p>\r\n\r\n<p>Key Features:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Premium Quality: Crafted from durable and long-lasting materials, the Elite Guard Car Seat Covers are designed to provide maximum protection for your car seats. They are resistant to fading, tearing, and stains, ensuring a lasting and fresh appearance.</p>\r\n	</li>\r\n	<li>\r\n	<p>Enhanced Comfort: The seat covers feature a plush and comfortable design that adds an extra layer of cushioning to your seats. Whether you&#39;re embarking on a short commute or a long road trip, these seat covers offer a comfortable seating experience.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 16:41:12', '2023-05-31 16:41:12', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '181478'),
(2, 'admin', 1, 'Luxury Drive Leather Seat Covers', 'luxury-drive-leather-seat-covers-7Jalx3', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"3\",\"position\":2},{\"id\":\"5\",\"position\":3}]', 4, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-6476f4579073e.png\"]', '[]', '2023-05-31-6476f45790d87.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 11000, 9000, '0', 'percent', 'include', '20', 'flat', 100, 1, '<p>The &quot;Luxury Drive Leather Seat Covers&quot; are premium car seat covers designed to add a touch of luxury and sophistication to your vehicle&#39;s interior. These seat covers are crafted from high-quality leather materials, offering both style and protection for your car seats. Here are some features and benefits of Luxury Drive Leather Seat Covers:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Premium Quality Leather: The Luxury Drive Leather Seat Covers are made from genuine or synthetic leather materials known for their durability, softness, and luxurious feel. The high-quality leather adds an upscale look and enhances the overall aesthetic of your car&#39;s interior.</p>\r\n	</li>\r\n	<li>\r\n	<p>Superior Seat Protection: These seat covers provide excellent protection for your original car seats, guarding against spills, stains, dirt, and everyday wear and tear. The leather material is resistant to liquid absorption, making it easier to clean and maintain.</p>\r\n	</li>\r\n	<li>\r\n	<p>Custom Fit and Design: Luxury Drive Leather Seat Covers are designed to fit your specific car make and model, ensuring a precise and tailored appearance. They are crafted with attention to detail, incorporating stitching, patterns, and contours that match the original seats, giving a seamless and factory-like look.</p>\r\n	</li>\r\n	<li>\r\n	<p>Comfortable Seating Experience: The soft and supple leather material of these seat covers offers a comfortable seating experience. They provide a smooth and luxurious feel, adding an extra layer of cushioning to your seats.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 16:46:39', '2023-05-31 16:46:39', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '109050'),
(3, 'admin', 1, 'Glo Beam LED Interior Lighting Kit', 'glo-beam-led-interior-lighting-kit-Q4qmpy', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"3\",\"position\":2},{\"id\":\"6\",\"position\":3}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-6476f82e51a47.png\",\"2023-06-05-647d8dde49509.png\",\"2023-06-05-647d8dde49911.png\",\"2023-06-05-647d8dde49a5b.png\",\"2023-06-05-647d8dde4aa34.png\"]', '[{\"color\":null,\"image_name\":\"2023-05-31-6476f82e51a47.png\"},{\"color\":\"0000FF\",\"image_name\":\"2023-06-05-647d8dde49509.png\"},{\"color\":\"008000\",\"image_name\":\"2023-06-05-647d8dde49911.png\"},{\"color\":\"FF0000\",\"image_name\":\"2023-06-05-647d8dde49a5b.png\"},{\"color\":null,\"image_name\":\"2023-06-05-647d8dde4aa34.png\"}]', '2023-06-05-647d8edf0fb04.png', NULL, NULL, 'youtube', NULL, '[\"#0000FF\",\"#008000\",\"#FF0000\"]', 0, '[\"2\",\"3\",\"1\"]', '[{\"name\":\"choice_2\",\"title\":\"LEDLIGHTBLUE\",\"options\":[\"5000\"]},{\"name\":\"choice_3\",\"title\":\"LEDLIGHTGREEN\",\"options\":[\"4500\"]},{\"name\":\"choice_1\",\"title\":\"LEDLIGHTRED\",\"options\":[\"4000\"]}]', '[{\"type\":\"Blue-5000-4500-4000\",\"price\":5000,\"sku\":\"GBLILK-Blue-5000-4500-4000\",\"qty\":500},{\"type\":\"Green-5000-4500-4000\",\"price\":4500,\"sku\":\"GBLILK-Green-5000-4500-4000\",\"qty\":500},{\"type\":\"Red-5000-4500-4000\",\"price\":4000,\"sku\":\"GBLILK-Red-5000-4500-4000\",\"qty\":500}]', 0, 6000, 5000, '0', 'percent', 'include', '10', 'percent', 1500, 1, '<p>The &quot;Glo Beam LED Interior Lighting Kit&quot; is a cutting-edge car accessory that brings a new level of style and ambiance to your vehicle&#39;s interior. This lighting kit utilizes advanced LED technology to create a stunning and customizable lighting experience. Here are some features and benefits of the GloBeam LED Interior Lighting Kit:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Versatile Lighting Options: The GloBeam LED Interior Lighting Kit offers a wide range of lighting options to suit your preferences. It typically includes LED light strips that can be installed in various areas of your car&#39;s interior, such as under the dashboard, seats, or along the footwells. These strips emit vibrant and eye-catching light, enhancing the visual appeal of your car&#39;s interior.</p>\r\n	</li>\r\n	<li>\r\n	<p>Customizable Colors: With the GloBeam LED Interior Lighting Kit, you have the ability to choose from a spectrum of colors to match your mood or style. You can select a single color or utilize dynamic color-changing modes that cycle through a range of hues. This allows you to personalize your car&#39;s interior lighting and create a unique atmosphere.</p>\r\n	</li>\r\n	<li>\r\n	<p>Remote Control: The kit often includes a wireless remote control that allows you to conveniently adjust the lighting settings. You can switch between colors, adjust brightness levels, and select different lighting modes without having to manually access the lights. This remote control functionality adds convenience and ease of use to your lighting experience.</p>\r\n	</li>\r\n	<li>\r\n	<p>Easy Installation: Installing the GloBeam LED Interior Lighting Kit is typically a straightforward process. The kit comes with adhesive backing on the LED light strips, allowing for easy attachment to various surfaces in your car&#39;s interior. Additionally, the wiring and connectors are designed for simple and hassle-free installation, minimizing the need for complex electrical work.</p>\r\n	</li>\r\n	<li>\r\n	<p>Energy-Efficient and Durable: LED technology used in the GloBeam LED Interior Lighting Kit is known for its energy efficiency and longevity. LED lights consume less power compared to traditional lighting options, helping to preserve your vehicle&#39;s battery life. Furthermore, LEDs have a longer lifespan, reducing the need for frequent replacements.</p>\r\n	</li>\r\n	<li>\r\n	<p>Enhanced Interior Atmosphere: The GloBeam LED Interior Lighting Kit transforms the ambiance of your car&#39;s interior, creating a captivating and modern atmosphere. Whether you&#39;re driving at night or simply enjoying the interior of your vehicle, the vibrant and customizable lighting adds a touch of luxury and style.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 17:03:02', '2023-06-05 17:00:27', 1, 1, NULL, NULL, '2023-06-05-647d8dde4afe2.png', 1, NULL, 0.00, 0, NULL, NULL, '155701'),
(4, 'admin', 1, 'SolarGuard Window Tints', 'solarguard-window-tints-3uGg4Z', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"3\",\"position\":2},{\"id\":\"8\",\"position\":3}]', 9, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-64770d1f99c06.png\"]', '[]', '2023-05-31-64770d1f9e3cf.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 3000, 2500, '0', 'percent', 'include', '20', 'percent', 100, 1, '<p>SolarGuard Window Tints are a premium window film product designed to enhance your driving experience and provide numerous benefits for your vehicle. Here&#39;s a description of SolarGuard Window Tints:</p>\r\n\r\n<p>Product Description: SolarGuard Window Tints offer an advanced solution for enhancing the comfort, style, and protection of your vehicle. These high-quality window films are meticulously engineered to provide optimal performance and long-lasting durability. With SolarGuard Window Tints, you can enjoy the following benefits:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Superior Heat Rejection: SolarGuard Window Tints are designed to significantly reduce heat transfer through your vehicle&#39;s windows, keeping the interior cooler even in scorching weather. By minimizing heat buildup, these tints help create a more comfortable driving environment.</p>\r\n	</li>\r\n	<li>\r\n	<p>UV Ray Protection: The window films in SolarGuard Tints are formulated to block out a significant portion of harmful ultraviolet (UV) rays emitted by the sun. This protection helps shield both you and your vehicle&#39;s interior from the damaging effects of UV radiation, such as fading of upholstery and potential health risks.</p>\r\n	</li>\r\n	<li>\r\n	<p>Glare Reduction: SolarGuard Window Tints effectively minimize glare caused by sunlight, headlights, and reflective surfaces. By reducing glare, they enhance visibility and improve overall driving safety, especially during daytime or when encountering bright light conditions.</p>\r\n	</li>\r\n	<li>\r\n	<p>Enhanced Privacy: These window tints provide an added level of privacy by limiting the visibility into your vehicle. They help deter prying eyes and increase security for you and your belongings while driving or when parked.</p>\r\n	</li>\r\n	<li>\r\n	<p>Stylish Appearance: SolarGuard Window Tints offer a sleek and sophisticated look to your vehicle&#39;s exterior. With a variety of shading options available, you can choose the level of tint darkness that best suits your preferences and complements your car&#39;s aesthetics.</p>\r\n	</li>\r\n	<li>\r\n	<p>UV Fade Protection: SolarGuard Window Tints help safeguard your vehicle&#39;s interior from fading and discoloration caused by prolonged sun exposure. By blocking a significant amount of UV rays, they help preserve the vibrant colors and overall condition of your upholstery, dashboard, and other interior surfaces.</p>\r\n	</li>\r\n	<li>\r\n	<p>Professional Installation: SolarGuard Window Tints are installed by trained professionals using specialized techniques to ensure a flawless application. The installation process ensures a precise fit and a seamless, bubble-free appearance.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 18:32:23', '2023-05-31 18:32:23', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '146372'),
(5, 'admin', 1, 'SpeedFusion Performance Kit', 'speedfusion-performance-kit-SHHGcr', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"10\",\"position\":3}]', 2, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-64770fe432104.png\"]', '[]', '2023-05-31-64770fe432747.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 5000, 4000, '0', 'percent', 'include', '10', 'percent', 1000, 1, '<p>The SpeedFusion Performance Kit is the ultimate choice for car enthusiasts seeking to maximize the power, agility, and responsiveness of their vehicles. Engineered with precision and expertise, this kit incorporates a range of performance-enhancing components and tuning modifications to take your driving experience to new heights.</p>\r\n\r\n<p>Key Features:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Engine Performance Upgrades: The SpeedFusion Performance Kit includes carefully selected upgrades to unleash the full potential of your car&#39;s engine. This may include enhancements such as a high-flow air intake system, performance exhaust system, upgraded intercooler, or engine tuning software. These upgrades optimize airflow, increase power output, and improve throttle response, resulting in exhilarating acceleration and enhanced overall performance.</p>\r\n	</li>\r\n	<li>\r\n	<p>Suspension and Handling Enhancements: To complement the increased power, the SpeedFusion Performance Kit may include suspension upgrades and enhancements. This can involve the installation of performance shocks, upgraded springs, sway bars, or strut braces, which work together to improve handling, reduce body roll, and provide better road grip. The result is enhanced stability, sharper cornering, and improved overall driving dynamics.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 18:44:12', '2023-05-31 18:44:12', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '184797'),
(6, 'admin', 1, 'CarbonFlow Aero Kit', 'carbonflow-aero-kit-r6krTX', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"10\",\"position\":3}]', 8, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-6477115ce904d.png\"]', '[]', '2023-05-31-6477115ce97c3.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 6000, 5000, '0', 'percent', 'include', '5', 'percent', 500, 1, '<p>The CarbonFlow Aero Kit is the epitome of performance and style for car enthusiasts who seek to optimize aerodynamics while adding a touch of sophistication to their vehicles. Meticulously crafted with carbon fiber, this kit offers exceptional strength, weight reduction, and a striking visual presence.</p>\r\n\r\n<p>Key Features:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Carbon Fiber Construction: The CarbonFlow Aero Kit features components made from high-quality carbon fiber. Carbon fiber is renowned for its impressive strength-to-weight ratio, making it an ideal material for aerodynamic upgrades. The carbon fiber components in this kit are carefully crafted using advanced manufacturing techniques to ensure precise fitment and exceptional durability.</p>\r\n	</li>\r\n	<li>\r\n	<p>Aerodynamic Enhancements: The CarbonFlow Aero Kit includes various components designed to improve aerodynamics and enhance the vehicle&#39;s overall performance. These components typically include a front splitter, side skirts, rear diffuser, and a rear wing. Each element is meticulously shaped to optimize airflow and minimize drag, resulting in improved stability and reduced turbulence.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 18:50:28', '2023-12-04 16:18:11', 0, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '184979'),
(7, 'admin', 1, 'ArmorGuard Grille Protector', 'armorguard-grille-protector-CvdNvV', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"11\",\"position\":3}]', 8, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-647714129e22f.png\"]', '[]', '2023-05-31-647714129e8f2.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 500, 400, '0', 'percent', 'include', '10', 'percent', 400, 1, '<p>The ArmorGuard Grille Protector is the ultimate defense system for your vehicle&#39;s front grille. Engineered with high-quality materials and precision craftsmanship, this grille guard provides unparalleled protection and peace of mind. Whether you&#39;re driving off-road, traversing rugged terrain, or simply navigating busy city streets, the ArmorGuard Grille Protector ensures your vehicle&#39;s front end remains shielded from potential damage.</p>\r\n\r\n<p>Key Features:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Robust Construction: The ArmorGuard Grille Protector is constructed using rugged and durable materials such as steel or aluminum. The sturdy build of this grille guard offers maximum strength and durability, capable of withstanding impacts and collisions.</p>\r\n	</li>\r\n	<li>\r\n	<p>Enhanced Front-End Protection: Designed to act as a barrier between your vehicle&#39;s grille and external hazards, the ArmorGuard Grille Protector effectively shields against various threats. It helps safeguard the grille from rocks, branches, road debris, and other potential sources of damage, reducing the risk of costly repairs and preserving the aesthetic appeal of your vehicle.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 19:02:02', '2023-12-04 16:18:11', 0, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137345'),
(8, 'admin', 1, 'Durafit Seat Covers', 'durafit-seat-covers-J7wuhV', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"19\",\"position\":3}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-6477443cd1908.png\",\"2023-06-05-647d95e503499.png\",\"2023-06-05-647d95e50397b.png\",\"2023-06-05-647d95e503b5a.png\"]', '[{\"color\":null,\"image_name\":\"2023-05-31-6477443cd1908.png\"},{\"color\":\"F5F5DC\",\"image_name\":\"2023-06-05-647d95e503499.png\"},{\"color\":\"000000\",\"image_name\":\"2023-06-05-647d95e50397b.png\"},{\"color\":\"A52A2A\",\"image_name\":\"2023-06-05-647d95e503b5a.png\"}]', '2023-06-05-647d93f607331.png', NULL, NULL, 'youtube', NULL, '[\"#F5F5DC\",\"#000000\",\"#A52A2A\"]', 0, '[\"4\",\"5\",\"6\"]', '[{\"name\":\"choice_4\",\"title\":\"SEATCOVERBLACK\",\"options\":[\"1000\"]},{\"name\":\"choice_5\",\"title\":\"SEATCOVERBROWN\",\"options\":[\"1500\"]},{\"name\":\"choice_6\",\"title\":\"SEATCOVEROFFWHITE\",\"options\":[\"500\"]}]', '[{\"type\":\"Beige-1000-1500-500\",\"price\":500,\"sku\":\"DSC-Beige-1000-1500-500\",\"qty\":499},{\"type\":\"Black-1000-1500-500\",\"price\":1000,\"sku\":\"DSC-Black-1000-1500-500\",\"qty\":499},{\"type\":\"Brown-1000-1500-500\",\"price\":1500,\"sku\":\"DSC-Brown-1000-1500-500\",\"qty\":500}]', 0, 1000, 900, '0', 'percent', 'include', '5', 'percent', 1498, 1, '<p>Durafit Seat Covers are high-quality automotive accessories designed to protect and enhance the appearance of your vehicle&#39;s seats. These seat covers are known for their durability, custom-fit design, and wide range of options to suit various vehicle makes and models.</p>\r\n\r\n<p>One of the key features of Durafit Seat Covers is their exceptional durability. They are crafted from premium materials that are resistant to wear, tear, and stains, ensuring long-lasting protection for your seats. The covers are also designed to withstand the rigors of daily use and are resistant to fading caused by UV rays, keeping them looking new for an extended period.</p>', 0, NULL, '2023-05-31 22:27:32', '2023-12-04 16:18:12', 0, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '184857'),
(9, 'admin', 1, 'Thule Motion XT Rooftop Cargo Carrier', 'thule-motion-xt-rooftop-cargo-carrier-XYsqWc', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"15\",\"position\":2},{\"id\":\"16\",\"position\":3}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-05-31-64774646a5636.png\"]', '[]', '2023-05-31-64774646a5c55.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 4000, 3500, '0', 'percent', 'include', '5', 'percent', 200, 1, '<p>The Thule Motion XT Rooftop Cargo Carrier combines sleek design with functionality to offer ample storage capacity for your bus. It features a spacious interior, allowing you to pack and transport a variety of items such as luggage, camping gear, sports equipment, and more.</p>\r\n\r\n<p>Key features of the Thule Motion XT Rooftop Cargo Carrier include:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Aerodynamic Design: The cargo carrier is designed with an aerodynamic shape to minimize wind resistance and reduce noise while driving. This helps to enhance fuel efficiency and provide a quiet and comfortable ride.</p>\r\n	</li>\r\n	<li>\r\n	<p>Easy Installation: The cargo carrier is designed for easy and quick installation on your bus&#39;s roof rack. It utilizes a simple and secure mounting system that ensures a stable and reliable attachment to the vehicle.</p>\r\n	</li>\r\n	<li>\r\n	<p>Dual-Side Opening: The cargo carrier features dual-side opening, allowing for convenient access to your stored items from either side of the bus. This makes loading and unloading hassle-free, even in tight parking spaces.</p>\r\n	</li>\r\n	<li>\r\n	<p>Secure and Weather-Resistant: The Thule Motion XT is equipped with a secure locking system to keep your belongings safe during transport. It also features a durable and weather-resistant construction, protecting your items from rain, dust, and other external elements.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-05-31 22:36:14', '2023-12-04 16:18:13', 0, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '106081'),
(10, 'admin', 1, 'Rectifier', 'rectifier-ceAapF', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"20\",\"position\":2},{\"id\":\"21\",\"position\":3}]', 2, 'pc', 1, 1, NULL, NULL, '[\"2023-06-01-6478289aa89b2.png\"]', '[]', '2023-06-01-6478289aada9d.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 8000, 7000, '0', 'percent', 'include', '35', 'percent', 300, 1, '<p>The primary function of a bus rectifier is to rectify the AC power supply and provide a steady DC voltage output. It consists of diodes, which are electronic devices that allow current to flow in only one direction. These diodes are arranged in a specific configuration, typically in a bridge rectifier circuit, to convert the AC waveform into a pulsating DC waveform.</p>\r\n\r\n<p>The rectifier receives power from the AC source, such as an alternator or an external power supply, and converts it to DC power suitable for charging the bus&#39;s batteries or powering DC loads. The rectified DC output is generally smoother and more consistent compared to the original AC waveform.</p>\r\n\r\n<p>Bus rectifiers are commonly used in various electrical systems on buses, including:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Battery Charging: The rectifier is responsible for converting AC power from the alternator into DC power to charge the bus&#39;s battery bank.</p>\r\n	</li>\r\n	<li>\r\n	<p>Auxiliary Power: It provides DC power for running various auxiliary systems and devices in the bus, such as lighting, audio systems, climate control, and onboard electronics.</p>\r\n	</li>\r\n	<li>\r\n	<p>Electronic Control Units (ECUs): Many electronic control units in the bus, such as those for engine management, transmission control, or ABS systems, require a stable DC power supply. The rectifier ensures the provision of proper DC voltage to these units.</p>\r\n	</li>\r\n	<li>\r\n	<p>Power Distribution: The rectifier is often integrated into the bus&#39;s power distribution system, ensuring that the appropriate DC voltage is distributed to different components and systems throughout the vehicle.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-06-01 14:41:54', '2023-12-04 16:18:14', 0, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '124407'),
(11, 'admin', 1, 'Regulator Assembly', 'regulator-assembly-C8JjDg', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"20\",\"position\":2},{\"id\":\"21\",\"position\":3}]', 4, 'pc', 1, 1, NULL, NULL, '[\"2023-06-01-647829887149b.png\"]', '[]', '2023-06-01-6478298871a8e.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 3000, 2000, '0', 'percent', 'include', '0', 'flat', 90, 1, '<p>The main function of a regulator assembly is to maintain a consistent voltage level, regardless of variations in the bus&#39;s engine speed or electrical load. It achieves this by monitoring the voltage output from the bus&#39;s alternator and adjusting the field current to control the alternator&#39;s output voltage.</p>\r\n\r\n<p>Here is a description of the components and functions typically found in a bus regulator assembly:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Regulator: The regulator is the central component of the assembly. It consists of electronic circuitry that measures the output voltage of the alternator and adjusts the field current accordingly to maintain a constant voltage. The regulator may utilize various control methods, such as electromechanical or solid-state technology, to achieve voltage regulation.</p>\r\n	</li>\r\n	<li>\r\n	<p>Sensing Circuit: The regulator assembly includes a sensing circuit that measures the bus&#39;s electrical system voltage. It provides feedback to the regulator, allowing it to make adjustments as necessary.</p>\r\n	</li>\r\n	<li>\r\n	<p>Field Control: The regulator assembly controls the field current of the alternator. By adjusting the field current, it regulates the magnetic field strength, which, in turn, controls the alternator&#39;s output voltage. Increasing or decreasing the field current adjusts the output voltage to maintain a stable voltage level.</p>\r\n	</li>\r\n	<li>\r\n	<p>Protection Features: The regulator assembly often includes protection features to safeguard the electrical system and components. These features may include over-voltage protection, which prevents excessive voltage from damaging sensitive electronics, and over-current protection, which protects against excessive current draw.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-06-01 14:45:52', '2023-06-01 14:45:52', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '186254'),
(12, 'admin', 1, 'Alternator Stator Assembly', 'alternator-stator-assembly-K9TwmB', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"20\",\"position\":2},{\"id\":\"21\",\"position\":3}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2024-02-05-65c0af6f05388.png\"]', '[{\"color\":\"00FFFF\",\"image_name\":\"2024-02-05-65c0af6f05388.png\"}]', '2024-02-05-65c0af3a88c98.png', '0', NULL, 'youtube', NULL, '[\"#00FFFF\"]', 0, '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"3kg\",\"options\":[\"500\"]}]', '[{\"type\":\"Aqua-500\",\"price\":600,\"sku\":\"ASA-Aqua-500\",\"qty\":100}]', 0, 600, 500, '0', 'percent', 'include', '0', 'flat', 100, 1, '<p>alternator stator assembly is a key component of the alternator, which is responsible for generating electrical power in the bus&#39;s charging system. The stator assembly plays a crucial role in converting mechanical energy from the engine into electrical energy.</p>\r\n\r\n<p>Here is a description of the alternator stator assembly and its function:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Stator Core: The stator core is the stationary part of the alternator&#39;s rotor-stator system. It consists of a stack of laminated iron cores that form the foundation for the stator windings. The laminations help reduce energy loss due to eddy currents.</p>\r\n	</li>\r\n	<li>\r\n	<p>Stator Windings: The stator windings are a series of copper or aluminum conductive wires wound around the stator core. These windings are positioned in a specific configuration to create multiple sets of alternating magnetic poles when energized.</p>\r\n	</li>\r\n	<li>\r\n	<p>Pole Shoes: The stator windings are supported by pole shoes, which are iron or steel pieces mounted on the stator core. The pole shoes help concentrate and direct the magnetic flux generated by the stator windings.</p>\r\n	</li>\r\n	<li>\r\n	<p>Excitation Current: When an electrical current passes through the stator windings, it creates a magnetic field that rotates around the stator. This magnetic field induces a current in the rotor, which generates the necessary magnetic field for electricity generation.</p>\r\n	</li>\r\n</ol>', 0, NULL, '2023-06-01 14:54:54', '2024-02-05 20:20:44', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '165409'),
(16, 'admin', 1, 'Deluxss', 'deluxss-vnu0sT', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', NULL, 'kg', 1, 1, NULL, NULL, '[\"2024-02-05-65c0adb700a63.png\"]', '[]', '2024-02-05-65c0adb7011a7.png', '0', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 400, 450, '0', 'percent', 'include', '0', 'flat', 0, 1, NULL, 0, NULL, '2023-12-04 16:12:13', '2024-02-05 20:13:36', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '135303'),
(17, 'admin', 1, 'test1', 'test1-JEmdtG', 'physical', '[{\"id\":\"2\",\"position\":1},{\"id\":\"15\",\"position\":2},{\"id\":\"16\",\"position\":3}]', NULL, 'pc', 23, 0, NULL, NULL, '[\"2024-02-05-65c0acb2815f1.png\"]', '[]', '2024-02-05-65c0acb28204c.png', '0', NULL, 'youtube', 'https://www.youtube.com/watch?v=2D-rr4gv3fk', '[]', 0, 'null', '[]', '[]', 0, 60, 40, '5', 'percent', 'exclude', '10', 'percent', 100, 1, '<p>hhhhh</p>', 0, NULL, NULL, '2024-02-05 20:09:15', 1, 1, NULL, NULL, NULL, 1, NULL, 0.00, 0, NULL, NULL, '101423'),
(18, 'admin', 1, 'test2', 'test2-dB9lSl', 'physical', '[{\"id\":\"1\",\"position\":1}]', NULL, 'pc', 33, 0, NULL, NULL, '[\"def.png\",\"2024-02-05-65c0ac6c7438a.png\"]', '[]', '2024-02-05-65c0ac6c74d0e.png', '0', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 55, 59, '5', 'percent', 'exclude', '10', 'percent', 100, 1, '<p>hhhhh</p>', 0, NULL, NULL, '2024-02-05 20:07:48', 1, 1, NULL, NULL, NULL, 1, NULL, 0.00, 0, NULL, NULL, '168422'),
(19, 'admin', 1, 'Light', 'light-WYqheS', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"10\",\"position\":3}]', NULL, 'pc', 1, 1, NULL, NULL, '[\"2024-02-05-65c09b00258ae.png\"]', '[]', '2024-02-05-65c09b002633f.png', '0', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 300, 259, '0', 'percent', 'include', '0', 'flat', 300, 1, NULL, 0, NULL, '2023-12-05 21:37:55', '2024-02-05 18:53:40', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '171535'),
(20, 'admin', 1, 'Backlight', 'backlight-olvXYH', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2},{\"id\":\"10\",\"position\":3}]', NULL, 'pc', 1, 1, NULL, NULL, '[\"2024-02-05-65c09a4081bde.png\"]', '[]', '2024-02-05-65c09a408244c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 450, 370, '0', 'percent', 'include', '0', 'flat', 0, 1, NULL, 0, NULL, '2023-12-06 18:30:10', '2024-02-05 18:50:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '112500'),
(21, 'admin', 1, 'xyz', 'xyz-DroF0s', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"3\",\"position\":2},{\"id\":\"5\",\"position\":3}]', NULL, 'pc', 1, 1, NULL, NULL, '[\"2024-02-05-65c0998a6368b.png\"]', '[]', '2024-02-05-65c0998a64275.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 560, 330, '0', 'percent', 'include', '0', 'flat', 0, 1, NULL, 0, NULL, '2023-12-06 18:45:46', '2024-02-05 18:47:28', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '151689');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `delivery_man_id`, `order_id`, `comment`, `attachment`, `rating`, `status`, `is_saved`, `created_at`, `updated_at`) VALUES
(1, 12, 3, NULL, NULL, 'Good product', '[\"2023-06-02-64797e89129ea.png\"]', 4, 1, 0, '2023-06-02 14:59:58', '2023-06-02 15:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2023-06-02 14:58:08', '2023-06-02 14:58:08', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '2', 'customer', 'permanent', 'Nayapalli, IRC village', 'bhubaneswar', '751010', '7008981614', '2023-06-01 13:31:08', '2023-06-01 13:31:08', NULL, 'India', '12.958954', '77.580070', 0),
(2, '3', 'punyaja rath', 'permanent', 'test', 'bhubaneswar', '54545', '09999999999', '2023-06-02 14:55:37', '2023-06-02 14:55:37', NULL, 'India', '12.958954', '77.580070', 0),
(3, '3', 'punyaja rath', 'permanent', 'test', 'bhubaneswar', '54545', '09999999999', '2023-06-02 14:55:49', '2023-06-02 14:55:49', NULL, 'India', '12.958954', '77.580070', 0),
(4, '4', 'SWAMY', 'permanent', 'NIO 14 AM ROAD JC ROAD BENGALORE', 'BANGALORE', '560091', '9845133577', '2023-06-19 22:20:36', '2023-06-19 22:20:36', NULL, 'India', '12.958954', '77.580070', 0),
(5, '4', 'SWAMY', 'permanent', 'NIO 14 AM ROAD JC ROAD BENGALORE', 'BANGALORE', '560091', '9845133577', '2023-06-19 22:20:44', '2023-06-19 22:20:44', NULL, 'India', '12.958954', '77.580070', 0),
(6, '5', 'nazima yasmeen', 'permanent', 'Basavangudi Bangalore', 'Bangalore ', '560004', '9900026346', '2023-06-20 13:41:24', '2023-06-20 13:41:24', NULL, 'India', '12.958954', '77.580070', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Express Shipping', 250.00, '7 Days', 1, '2023-05-29 16:59:24', '2023-05-29 16:59:24'),
(9, 1, 'admin', 'Standard Shipping', 100.00, '7-14 Days', 1, '2023-05-29 16:58:57', '2023-05-29 16:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `vacation_start_date` date DEFAULT NULL,
  `vacation_end_date` date DEFAULT NULL,
  `vacation_note` varchar(255) DEFAULT NULL,
  `vacation_status` tinyint(4) NOT NULL DEFAULT 0,
  `temporary_close` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2020-12-31 21:18:25'),
(2, 'linkedin', 'https://dev.6amtech.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2021-02-27 16:23:05'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2021-02-27 16:23:33'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2021-02-27 16:24:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2021-02-27 16:24:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2021-06-11 17:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'ampletechnoplast@gmail.com', '2023-06-19 22:08:45', '2023-06-19 22:08:45'),
(2, 'santosh252@outlook.com', '2023-06-24 22:28:30', '2023-06-24 22:28:30'),
(3, 'nhnmAK.bqcbwt@spectrail.world', '2023-11-23 14:58:27', '2023-11-23 14:58:27'),
(4, 'JlkkLU.bwjphj@gemination.hair', '2023-11-29 06:13:54', '2023-11-29 06:13:54'),
(5, 'pFqcME.hqpbdcj@rottack.biz', '2023-12-09 08:30:44', '2023-12-09 08:30:44'),
(6, 'YQFJpe.hmwmbht@spinapp.bar', '2023-12-12 06:44:06', '2023-12-12 06:44:06'),
(7, 'JqzwMv.bmcbbhj@sabletree.foundation', '2023-12-13 20:53:02', '2023-12-13 20:53:02'),
(8, 'VnLKqO.qdjdbd@rottack.autos', '2023-12-15 13:26:47', '2023-12-15 13:26:47'),
(9, 'YAcVJv.bjcpthc@rottack.autos', '2023-12-29 02:23:18', '2023-12-29 02:23:18'),
(10, 'vRCCry.dwqjwtj@carnana.art', '2023-12-30 11:11:55', '2023-12-30 11:11:55'),
(11, 'ocziLy.thwhbwp@flexduck.click', '2024-01-02 00:50:07', '2024-01-02 00:50:07'),
(12, 'XqJtem.qdhmpjbd@spinapp.bar', '2024-01-19 16:42:23', '2024-01-19 16:42:23'),
(13, 'JjnjXR.dpddjph@spectrail.world', '2024-01-27 15:56:45', '2024-01-27 15:56:45'),
(14, '29.01hk6x7zkct1084a3z9hv2v4t8@mail4u.lt', '2024-02-05 21:07:28', '2024-02-05 21:07:28'),
(15, 'eBRLdW.phmmjpc@bakling.click', '2024-02-10 16:33:17', '2024-02-10 16:33:17'),
(16, 'anbwdy.hpjbbjt@kerfuffle.asia', '2024-02-11 13:38:31', '2024-02-11 13:38:31'),
(17, 'BEHjSU.thwmwjd@carnana.art', '2024-02-15 22:30:19', '2024-02-15 22:30:19'),
(18, 'ahHLlt.mbhqwqd@tonetics.biz', '2024-02-29 15:35:40', '2024-02-29 15:35:40'),
(19, 'qmwbtbpbw.h@monochord.xyz', '2024-03-16 09:40:55', '2024-03-16 09:40:55'),
(20, 'qtwcwjpbmj.h@monochord.xyz', '2024-03-28 08:45:19', '2024-03-28 08:45:19'),
(21, 'zrrslermsue@solid-hamster.skin', '2024-08-30 04:24:43', '2024-08-30 04:24:43'),
(22, 'zrrslermsua@solid-hamster.skin', '2024-08-30 04:24:46', '2024-08-30 04:24:46'),
(23, 'zrrslermsul@solid-hamster.skin', '2024-08-30 04:24:48', '2024-08-30 04:24:48'),
(24, 'zrrslermsuzz@solid-hamster.skin', '2024-08-30 04:24:50', '2024-08-30 04:24:50'),
(25, 'zrrslermsuzb@solid-hamster.skin', '2024-08-30 04:24:54', '2024-08-30 04:24:54'),
(26, 'zrrslermsuzi@solid-hamster.skin', '2024-08-30 04:24:56', '2024-08-30 04:24:56'),
(27, 'zrrslermsuzm@solid-hamster.skin', '2024-08-30 04:24:58', '2024-08-30 04:24:58'),
(28, 'zrrslermsuez@solid-hamster.skin', '2024-08-30 04:25:00', '2024-08-30 04:25:00'),
(29, 'zrrslermsuer@solid-hamster.skin', '2024-08-30 04:25:03', '2024-08-30 04:25:03'),
(30, 'zrrslermsues@solid-hamster.skin', '2024-08-30 04:25:06', '2024-08-30 04:25:06'),
(31, 'alimeinside@yahoo.com', '2024-09-19 18:43:44', '2024-09-19 18:43:44'),
(32, 'hello@wpzone.co', '2024-09-24 13:05:21', '2024-09-24 13:05:21'),
(33, 'alialhseene@yahoo.com', '2024-09-26 01:42:57', '2024-09-26 01:42:57'),
(34, 'raimljlmrue@dont-reply.me', '2024-09-29 15:07:07', '2024-09-29 15:07:07'),
(35, 'david@davcommdigital.com', '2024-10-01 09:59:57', '2024-10-01 09:59:57'),
(36, 'cory@aspengrovestudios.com', '2024-10-01 15:35:02', '2024-10-01 15:35:02'),
(37, 'christopher_quinn1631@yahoo.com', '2024-10-02 15:45:55', '2024-10-02 15:45:55'),
(38, 'lbdivad@gmail.com', '2024-10-04 22:14:20', '2024-10-04 22:14:20'),
(39, 'ienacolemanmt417@gmail.com', '2024-10-15 13:19:01', '2024-10-15 13:19:01'),
(40, 'coryajenkins@gmail.com', '2024-10-15 21:02:32', '2024-10-15 21:02:32'),
(41, 'lzibmblajue@dont-reply.me', '2024-10-18 22:08:21', '2024-10-18 22:08:21'),
(42, 'support@wpzone.co', '2024-10-20 01:45:49', '2024-10-20 01:45:49'),
(43, 'kirraeatonj991@gmail.com', '2024-10-24 15:34:20', '2024-10-24 15:34:20'),
(44, 'cory@timberridgemedia.com', '2024-10-26 03:50:00', '2024-10-26 03:50:00'),
(45, 'zzsaljiljiue@dont-reply.me', '2024-10-27 18:47:21', '2024-10-27 18:47:21'),
(46, 'mashate_said@yahoo.com', '2024-10-27 20:40:19', '2024-10-27 20:40:19'),
(47, 'oqkjhawscjab@yahoo.com', '2024-11-01 22:06:09', '2024-11-01 22:06:09'),
(48, 'davcommdigital@gmail.com', '2024-11-03 13:43:28', '2024-11-03 13:43:28'),
(49, 'zabaezmsieue@dont-reply.me', '2024-11-07 00:24:43', '2024-11-07 00:24:43'),
(50, 'ylt24fcsnom@yahoo.com', '2024-11-07 15:03:59', '2024-11-07 15:03:59'),
(51, 'help@wpzone.co', '2024-11-07 17:51:10', '2024-11-07 17:51:10'),
(52, 'nzdboml7dwwo@yahoo.com', '2024-11-09 19:56:33', '2024-11-09 19:56:33'),
(53, 'cousesic@yahoo.com', '2024-11-10 13:17:09', '2024-11-10 13:17:09'),
(54, 'edibjw5849@gmail.com', '2024-11-11 07:15:21', '2024-11-11 07:15:21'),
(55, 'yannikcxq171@gmail.com', '2024-11-12 01:09:50', '2024-11-12 01:09:50'),
(56, 'ublylgteudbyllm@yahoo.com', '2024-11-12 19:51:28', '2024-11-12 19:51:28'),
(57, 'ezelindacarsonja@gmail.com', '2024-11-14 16:04:01', '2024-11-14 16:04:01'),
(58, 'goitinh.1980@yahoo.com', '2024-11-15 13:28:24', '2024-11-15 13:28:24'),
(59, 'zlmribeszlue@dont-reply.me', '2024-11-16 01:12:29', '2024-11-16 01:12:29'),
(60, 'ookeuuhkdohgcb@yahoo.com', '2024-11-16 11:33:58', '2024-11-16 11:33:58'),
(61, 'tanzidbx169@gmail.com', '2024-11-17 09:55:17', '2024-11-17 09:55:17'),
(62, 'blakesivardzj2005@gmail.com', '2024-11-18 14:17:46', '2024-11-18 14:17:46'),
(63, 'terradelacruzn1992@gmail.com', '2024-11-20 14:10:16', '2024-11-20 14:10:16'),
(64, 'rozamyndak33@gmail.com', '2024-11-24 19:34:51', '2024-11-24 19:34:51'),
(65, 'montgkalin@gmail.com', '2024-11-25 16:05:58', '2024-11-25 16:05:58'),
(66, 'ebalrrrjejue@do-not-respond.me', '2024-11-28 03:44:11', '2024-11-28 03:44:11'),
(67, 'bjosephdw2484@gmail.com', '2024-11-28 12:19:15', '2024-11-28 12:19:15'),
(68, 'djinetdavisa@gmail.com', '2024-11-29 08:34:52', '2024-11-29 08:34:52'),
(69, 'dzadoszhavthankar@yahoo.com', '2024-11-30 03:41:36', '2024-11-30 03:41:36'),
(70, 'parferdinh@gmail.com', '2024-11-30 22:38:33', '2024-11-30 22:38:33'),
(71, 'gcybduwoe2@yahoo.com', '2024-12-01 16:36:05', '2024-12-01 16:36:05'),
(72, 'p3gg5uujti@yahoo.com', '2024-12-02 10:39:27', '2024-12-02 10:39:27'),
(73, 'kendmayhp@gmail.com', '2024-12-03 03:02:38', '2024-12-03 03:02:38'),
(74, 'muchxkdhrxjcphnch@yahoo.com', '2024-12-03 20:55:35', '2024-12-03 20:55:35'),
(75, 'kareibellue@gmail.com', '2024-12-05 06:40:21', '2024-12-05 06:40:21'),
(76, 'fvjtikjwdetckwd@yahoo.com', '2024-12-06 00:53:34', '2024-12-06 00:53:34'),
(77, 'mjerchore@yahoo.com', '2024-12-06 21:10:53', '2024-12-06 21:10:53'),
(78, 'mldccxorwpskrmb@yahoo.com', '2024-12-07 15:59:14', '2024-12-07 15:59:14'),
(79, 'cokspjnisuym@yahoo.com', '2024-12-08 10:03:33', '2024-12-08 10:03:33'),
(80, 'mannvaleris27@gmail.com', '2024-12-09 02:58:52', '2024-12-09 02:58:52'),
(81, 'elambzrrlaue@dont-reply.me', '2024-12-09 19:30:24', '2024-12-09 19:30:24'),
(82, 'fartaninsunza@yahoo.com', '2024-12-10 23:48:03', '2024-12-10 23:48:03'),
(83, 'silkendriag@gmail.com', '2024-12-12 04:59:29', '2024-12-12 04:59:29'),
(84, 'fcgjcnarvlhcs@yahoo.com', '2024-12-13 09:36:10', '2024-12-13 09:36:10'),
(85, 'lpsinhahvkhvrfdr@yahoo.com', '2024-12-13 09:42:16', '2024-12-13 09:42:16'),
(86, 'jfbfnxvtcwppeklng@yahoo.com', '2024-12-14 11:10:32', '2024-12-14 11:10:32'),
(87, 'bjlslezjaaue@do-not-respond.me', '2024-12-15 05:44:25', '2024-12-15 05:44:25'),
(88, 'bellmntripni@yahoo.com', '2024-12-15 07:27:21', '2024-12-15 07:27:21'),
(89, 'cfobxulhwfa@yahoo.com', '2024-12-16 02:42:23', '2024-12-16 02:42:23'),
(90, 'exebtkoabba@yahoo.com', '2024-12-17 03:03:14', '2024-12-17 03:03:14'),
(91, 'colgrvemacatagay@yahoo.com', '2024-12-19 13:19:44', '2024-12-19 13:19:44'),
(92, 'szepeinow@yahoo.com', '2024-12-20 13:30:10', '2024-12-20 13:30:10'),
(93, 'paucekeas@yahoo.com', '2024-12-21 11:57:09', '2024-12-21 11:57:09'),
(94, 'atajinax263@gmail.com', '2024-12-22 06:33:32', '2024-12-22 06:33:32'),
(95, 'gwf48o0b1fw@yahoo.com', '2024-12-23 01:06:47', '2024-12-23 01:06:47'),
(96, 'tucizavarow02@gmail.com', '2024-12-23 19:43:00', '2024-12-23 19:43:00'),
(97, 'wmdwfkoqc@yahoo.com', '2024-12-24 22:31:18', '2024-12-24 22:31:18'),
(98, 'barrlbrzmaue@dont-reply.me', '2024-12-25 03:33:36', '2024-12-25 03:33:36'),
(99, 'cefayfontelea@yahoo.com', '2024-12-25 19:11:33', '2024-12-25 19:11:33'),
(100, 'oxepobiwo747@gmail.com', '2024-12-26 14:39:46', '2024-12-26 14:39:46'),
(101, 'tldvprmsd@yahoo.com', '2024-12-27 14:18:04', '2024-12-27 14:18:04'),
(102, 'vamawiruxica47@gmail.com', '2024-12-28 13:25:05', '2024-12-28 13:25:05'),
(103, 'brcupqpdolna@yahoo.com', '2024-12-30 08:53:07', '2024-12-30 08:53:07'),
(104, 'obayubiwoye45@gmail.com', '2024-12-31 06:33:25', '2024-12-31 06:33:25'),
(105, 'ms9bq6th1ple@yahoo.com', '2025-01-01 00:52:00', '2025-01-01 00:52:00'),
(106, 'eberahor455@gmail.com', '2025-01-01 18:03:38', '2025-01-01 18:03:38'),
(107, 'svvteivfjr@yahoo.com', '2025-01-02 11:38:14', '2025-01-02 11:38:14'),
(108, 'uhobesalaxa625@gmail.com', '2025-01-04 05:01:16', '2025-01-04 05:01:16'),
(109, 'rjjzlrsbbaue@do-not-respond.me', '2025-01-05 01:04:21', '2025-01-05 01:04:21'),
(110, 'yedurucara001@gmail.com', '2025-01-05 04:15:11', '2025-01-05 04:15:11'),
(111, 'babipupebu68@gmail.com', '2025-01-06 07:10:02', '2025-01-06 07:10:02'),
(112, 'hkpwpucorrvonyjfo@yahoo.com', '2025-01-07 13:26:21', '2025-01-07 13:26:21'),
(113, 'qafivogib18@gmail.com', '2025-01-08 14:34:11', '2025-01-08 14:34:11'),
(114, 'storhaghle@yahoo.com', '2025-01-09 18:04:33', '2025-01-09 18:04:33'),
(115, 'raqixasomah63@gmail.com', '2025-01-10 17:31:57', '2025-01-10 17:31:57'),
(116, 'rebjbabmjaue@dont-reply.me', '2025-01-11 00:26:12', '2025-01-11 00:26:12'),
(117, 'gschneidingerhin@yahoo.com', '2025-01-11 15:34:13', '2025-01-11 15:34:13'),
(118, 'iguxumadaqe92@gmail.com', '2025-01-12 14:34:02', '2025-01-12 14:34:02'),
(119, 'qqxi4uytdpr@yahoo.com', '2025-01-13 17:46:54', '2025-01-13 17:46:54'),
(120, 'allensolomonbo@gmail.com', '2025-01-15 06:04:31', '2025-01-15 06:04:31'),
(121, 'gossameraujade20@gmail.com', '2025-01-16 19:08:48', '2025-01-16 19:08:48'),
(122, 'duskaglyph19@gmail.com', '2025-01-18 00:16:53', '2025-01-18 00:16:53'),
(123, 'rilsbisjraue@dont-reply.me', '2025-01-18 22:06:58', '2025-01-18 22:06:58'),
(124, 'wuiapqtezrx2n@yahoo.com', '2025-01-19 03:33:59', '2025-01-19 03:33:59'),
(125, 'iuthilon@yahoo.com', '2025-01-20 00:13:07', '2025-01-20 00:13:07'),
(126, 'ayjubileeou42delveea@gmail.com', '2025-01-20 20:34:36', '2025-01-20 20:34:36'),
(127, 'rmzalsbizaue@dont-reply.me', '2025-01-21 16:49:11', '2025-01-21 16:49:11'),
(128, 'towllpnbirkwdpstx@yahoo.com', '2025-01-22 11:34:30', '2025-01-22 11:34:30'),
(129, 'ivt5peusrrkdr5@yahoo.com', '2025-01-23 20:33:50', '2025-01-23 20:33:50'),
(130, 'etragari@yahoo.com', '2025-01-25 11:28:58', '2025-01-25 11:28:58'),
(131, 'Derek6Durham5902@gmail.com', '2025-01-27 04:03:01', '2025-01-27 04:03:01'),
(132, 'Kellie1Shaw9709@gmail.com', '2025-01-28 21:35:57', '2025-01-28 21:35:57'),
(133, 'Leroy6Boolman2906@gmail.com', '2025-01-31 02:59:58', '2025-01-31 02:59:58'),
(134, 'soponorza@yahoo.com', '2025-02-01 13:05:54', '2025-02-01 13:05:54'),
(135, 'ayuvigan42@gmail.com', '2025-02-02 12:09:18', '2025-02-02 12:09:18'),
(136, 'idiramogirej14@gmail.com', '2025-02-03 09:33:37', '2025-02-03 09:33:37'),
(137, 'uuyfpjsbvrfgugfk@yahoo.com', '2025-02-04 11:26:54', '2025-02-04 11:26:54'),
(138, 'duskyjadey@gmail.com', '2025-02-05 11:58:59', '2025-02-05 11:58:59'),
(139, 'aiobsidian46rift30@gmail.com', '2025-02-06 11:32:29', '2025-02-06 11:32:29'),
(140, 'iazarzmijaue@dont-reply.me', '2025-02-06 13:56:29', '2025-02-06 13:56:29'),
(141, 'avortexwraith44@gmail.com', '2025-02-07 11:20:39', '2025-02-07 11:20:39'),
(142, 'illuminateiofrost@gmail.com', '2025-02-08 19:47:18', '2025-02-08 19:47:18'),
(143, 'aiphantom83pinnacle42io@gmail.com', '2025-02-10 11:52:34', '2025-02-10 11:52:34'),
(144, 'zenithi12alchemy@gmail.com', '2025-02-11 23:25:48', '2025-02-11 23:25:48'),
(145, 'dkotdaes@do-not-respond.me', '2025-02-12 12:28:13', '2025-02-12 12:28:13'),
(146, 'ipcpijcj@do-not-respond.me', '2025-02-12 12:28:13', '2025-02-12 12:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'customer', 'test', '917008981614', 'def.png', 'user@aicopl.com', NULL, '$2y$10$/aWq/npqYb8ItOS67ln0M.pRNPTh.xc1AcV9T9F7sBrbekCuVdTdW', NULL, '2023-06-01 13:25:04', '2023-06-01 13:25:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(3, NULL, 'punyaja', 'rath', '91999999999', 'def.png', 'test@aicopl.net', NULL, '$2y$10$E8W40ERypXmjdjxRj6gY8O3UJjmyN3CCsjBSOO21ZQlnWdhPNhaAq', NULL, '2023-06-02 14:45:22', '2023-06-02 14:45:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(4, NULL, 'C S', 'SWAMY', '9845133577', 'def.png', 'ampletechnoplast@gmail.com', NULL, '$2y$10$PSHuFkBgApxH/YNgc8ps9eHpp0cox.ldC46bDgUFqNdLFgLByVeR2', NULL, '2023-06-19 22:14:39', '2023-06-19 22:14:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(5, NULL, 'Yasmin', 'Khan', '9900026346', 'def.png', 'mdayaan78@gmail.com', NULL, '$2y$10$hPmq4V4YV5jBvQLW6THcBuKo2qptUHFsG2PDmETzFpqIItlPGRXua', NULL, '2023-06-20 13:38:52', '2023-06-20 13:38:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(6, NULL, 'yPjYQPjAOi', 'yPjYQPjAOi', '1', 'def.png', 'HnvkuA.bqcbmq@spectrail.world', NULL, '$2y$10$7KSlDXD371msT8hdxm/qEuePRW2AKBPoH.9hBd1Dedo4wX8LZpYNO', NULL, '2023-11-23 14:58:29', '2023-11-23 14:58:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(7, NULL, 'GEyFkUDQbZsBYRU', 'VVaTkqGaiVqtqm', '5700395730', 'def.png', 'alialhseene@yahoo.com', NULL, '$2y$10$H21RdcgRhsCKNmtnSGNj3uf8Np1q3B2nUovMXtXpClZRZOy9vw3lC', NULL, '2024-09-26 01:43:34', '2024-09-26 01:43:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(8, NULL, 'jXKqSQUDk', 'yMxMxootiDtEVac', '6096957459', 'def.png', 'ienacolemanmt417@gmail.com', NULL, '$2y$10$Omw27uK2mcPRkUX3lpL1h.dxOSsddKIIM0qk6FlRN4x6wF6.oX93m', NULL, '2024-10-15 13:19:32', '2024-10-15 13:19:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(9, NULL, 'VscBbEYAEBX', 'WCEgccmKZi', '8398160526', 'def.png', 'kirraeatonj991@gmail.com', NULL, '$2y$10$YUW9TLjmAx1da0DG2weSdeyKINTPNNwRX5wtM85WakEOfX1TRlnZC', NULL, '2024-10-24 15:34:43', '2024-10-24 15:34:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(10, NULL, 'pzkkcunV', 'fjeSVsRzltAR', '6001542383', 'def.png', 'mashate_said@yahoo.com', NULL, '$2y$10$5/skFxy.iC58Kh.F7E73kuTveA9qQ2Fj12OfKugvXkjLrz7yCppga', NULL, '2024-10-27 20:40:43', '2024-10-27 20:40:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(11, NULL, 'RVqtPumZR', 'hkGvmoWH', '4223897121', 'def.png', 'oqkjhawscjab@yahoo.com', NULL, '$2y$10$um8wUxDzmhBLCqxcy00ljOgJM3uTT5IiRrCtbxLgbDf8Q34WVcQta', NULL, '2024-11-01 22:06:40', '2024-11-01 22:06:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(12, NULL, 'ossMOgUN', 'HgRmzVIcfhcgVdT', '8087114122', 'def.png', 'ylt24fcsnom@yahoo.com', NULL, '$2y$10$JyPuEksxPcQngTnpwkNvD.LvoC1uN9RGlzV38ZlwysphcEknVITk.', NULL, '2024-11-07 15:04:22', '2024-11-07 15:04:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(13, NULL, 'GshmutBdEul', 'oZbrAeAAv', '9309125645', 'def.png', 'nzdboml7dwwo@yahoo.com', NULL, '$2y$10$6nJ.7MbPdQNveQ/vExPh2.nWuDBH9wNgbphTCPdvBUVk//Qh4o4PS', NULL, '2024-11-09 19:57:27', '2024-11-09 19:57:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(14, NULL, 'ZdnxODtkPkt', 'mFLjrytukeH', '9552982818', 'def.png', 'cousesic@yahoo.com', NULL, '$2y$10$U3BO6hQY6uzSpeHTr7cINO0FJEhR3hJtw/CsWMW.lZhBjLt5fONHO', NULL, '2024-11-10 13:17:47', '2024-11-10 13:17:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(15, NULL, 'DtewpTSVbsUrz', 'qcZrQQdHWzQaZ', '2925739500', 'def.png', 'edibjw5849@gmail.com', NULL, '$2y$10$at0JTNe0iSwfAJI8eRwxpeMDYYDlkiN7CJYWQ5oNsQdPzS3TT8MJe', NULL, '2024-11-11 07:16:09', '2024-11-11 07:16:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(16, NULL, 'ajYRveoNxe', 'rKBUXXLpnYCnJ', '6627704432', 'def.png', 'yannikcxq171@gmail.com', NULL, '$2y$10$3uMlUGXgCSvhuipdb7Ko8.O3VqVb4jntOaQfivfRlfIAsqk0Rzc.2', NULL, '2024-11-12 01:10:42', '2024-11-12 01:10:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(17, NULL, 'rCAVGtBjfONHp', 'YaxyNGZSQzdlqu', '9831063513', 'def.png', 'ublylgteudbyllm@yahoo.com', NULL, '$2y$10$ELQo.euqq./pomE1g42oBe3CApE.yulo3l/3/Ml14T.qhVnFmCHs2', NULL, '2024-11-12 19:52:07', '2024-11-12 19:52:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(18, NULL, 'UrLkrVphYkJ', 'sVfWDzkeggbm', '7038387576', 'def.png', 'ezelindacarsonja@gmail.com', NULL, '$2y$10$tNyhgjLyn2XQLYiQsEwGj.AnzLts9.z2dgval1SkOMTbXZbf4LJZm', NULL, '2024-11-14 16:04:26', '2024-11-14 16:04:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(19, NULL, 'DIVQNcREZh', 'RwVUAskEnDKc', '3343073650', 'def.png', 'goitinh.1980@yahoo.com', NULL, '$2y$10$UeTNa3vdVpwTnhYN5gMyueaSEab.ct7MiUfHZcVhkDEBDlvM3O8Tq', NULL, '2024-11-15 13:29:19', '2024-11-15 13:29:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(20, NULL, 'saKcDkbhVsnTIB', 'CppxNYsAKAY', '7366481126', 'def.png', 'ookeuuhkdohgcb@yahoo.com', NULL, '$2y$10$SoQ/ZZ40Z7gGll9X1r0Y2.0rOW7pLms0NOgXRRz1gUitz01q1h2Bq', NULL, '2024-11-16 11:34:40', '2024-11-16 11:34:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(21, NULL, 'ohZbKPfRjFh', 'BYStnxZAJBiD', '9464458960', 'def.png', 'tanzidbx169@gmail.com', NULL, '$2y$10$ufHMhaWTvSlniZfJ/LWt9OXUZb2gZUfBZ.mcQOMlVN.QqM7XUnkBG', NULL, '2024-11-17 09:56:21', '2024-11-17 09:56:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(22, NULL, 'tPQHWYxJOpgjqf', 'WCsyaydJnzgl', '3892316441', 'def.png', 'blakesivardzj2005@gmail.com', NULL, '$2y$10$68GEmq4A5Aq116XUufSOzOUS2oZkv/U6nzyf97H/dIdaeHKQTnBHi', NULL, '2024-11-18 14:18:37', '2024-11-18 14:18:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(23, NULL, 'bdnnwGoLqpRHKY', 'EQYfEzyJqe', '6471982049', 'def.png', 'terradelacruzn1992@gmail.com', NULL, '$2y$10$3ff7HtuM2qiO1nycrZFo4uLLmmoLnsuxeHm5EvCpQMHQ6QJ57y4g6', NULL, '2024-11-20 14:11:25', '2024-11-20 14:11:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(24, NULL, 'sNlFQmKhuztqoS', 'QsMavmCDdw', '6278657126', 'def.png', 'rozamyndak33@gmail.com', NULL, '$2y$10$LxDY53mU9/1Ff1IWPNV0Ku3J4Y3JySX45AZxpCZYpI7.4EMs9.E0e', NULL, '2024-11-24 19:35:23', '2024-11-24 19:35:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(25, NULL, 'TtcwXSDRiLZYKp', 'MMmFKEyny', '9519940604', 'def.png', 'montgkalin@gmail.com', NULL, '$2y$10$UOO8XoxHgwnsTZGkac.i9Opjn.HEiCCbQq3ijhjspF95.zL7T69n.', NULL, '2024-11-25 16:06:36', '2024-11-25 16:06:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(26, NULL, 'xXkArbRc', 'JEuLkrZNbBoXba', '5131731276', 'def.png', 'djinetdavisa@gmail.com', NULL, '$2y$10$z0i8zD82nbAYGHJMmvICQuvYh8r1o.vQhqWNNhHCEAdGMqav5Bg0i', NULL, '2024-11-29 08:35:33', '2024-11-29 08:35:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(27, NULL, 'Nfejdekofhofjwdoe jirekdwjfreohogjkerwkrj rekwlrkfekjgoperrkfoek ojeopkfwkferjgiejfwk okfepjfgrihgoiejfklegjroi jeiokferfekfrjgiorjofeko jeoighirhgioejfoekforjgijriogjeo foefojeigjrigklej jkrjfkrejgkrhglrlrk utkalenterprises.net', 'Nfejdekofhofjwdoe jirekdwjfreohogjkerwkrj rekwlrkfekjgoperrkfoek ojeopkfwkferjgiejfwk okfepjfgrihgoiejfklegjroi jeiokferfekfrjgiorjofeko jeoighirhgioejfoekforjgijriogjeo foefojeigjrigklej jkrjfkrejgkrhglrlrk utkalenterprises.net', '89385248383', 'def.png', 'yasen.krasen.13+80997@mail.ru', NULL, '$2y$10$QFn80EgNJCdytN4JiPgsPegMT/6OWBIE/tXJMWC9aEZYLxGkDzBoC', NULL, '2024-11-30 02:44:40', '2024-11-30 02:44:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(28, NULL, 'gaWDbbLshaYk', 'QQeWFggwxjGx', '6315874651', 'def.png', 'dzadoszhavthankar@yahoo.com', NULL, '$2y$10$irrWRYIw.qI5ktee8jYSte18F6.eo.8OZzCS6NMKF5DKZy/syF6jO', NULL, '2024-11-30 03:42:09', '2024-11-30 03:42:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(29, NULL, 'oQGEGwCMiBXwnkq', 'SnbzPSqP', '6128029407', 'def.png', 'parferdinh@gmail.com', NULL, '$2y$10$RqiOI10QLXSXE0af.MVfJuuzpsYt7eYW/67u2y79VJ6lTJht09KRa', NULL, '2024-11-30 22:39:08', '2024-11-30 22:39:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(30, NULL, 'gKUNZFMfs', 'ectSjhbXUn', '5665153799', 'def.png', 'gcybduwoe2@yahoo.com', NULL, '$2y$10$31TEhFbxvs43cEih7SqB.ej1g/aMYdsxKXNuooFQd4hkr07sWoQfq', NULL, '2024-12-01 16:36:35', '2024-12-01 16:36:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(31, NULL, 'TCGlfGdSigkk', 'TIYKCZuFjXETqYF', '7254245933', 'def.png', 'p3gg5uujti@yahoo.com', NULL, '$2y$10$xZWM3PljRDt9cxvuBpaJJeT.HF49vfUskFCnxBvMnh/rCX83FPgz2', NULL, '2024-12-02 10:40:02', '2024-12-02 10:40:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(32, NULL, 'pGrEltqAODOfsaF', 'gYnAFoyo', '4777033315', 'def.png', 'kendmayhp@gmail.com', NULL, '$2y$10$FRORowdtSCbkaLeLwi1bfuv83lt0ltmpRmZKkFDjhBmeltoB4d3R2', NULL, '2024-12-03 03:03:05', '2024-12-03 03:03:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(33, NULL, 'VUZimZfYI', 'uQTtQDRjZrhPWG', '5286038341', 'def.png', 'muchxkdhrxjcphnch@yahoo.com', NULL, '$2y$10$.WTvUEaGCQyX4IM6CyZjyelVRbVDeAr9jlVHPEdcui.b.LjZDMtUq', NULL, '2024-12-03 20:56:05', '2024-12-03 20:56:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(34, NULL, 'nnCCTapv', 'dWHFJtWJMuBEYOr', '4745239232', 'def.png', 'kareibellue@gmail.com', NULL, '$2y$10$eJUI9WqajKBvqwnM1GjRmudUCmZPEc2upGtsE.PH4ih5z1lZxxf5y', NULL, '2024-12-05 06:40:59', '2024-12-05 06:40:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(35, NULL, 'iCHgfKHBztzpg', 'UPBpemrBafumhvb', '6424412256', 'def.png', 'fvjtikjwdetckwd@yahoo.com', NULL, '$2y$10$wuez5WE9rOsvlobxWqHV1.IBVOw4.3FklRcJ1VGNAKQq.XXE7onBO', NULL, '2024-12-06 00:54:59', '2024-12-06 00:54:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(36, NULL, 'eSkYebbYTHju', 'KlxSHWKnTNFlPDO', '3968101139', 'def.png', 'mjerchore@yahoo.com', NULL, '$2y$10$ahBKfZbIvELJ3a1sZo04pOo1QaMIOCqdurrYjjilNk2r7piqcGaDC', NULL, '2024-12-06 21:11:18', '2024-12-06 21:11:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(37, NULL, 'ZNvyRkGvFLo', 'vFdvATPCFDC', '5416734867', 'def.png', 'mldccxorwpskrmb@yahoo.com', NULL, '$2y$10$v.ZN2OKH5cfql0AB6oc64OJtU1swfznTu.XuBopDUsFEI2lCznupy', NULL, '2024-12-07 15:59:52', '2024-12-07 15:59:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(38, NULL, 'raDxyTkITG', 'lkxFLTgS', '7941033781', 'def.png', 'cokspjnisuym@yahoo.com', NULL, '$2y$10$YP7lffXQp6VPtY35ebT9TuPyx8YsXO6qWIyEGM3iCPHeSj8A2DHWy', NULL, '2024-12-08 10:04:00', '2024-12-08 10:04:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(39, NULL, 'cSraKGoTt', 'kVglBNqT', '5702285962', 'def.png', 'mannvaleris27@gmail.com', NULL, '$2y$10$vtmbBnjKE7DZy2OFVJvDnOxPc5DT7w9AzSYm0niCR/IER7xh60Ojm', NULL, '2024-12-09 02:59:41', '2024-12-09 02:59:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(40, NULL, 'ISUNtcjML', 'ddqKoDsKKiH', '9929620588', 'def.png', 'fartaninsunza@yahoo.com', NULL, '$2y$10$MBpKbe5zf3UPVgA7xRVdc.6qfQlLr7vlv2OTMek.T1pHxGK9oW1ku', NULL, '2024-12-10 23:49:00', '2024-12-10 23:49:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(41, NULL, 'LFISKXKYF', 'WwXTOyKtWodRq', '2516693896', 'def.png', 'silkendriag@gmail.com', NULL, '$2y$10$i8U69t4k9XsiuMxfxw0eQeWROI9lwNGh/pj//wqSfId9fAwHye0R6', NULL, '2024-12-12 05:00:20', '2024-12-12 05:00:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(42, NULL, 'sYYPCoYfdJE', 'pkQiptuWij', '3914837157', 'def.png', 'fcgjcnarvlhcs@yahoo.com', NULL, '$2y$10$n2QGyXi24r.OFrvswEgQyeJIn65CxIwIOesTNkLJ1BDPU9gY0hGtK', NULL, '2024-12-13 09:36:42', '2024-12-13 09:36:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(43, NULL, 'UvxXNnPXmfxpD', 'bOYFbocBUYHie', '2160989798', 'def.png', 'lpsinhahvkhvrfdr@yahoo.com', NULL, '$2y$10$G8.qsm.t7Uk/.nrlgv2jkueXtsvxOkYV84mgMn2s6O4NCa/nqykrO', NULL, '2024-12-13 09:42:57', '2024-12-13 09:42:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(44, NULL, 'pjbqCkGxC', 'tfEMyxVssK', '9234603563', 'def.png', 'jfbfnxvtcwppeklng@yahoo.com', NULL, '$2y$10$sJdbePCnLytDP0U1/55Of.62TgLDE2i6gjXzm552C22RbR7WRBr7S', NULL, '2024-12-14 11:11:03', '2024-12-14 11:11:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(45, NULL, 'XUHEhWGygdUdlU', 'ChpKpwNINybXQY', '7337930655', 'def.png', 'bellmntripni@yahoo.com', NULL, '$2y$10$iRlssbcsNJ1upKZaNJsl9.F2wHM4RNvxxmOvQH2JCeYius7ZJTDC6', NULL, '2024-12-15 07:28:12', '2024-12-15 07:28:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(46, NULL, 'gDPNVXggLny', 'TpURFzzlJALSCFT', '5276553612', 'def.png', 'cfobxulhwfa@yahoo.com', NULL, '$2y$10$TWfbnYSq/xR/0itTOXMPhOcJhNaiuA44JNY9oLND1/Qyj1c/U5uhC', NULL, '2024-12-16 02:43:13', '2024-12-16 02:43:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(47, NULL, 'JNggJUKMrz', 'AoYJoBvl', '7384489985', 'def.png', 'exebtkoabba@yahoo.com', NULL, '$2y$10$MD5gFvzksutvdFF59ronD.kL6s8GPOdslsPEbias3uMnD/XPg4SL6', NULL, '2024-12-17 03:03:53', '2024-12-17 03:03:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(48, NULL, 'MEcqVWpWbGKwo', 'TfCoBODPZt', '9412610145', 'def.png', 'colgrvemacatagay@yahoo.com', NULL, '$2y$10$0jfklcJtr78unZ35CsjH.uY/ltJEvwTFLK7WsVJu4x06I7ZEPET4e', NULL, '2024-12-19 13:20:35', '2024-12-19 13:20:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(49, NULL, 'GEKhUiSeAFUU', 'qEZHcnIKVPQnLGN', '7998210717', 'def.png', 'szepeinow@yahoo.com', NULL, '$2y$10$80oXxbgE9n5YOFBFAsl8QenzwdpYRk414SDYe6AvfL23BH5Fkniqy', NULL, '2024-12-20 13:30:58', '2024-12-20 13:30:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(50, NULL, 'veFwdijYWcCAl', 'zuqhbCapRKVZ', '2979609173', 'def.png', 'paucekeas@yahoo.com', NULL, '$2y$10$IS8pkTIgB1To9khss.eLjOC.JI3TzmbTaU8fkGbMHXp5MPiNKJu4a', NULL, '2024-12-21 11:57:47', '2024-12-21 11:57:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(51, NULL, 'HODOFnKDPuY', 'ZyRpmCuITr', '5801682215', 'def.png', 'atajinax263@gmail.com', NULL, '$2y$10$jjDI2sS3zSXH5kIYvzKRfe464d4oMKBjg6guTcvD3xciTCRdecqhy', NULL, '2024-12-22 06:34:04', '2024-12-22 06:34:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(52, NULL, 'kkDyPlNuKUCcoQ', 'ZyOnFshBekubJ', '2199242771', 'def.png', 'gwf48o0b1fw@yahoo.com', NULL, '$2y$10$qYkHx0HLdQH613fBEln6GOK1uqeVvbABS/rFFAd.dkpIjBMa/hi.W', NULL, '2024-12-23 01:07:27', '2024-12-23 01:07:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(53, NULL, 'SsHipZqtxCj', 'ADETVqzhXg', '2148775409', 'def.png', 'tucizavarow02@gmail.com', NULL, '$2y$10$3kUoA8SrT1kNYDBIgvTJbemRZLWPoT0U2Km7FeqyU/iLtNUdDewSm', NULL, '2024-12-23 19:44:11', '2024-12-23 19:44:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(54, NULL, 'DvKkJlYAR', 'dnvIfArIQWsux', '4910844213', 'def.png', 'wmdwfkoqc@yahoo.com', NULL, '$2y$10$4OzRgk5SDXwReyywKCmQduirZ/k1Tp2HrousFB2Vb.hurPV9RfQAu', NULL, '2024-12-24 22:32:06', '2024-12-24 22:32:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(55, NULL, 'IAaBAnhVgf', 'sgvfyNCIExZ', '4201538623', 'def.png', 'cefayfontelea@yahoo.com', NULL, '$2y$10$8IgvrAmoB7JtM.A0I86TLurJvVyQdKmjsEDNK91ZoyTcXi3XCO4ne', NULL, '2024-12-25 19:12:30', '2024-12-25 19:12:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(56, NULL, 'RRHRagLcoOSJQ', 'piKPxrVIsZH', '8767315629', 'def.png', 'oxepobiwo747@gmail.com', NULL, '$2y$10$euA2IAfiB7DLDSEVeBJUH.bEcoPCk2DzWWzXFjmODpNNe4HTNc4g.', NULL, '2024-12-26 14:40:47', '2024-12-26 14:40:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(57, NULL, 'CbiJRvuZkvc', 'hmgpuhqFCT', '4327966695', 'def.png', 'tldvprmsd@yahoo.com', NULL, '$2y$10$MwaWsiSCTLJXzC91qhMsHuZ6DD3RDZuhWVVthPyV9N28SzsLIMNPu', NULL, '2024-12-27 14:18:59', '2024-12-27 14:18:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(58, NULL, 'RwzsyeGxdYS', 'tqveJgnNgek', '7399970413', 'def.png', 'vamawiruxica47@gmail.com', NULL, '$2y$10$vxfulyA1CMiIFtHZqilHU.otV.8kuAhZOAZ.R0X2xso/7QPwjPRrq', NULL, '2024-12-28 13:25:37', '2024-12-28 13:25:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(59, NULL, 'qgeBIdgEiqsMEV', 'zMvAwtHmiKfWa', '3564737589', 'def.png', 'brcupqpdolna@yahoo.com', NULL, '$2y$10$7dKg5ajGgBOywsLA.imnkuFnaeTy9mYRuG0kqvvbycNJGRUofVCD2', NULL, '2024-12-30 08:53:34', '2024-12-30 08:53:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(60, NULL, 'WtIeTjQovzrDeF', 'fzqZNjcz', '6605732074', 'def.png', 'obayubiwoye45@gmail.com', NULL, '$2y$10$kaeoPT3KPj5h0JGnd.de8uoc5W5eYtM/TSGsEynlPKevpxca2tAti', NULL, '2024-12-31 06:33:56', '2024-12-31 06:33:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(61, NULL, 'LQTiNQkmGBRgkgS', 'xDMXaWNz', '3074009002', 'def.png', 'ms9bq6th1ple@yahoo.com', NULL, '$2y$10$Qz1Ou5e6vLIdWg2zTLbzbOHXxbXtf33Wz3MNNpyEm9VpOLTLfSKK2', NULL, '2025-01-01 00:52:33', '2025-01-01 00:52:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(62, NULL, 'KYiVBefULZNY', 'uUERcoFOVj', '6323908246', 'def.png', 'eberahor455@gmail.com', NULL, '$2y$10$0dGH8cHGVyrUQCBT7FfVaudRa0qdSp7lppYhhcu2cG7UwdoCUoLH2', NULL, '2025-01-01 18:04:20', '2025-01-01 18:04:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(63, NULL, 'JvdLuymXkUI', 'PoyNLkbzPTkwgKA', '8727469119', 'def.png', 'svvteivfjr@yahoo.com', NULL, '$2y$10$0SZoHT7X/SV7fLKzIVbrkOzE8fjFHAzWNjAnKiBGgqifZHIn0FBra', NULL, '2025-01-02 11:38:37', '2025-01-02 11:38:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(64, NULL, 'CQreFZGCEg', 'BtGBUJBURTf', '5259264986', 'def.png', 'uhobesalaxa625@gmail.com', NULL, '$2y$10$0GEHK7zT6Wd/QODF0emgnuHD/8mAXxL7RgkV5fNnD/7zmCWwWfRM.', NULL, '2025-01-04 05:02:39', '2025-01-04 05:02:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(65, NULL, 'yTVmixMbGZCvay', 'CmtOWKFdk', '2732693036', 'def.png', 'yedurucara001@gmail.com', NULL, '$2y$10$xA/Eq8LHwdC.58m.IcZXsutBMiJ9uPsQleUpkz9a.QzlFPlAIVv7.', NULL, '2025-01-05 04:16:05', '2025-01-05 04:16:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(66, NULL, 'bmxDOvbANjM', 'jqNyYJBxuqLjKwi', '5810989857', 'def.png', 'babipupebu68@gmail.com', NULL, '$2y$10$1GVD0BqknSKBnVjzj9VHIu5to8ONPFC57nqhPJVvZkeugnmP5AvQi', NULL, '2025-01-06 07:10:58', '2025-01-06 07:10:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(67, NULL, 'BFtZwDxxPdK', 'CJJoDIvQoofiV', '3158561629', 'def.png', 'hkpwpucorrvonyjfo@yahoo.com', NULL, '$2y$10$u4EOE0mKLEDL5mjb4Nljb.gsWbxsz0.44nqrTFGJ8QdXeqDwmKJZy', NULL, '2025-01-07 13:26:48', '2025-01-07 13:26:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(68, NULL, 'OxICNqeM', 'ZbZvpTGxH', '5433630364', 'def.png', 'qafivogib18@gmail.com', NULL, '$2y$10$nG0NXidMeKnOZOtqvzCjlehXGQzadi9kfAa9b.bO0zGXntEGsirRW', NULL, '2025-01-08 14:35:08', '2025-01-08 14:35:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(69, NULL, 'IcUWswtzrsKQW', 'YwRpNOvvJQ', '9183790194', 'def.png', 'storhaghle@yahoo.com', NULL, '$2y$10$qs0OoUgKpL8RMZm/IDWBBODRPOv.xxmRc8zeDqSAma1BFCqWzGUR6', NULL, '2025-01-09 18:06:26', '2025-01-09 18:06:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(70, NULL, 'efIxPifO', 'IhKDOMvAzY', '7466765709', 'def.png', 'raqixasomah63@gmail.com', NULL, '$2y$10$3SS1iDIRJt8g9neSDH8nMeG3aDUQKfx3q9os5pF/0rMi/M/REgNqi', NULL, '2025-01-10 17:32:22', '2025-01-10 17:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(71, NULL, 'bkvDrvHxTghud', 'OcsmonDmCpwukkb', '2172142706', 'def.png', 'gschneidingerhin@yahoo.com', NULL, '$2y$10$EjYE/unape4JBCuiArFWE.eAcH4vClwy9ElKeS9G6Ld9hU6wIoSn.', NULL, '2025-01-11 15:34:55', '2025-01-11 15:34:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(72, NULL, 'kisxdSseWTf', 'NGSmrYGfIVtVLA', '3503288637', 'def.png', 'iguxumadaqe92@gmail.com', NULL, '$2y$10$MR7hjueQFc.scQW.rVOiEuaSjQ7SBGHk7.mwQdBssYwlfYP.eU6ze', NULL, '2025-01-12 14:34:39', '2025-01-12 14:34:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(73, NULL, 'vPqafusoedg', 'QxOjpmOKrzzv', '9216395840', 'def.png', 'qqxi4uytdpr@yahoo.com', NULL, '$2y$10$mazCt97S8xOF130zpa9wyexIUJxJbdn6Sd86o6fMHxmtV.uCQ2agy', NULL, '2025-01-13 17:47:37', '2025-01-13 17:47:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(74, NULL, 'spxwoeb http://utkalenterprises.net/94716', 'spxwoeb http://utkalenterprises.net/94716', 'spxwoeb http://utkalenter', 'def.png', 'greyka2010+NednO69gM@gmail.com', NULL, '$2y$10$mB/cl.eoCT1UpPNfavRFie.XFLrS6AqZlCTaxJbqq6V.boLz6yONy', NULL, '2025-01-14 08:15:39', '2025-01-14 08:15:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(75, NULL, 'hoZKwySiYDQpkt', 'MFVmPtLLJ', '6113376924', 'def.png', 'allensolomonbo@gmail.com', NULL, '$2y$10$UmoQg0MKAfJmO4gvEuk59OZDZSCSh6f0WgdOGiiH3GdgEttqNLQ0m', NULL, '2025-01-15 06:05:00', '2025-01-15 06:05:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(76, NULL, 'iRvSxPLT', 'pzMuCJbIYnq', '5958433194', 'def.png', 'gossameraujade20@gmail.com', NULL, '$2y$10$4l6Pra8uKZnE6PbwQH/SGO7e8LgTDj3UWq/qlE4.US4Z0tvEhZtcO', NULL, '2025-01-16 19:11:15', '2025-01-16 19:11:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(77, NULL, 'vtHhBMzudGHUYr', 'RqwmDKZVcdqYM', '6315231566', 'def.png', 'duskaglyph19@gmail.com', NULL, '$2y$10$9RmelHVvZ01ZfZIWgKo3e.6fUEw7nlNy9p2xTc6gHK8udrkrPc/dW', NULL, '2025-01-18 00:17:25', '2025-01-18 00:17:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(78, NULL, 'andZHpGl', 'EVoDQfXJ', '9117885248', 'def.png', 'wuiapqtezrx2n@yahoo.com', NULL, '$2y$10$AtkR1IriEM9FxBDu7L/niOIQEl2riNImzOCPCeYNfKFtBZXu3AUke', NULL, '2025-01-19 03:34:36', '2025-01-19 03:34:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(79, NULL, 'RVXdTVOZnJG', 'uRIzujBKNuM', '3990765355', 'def.png', 'iuthilon@yahoo.com', NULL, '$2y$10$0rrcP.XJ8EuBdBe9SCJNvuWcH3.h8FwmIzKEv4QaiNPC9o0gF9sD.', NULL, '2025-01-20 00:14:19', '2025-01-20 00:14:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(80, NULL, 'HdcHrhwHo', 'FNiCzbCOMCfNfL', '9585384016', 'def.png', 'ayjubileeou42delveea@gmail.com', NULL, '$2y$10$T0A5HG4EDwP0rmt77p3vKec8MBbMn94w8YKLwvZx7dYnZAcFHTZhS', NULL, '2025-01-20 20:35:27', '2025-01-20 20:35:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(81, NULL, 'hEMqWhrXvVlkq', 'grEOjlaYCh', '8597689212', 'def.png', 'towllpnbirkwdpstx@yahoo.com', NULL, '$2y$10$zIQHjqW.33Go057qXtxZ.e3RFR90YWcOAvI1ilegazA7M8RoBlU7C', NULL, '2025-01-22 11:34:50', '2025-01-22 11:34:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(82, NULL, 'vXtNFlOzcTMb', 'htCmKURNBoovaJ', '4515417933', 'def.png', 'ivt5peusrrkdr5@yahoo.com', NULL, '$2y$10$i1TOH6ClHbJIQY42VNdQD.5.v1nbkpv4sEkriCYnYpUU01ujWHM0O', NULL, '2025-01-23 20:34:16', '2025-01-23 20:34:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(83, NULL, 'ETdjUljtDQQudCi', 'zkniiTgSXo', '9757730348', 'def.png', 'etragari@yahoo.com', NULL, '$2y$10$eV0917w4NYky6GiB8MFMfOUs4VvfY4ZLufEcNiVrMA//Ni610c5b.', NULL, '2025-01-25 11:29:20', '2025-01-25 11:29:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(84, NULL, 'ZqZnbDFrJCcr', 'UgRFurLrqfBsEHd', '5424888813', 'def.png', 'Derek6Durham5902@gmail.com', NULL, '$2y$10$h4y5uVIJIegzP/HynbMBxONEtvxnA354xLuSMjAwbHVItnDl7kMqm', NULL, '2025-01-27 04:03:42', '2025-01-27 04:03:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(85, NULL, 'QYKspjtjiNGsQsH', 'lhwYKSLeLEdP', '5878167681', 'def.png', 'Kellie1Shaw9709@gmail.com', NULL, '$2y$10$Lm8.LhuYNdSIqJ1KnwWZu.HhZ8AxC.dMXWcWm87tR7cEaNXghU4Jy', NULL, '2025-01-28 21:36:44', '2025-01-28 21:36:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(86, NULL, 'zhTJMqIgcoyjCjd', 'WTRHrvmbAlEQkOS', '3291274905', 'def.png', 'Leroy6Boolman2906@gmail.com', NULL, '$2y$10$z.4pwnvBEKu6TpYq/AWsAeSk.9y49eQ2zhl4kJRDU34dw84hIZtFq', NULL, '2025-01-31 03:00:39', '2025-01-31 03:00:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(87, NULL, 'jXvEfOVpoKix', 'XwLZTJDAu', '7070035917', 'def.png', 'soponorza@yahoo.com', NULL, '$2y$10$Nz3MRMtHZHC1S9fArfZxSu8SGmoMXLLey5Iqy5rQ3KTQ2IXzNlQBS', NULL, '2025-02-01 13:06:21', '2025-02-01 13:06:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(88, NULL, 'AwvusPtgVYaHB', 'EARzvAfxbXjWnZ', '2631427378', 'def.png', 'ayuvigan42@gmail.com', NULL, '$2y$10$MTtUOZFUQTT8McrYDqEZlOOIwR34/gnaH1fE99.lkeBe6ovhyiC96', NULL, '2025-02-02 12:09:48', '2025-02-02 12:09:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(89, NULL, 'SgCKLpImn', 'FiTQksujUyjI', '7065746429', 'def.png', 'idiramogirej14@gmail.com', NULL, '$2y$10$lLYrohXoPG23meS4qWy4CeqDeNM3a37kXTnUZJLipLyWlS.WoFtUa', NULL, '2025-02-03 09:34:14', '2025-02-03 09:34:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(90, NULL, 'CCEsTVpyMgRgdcm', 'HFXKwNnjytE', '8519208581', 'def.png', 'uuyfpjsbvrfgugfk@yahoo.com', NULL, '$2y$10$HuWwng35tsc3jZwbE0rky.7pcCyGpS55o5vyU0qhDstZ7kQ6xMTDi', NULL, '2025-02-04 11:27:26', '2025-02-04 11:27:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(91, NULL, 'bQQQgXISTm', 'vSMRCmjHAtr', '6283681261', 'def.png', 'duskyjadey@gmail.com', NULL, '$2y$10$Z7lN5b23vL9tzrm6eNUn4.sIucUkHhgAh2E/zYwohyQ4GN/7Xq1T6', NULL, '2025-02-05 11:59:38', '2025-02-05 11:59:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(92, NULL, 'OKILYWrh', 'HRuTxEYsc', '6976139110', 'def.png', 'aiobsidian46rift30@gmail.com', NULL, '$2y$10$.fyyl7NHwRUnD7vGYwbvz.3fDdVFA.tno40mxxpD.BDevEA8Skklm', NULL, '2025-02-06 11:32:59', '2025-02-06 11:32:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(93, NULL, 'KxNFWtMURg', 'oajiPYLnMxIn', '3368765799', 'def.png', 'avortexwraith44@gmail.com', NULL, '$2y$10$AQ8zAXJ0qSmZJrx0xLHhFuMiYJgMz.hGImsuPQf8KBiikwCylbFvW', NULL, '2025-02-07 11:21:25', '2025-02-07 11:21:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(94, NULL, 'WnHnkFYW', 'ElOVQZKSzJAYbm', '3402224072', 'def.png', 'illuminateiofrost@gmail.com', NULL, '$2y$10$/bsn5HAt8ia776pGPCR.i.y.QvYeqjqqFo8nmCbQRytedyjw362Mu', NULL, '2025-02-08 19:48:52', '2025-02-08 19:48:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(95, NULL, 'HjTQFYLzKMGC', 'EtQtdadYKiWgh', '2740646136', 'def.png', 'aiphantom83pinnacle42io@gmail.com', NULL, '$2y$10$a/ohQGuNWRZUwj8AHbFRQ.k9FrzrUdC8vaBr3hL6Qf8h1q6lozmie', NULL, '2025-02-10 11:53:01', '2025-02-10 11:53:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(96, NULL, 'fQNrDuBGTWxpa', 'lGSvyyZMKMRXd', '7817804767', 'def.png', 'zenithi12alchemy@gmail.com', NULL, '$2y$10$KYvQ4GJ0erattD8lCJABEeZDwGja4Xmb787jtMKGgUzX7xMy3bAl2', NULL, '2025-02-11 23:26:19', '2025-02-11 23:26:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(191) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `withdrawal_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`withdrawal_method_fields`)),
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=763;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100006;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
