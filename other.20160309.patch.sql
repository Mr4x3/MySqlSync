--
-- MySqlSync 0.1 Patch Script
-- Created: Wed, Mar 09, 2016
-- Server Version: 5.5.47-0ubuntu0.14.04.1
-- Apply To: localhost/other
--

USE `other`;
CREATE TABLE `prod_base_product` ( `base_product_id` int(10) NOT NULL AUTO_INCREMENT, `getit_base_product_id` int(11) NOT NULL, `title` varchar(255) NOT NULL DEFAULT '0', `small_description` text, `description` text, `color` varchar(255) DEFAULT NULL, `size` varchar(255) DEFAULT NULL, `product_weight` decimal(12,4) unsigned DEFAULT '0.0000', `brand` varchar(255) DEFAULT NULL, `unit_of_measurement_one` varchar(150) DEFAULT NULL, `model_name` varchar(255) DEFAULT NULL, `model_number` varchar(255) DEFAULT NULL, `manufacture` varchar(255) DEFAULT NULL, `manufacture_country` varchar(100) DEFAULT NULL, `manufacture_year` int(11) DEFAULT NULL, `specifications` text, `key_features` text, `meta_title` varchar(150) DEFAULT NULL, `meta_keyword` varchar(255) DEFAULT NULL, `meta_description` varchar(150) DEFAULT NULL, `average_rating` int(11) NOT NULL DEFAULT '0', `other_website_rating` int(11) NOT NULL DEFAULT '0', `is_configurable` smallint(6) NOT NULL DEFAULT '0', `configurable_with` text, `status` tinyint(1) NOT NULL DEFAULT '1', `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, `modified_date` timestamp NULL DEFAULT NULL, `campaign_id` int(11) NOT NULL DEFAULT '0', `is_deleted` smallint(6) NOT NULL DEFAULT '0', `is_serial_required` tinyint(4) NOT NULL DEFAULT '0', `product_content_type` varchar(255) DEFAULT NULL, `ISBN` varchar(255) DEFAULT NULL, `product_shipping_charge` int(11) NOT NULL DEFAULT '0', `video_url` varchar(255) DEFAULT NULL, `brand_id` int(11) NOT NULL, `SKUCode` varchar(255) NOT NULL, `VAT` varchar(15) NOT NULL, `moq` decimal(65,2) NOT NULL, `moq_increment` decimal(65,2) NOT NULL, `unit_of_measurement_two` varchar(150) DEFAULT NULL, `is_no_follow` tinyint(1) DEFAULT NULL, `thumb_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL, `pincode_search` tinyint(1) DEFAULT NULL, `base_ref_id` varchar(10) DEFAULT NULL, `slug` text, `default_category` int(11) NOT NULL DEFAULT '0', `combo_categories` varchar(255) DEFAULT NULL, `keywords` text, `is_installation_required` tinyint(2) DEFAULT NULL, `installation_amount` decimal(12,4) DEFAULT NULL, `installation_moq` decimal(12,4) DEFAULT NULL, `installation_unit_of_measurement` varchar(255) DEFAULT NULL, `additional_text` text, `extra_material_required` tinyint(2) NOT NULL DEFAULT '0', `extra_material_price` decimal(12,4) DEFAULT NULL, PRIMARY KEY (`base_product_id`)) ENGINE=InnoDB AUTO_INCREMENT=24008 DEFAULT CHARSET=utf8;
CREATE TABLE `prod_store_price_mapping` ( `id` int(11) NOT NULL AUTO_INCREMENT, `base_product_id` int(11) NOT NULL, `subscribed_product_id` int(11) DEFAULT NULL, `store_id` int(11) NOT NULL, `store_price` decimal(12,4) NOT NULL, `store_offer_price` decimal(12,4) NOT NULL, `lead_time` varchar(255) NOT NULL DEFAULT '0', `publish` int(11) NOT NULL DEFAULT '1', `unit_price` decimal(12,4) NOT NULL, `secondary_store_price` decimal(12,2) NOT NULL DEFAULT '0.00', PRIMARY KEY (`id`), UNIQUE KEY `unique_index` (`base_product_id`,`subscribed_product_id`,`store_id`), KEY `base_product_id` (`base_product_id`,`store_offer_price`), KEY `subscribed_product_id` (`subscribed_product_id`,`store_offer_price`), KEY `base_product_id_2` (`base_product_id`,`store_offer_price`)) ENGINE=InnoDB AUTO_INCREMENT=44975 DEFAULT CHARSET=latin1;
CREATE TABLE `prod_subscribed_product` ( `subscribed_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT, `base_product_id` int(10) unsigned NOT NULL, `store_id` int(10) unsigned NOT NULL, `unit_rate` decimal(12,4) NOT NULL DEFAULT '0.0000', `store_price` decimal(12,4) NOT NULL DEFAULT '0.0000', `secondary_store_price` decimal(12,4) DEFAULT NULL, `store_offer_price` decimal(12,4) NOT NULL DEFAULT '0.0000', `weight` varchar(100) DEFAULT '0.0000', `length` varchar(100) DEFAULT '0.0000', `width` varchar(100) DEFAULT '0.0000', `height` varchar(100) DEFAULT '0.0000', `warranty` varchar(100) DEFAULT NULL, `prompt` smallint(6) DEFAULT NULL, `prompt_key` varchar(100) DEFAULT NULL, `status` tinyint(1) NOT NULL DEFAULT '1', `checkout_url` varchar(2083) DEFAULT NULL, `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP, `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00', `is_deleted` smallint(6) NOT NULL DEFAULT '0', `sku` varchar(128) NOT NULL, `quantity` int(11) NOT NULL DEFAULT '25', `is_cod` tinyint(2) NOT NULL DEFAULT '1', `subscribe_shipping_charge` int(11) NOT NULL DEFAULT '0', `size` varchar(100) NOT NULL, `color` varchar(255) NOT NULL, `variant_on` varchar(100) NOT NULL, `views` int(11) DEFAULT '0', `totorders` int(11) DEFAULT '0', `thumb_url` text, `moq` decimal(65,2) NOT NULL, `title` text, `vat` varchar(15) DEFAULT NULL, `base_ref_id` varchar(20) DEFAULT NULL, `subscribed_ref_id` varchar(20) DEFAULT NULL, PRIMARY KEY (`subscribed_product_id`)) ENGINE=InnoDB AUTO_INCREMENT=35316 DEFAULT CHARSET=utf8;
DROP TABLE `Products_producttaxmastermapping`;
DROP TABLE `attribute`;
DROP TABLE `attributes_data`;
DROP TABLE `auth_group`;
DROP TABLE `auth_group_permissions`;
DROP TABLE `auth_permission`;
DROP TABLE `auth_user`;
DROP TABLE `auth_user_groups`;
DROP TABLE `auth_user_user_permissions`;
DROP TABLE `django_admin_log`;
DROP TABLE `django_content_type`;
DROP TABLE `django_session`;
DROP TABLE `old_store__price_mapping`;
DROP TABLE `popular_products`;
DROP TABLE `supplified_masterimportupload`;
ALTER TABLE `Products_attributes` DROP COLUMN `ascii_ignd_name`, MODIFY COLUMN `name` varchar(255) NULL AFTER `id`, MODIFY COLUMN `display_name` varchar(255) NULL AFTER `name`, DROP INDEX `name`, DROP INDEX `name_2`, CHARSET=latin1 COLLATE=latin1_swedish_ci AUTO_INCREMENT=1;
ALTER TABLE `Products_categoryattributesmapping` DROP COLUMN `change_log_id`, DROP COLUMN `filter_sequence`, AUTO_INCREMENT=1;
ALTER TABLE `Products_productcategoryattributesmapping` AUTO_INCREMENT=1;
ALTER TABLE `Products_productcategoryattributesmappingfilters` MODIFY COLUMN `text_value` longtext NULL AFTER `subscribed_ref_id`, DROP INDEX `decimal_value`, DROP INDEX `int_value`, DROP INDEX `text_value`, AUTO_INCREMENT=1;
ALTER TABLE `base_product` DROP COLUMN `video_link`, AUTO_INCREMENT=1;
ALTER TABLE `brand` AUTO_INCREMENT=231;
ALTER TABLE `category` DROP COLUMN `category_icon`, DROP COLUMN `category_description`, AUTO_INCREMENT=934;
ALTER TABLE `company_info` AUTO_INCREMENT=22;
ALTER TABLE `contact` AUTO_INCREMENT=68;
ALTER TABLE `coupon_user_mapping` AUTO_INCREMENT=51;
ALTER TABLE `feedback` AUTO_INCREMENT=100;
ALTER TABLE `history_mycart` ADD COLUMN `region_id` tinyint(2) NOT NULL DEFAULT '0' AFTER `store_id`, ADD COLUMN `store_code` varchar(255) NULL AFTER `region_id`, ADD COLUMN `unit_of_measurement_one` varchar(150) NULL AFTER `lead_time`, ADD COLUMN `install_qty` int(11) NOT NULL DEFAULT '0' AFTER `unit_of_measurement_one`, ADD COLUMN `install_amount` decimal(12,2) NULL AFTER `install_qty`, ADD COLUMN `installation_moq` int(11) NULL AFTER `install_amount`, ADD COLUMN `installation_uom` varchar(255) NULL AFTER `installation_moq`, ADD COLUMN `moq_increment` int(11) NOT NULL DEFAULT '0' AFTER `installation_uom`, ADD COLUMN `category_id` varchar(20) NULL DEFAULT '0' AFTER `moq_increment`, ADD COLUMN `brand_id` varchar(20) NULL DEFAULT '0' AFTER `category_id`, ADD COLUMN `variant_details` varchar(255) NULL AFTER `brand_id`, ADD COLUMN `moq_sme` decimal(65,2) NOT NULL AFTER `variant_details`, ADD COLUMN `moq_enterprise` decimal(12,4) NOT NULL AFTER `moq_sme`, ADD COLUMN `moq_increment_enterprise` decimal(12,4) NOT NULL AFTER `moq_enterprise`, ADD COLUMN `moq_enterprise_price` decimal(12,4) NOT NULL AFTER `moq_increment_enterprise`, ADD COLUMN `moq_sme_price` decimal(12,4) NOT NULL AFTER `moq_enterprise_price`, ADD COLUMN `moq_increment_sme` int(11) NOT NULL AFTER `moq_sme_price`, MODIFY COLUMN `user_id` int(11) NOT NULL AFTER `id`, DROP INDEX `user_id`, AUTO_INCREMENT=4306;
ALTER TABLE `login` ADD COLUMN `enterprise_login` int(11) NOT NULL AFTER `is_verified`, ADD COLUMN `group_type` varchar(20) NULL DEFAULT '0' AFTER `is_staff`, AUTO_INCREMENT=516;
ALTER TABLE `login_verify` AUTO_INCREMENT=627;
ALTER TABLE `mycart` ADD COLUMN `region_id` tinyint(2) NOT NULL DEFAULT '0' AFTER `store_id`, ADD COLUMN `store_code` varchar(255) NULL AFTER `region_id`, ADD COLUMN `deleted_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' AFTER `store_name`, ADD COLUMN `unit_of_measurement_one` varchar(150) NULL AFTER `lead_time`, ADD COLUMN `install_qty` int(11) NOT NULL DEFAULT '0' AFTER `unit_of_measurement_one`, ADD COLUMN `install_amount` decimal(12,2) NULL AFTER `install_qty`, ADD COLUMN `installation_moq` int(11) NULL AFTER `install_amount`, ADD COLUMN `installation_uom` varchar(255) NULL AFTER `installation_moq`, ADD COLUMN `moq_increment` int(11) NOT NULL DEFAULT '0' AFTER `installation_uom`, ADD COLUMN `category_id` varchar(20) NULL DEFAULT '0' AFTER `moq_increment`, ADD COLUMN `brand_id` varchar(20) NULL DEFAULT '0' AFTER `category_id`, ADD COLUMN `variant_details` varchar(255) NULL AFTER `brand_id`, ADD COLUMN `moq_sme` decimal(65,2) NOT NULL AFTER `variant_details`, ADD COLUMN `moq_enterprise` decimal(12,4) NOT NULL AFTER `moq_sme`, ADD COLUMN `moq_increment_enterprise` decimal(12,4) NOT NULL AFTER `moq_enterprise`, ADD COLUMN `moq_enterprise_price` decimal(12,4) NOT NULL AFTER `moq_increment_enterprise`, ADD COLUMN `moq_sme_price` decimal(12,4) NOT NULL AFTER `moq_enterprise_price`, ADD COLUMN `moq_increment_sme` int(11) NOT NULL AFTER `moq_sme_price`, ADD COLUMN `mapped_category_id` varchar(255) NULL DEFAULT '0' AFTER `moq_increment_sme`, MODIFY COLUMN `product_qty` decimal(12,4) NOT NULL AFTER `variant_id`, AUTO_INCREMENT=4599;
ALTER TABLE `newsletter` AUTO_INCREMENT=387;
ALTER TABLE `order_header` ADD COLUMN `affiliate_utm_source` varchar(255) NULL AFTER `user_email`, ADD COLUMN `affiliate_gclid` varchar(255) NULL AFTER `affiliate_utm_source`, ADD COLUMN `affiliate_campaign_id` varchar(255) NULL AFTER `affiliate_gclid`, AUTO_INCREMENT=892;
ALTER TABLE `order_line` ADD COLUMN `store_code` varchar(255) NULL AFTER `store_id`, ADD COLUMN `unit_of_measurement_one` varchar(150) NULL AFTER `lead_time`, ADD COLUMN `install_unit_price` decimal(12,2) NULL AFTER `unit_of_measurement_one`, ADD COLUMN `install_qty` int(11) NOT NULL DEFAULT '0' AFTER `install_unit_price`, ADD COLUMN `install_amount` decimal(12,2) NULL AFTER `install_qty`, ADD COLUMN `installation_moq` int(11) NULL AFTER `install_amount`, ADD COLUMN `installation_uom` varchar(255) NULL AFTER `installation_moq`, ADD COLUMN `variant_details` varchar(255) NULL AFTER `installation_uom`, MODIFY COLUMN `product_qty` decimal(12,4) NULL AFTER `product_name`, MODIFY COLUMN `status` enum('processing','payment-pending','exportable','exported','po-created','ready-to-pickup','fullfillment-center','invoice-created','qc-packaging','shipped','delivered','closed','return-request','policy-not-applicable','return-denied','return-accepted','returned','to-be-returned-to-vendor','new-proc-exchange','exchange','refund','closed','order-cancelled','seller-accepted','seller-rejected','cancel-by-buyer','cancelled-by-stpl','partially-delivered') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `shipping_charges`, AUTO_INCREMENT=1264;
ALTER TABLE `pg_transactions` AUTO_INCREMENT=311;
ALTER TABLE `pincode_master` AUTO_INCREMENT=1253;
ALTER TABLE `product_pincode_mapping` ADD UNIQUE INDEX `unique_store_product_pincode` (`store_id`, `base_product_id`, `region_id`) USING BTREE, AUTO_INCREMENT=43913;
ALTER TABLE `promocode` ADD COLUMN `category_ids` text NULL AFTER `is_staff`, ADD COLUMN `brand_ids` text NULL AFTER `category_ids`, ADD COLUMN `group_type` varchar(20) NULL DEFAULT '0' AFTER `brand_ids`, ADD COLUMN `max_discount` decimal(12,2) NULL AFTER `group_type`, ADD COLUMN `applying_count_limit` int(50) NULL AFTER `max_discount`, AUTO_INCREMENT=11;
ALTER TABLE `store_price_mapping` DROP COLUMN `moq_enterprise_price`, DROP COLUMN `moq_sme`, DROP COLUMN `moq_sme_price`, DROP COLUMN `moq_increment_sme`, MODIFY COLUMN `moq_retail` decimal(12,4) NOT NULL DEFAULT '0.0000' AFTER `markup`, MODIFY COLUMN `moq_incremental_retail` decimal(12,4) NOT NULL DEFAULT '0.0000' AFTER `moq_retail`, MODIFY COLUMN `moq_enterprise` decimal(12,4) NOT NULL DEFAULT '0.0000' AFTER `moq_incremental_retail`, MODIFY COLUMN `moq_increment_enterprise` decimal(12,4) NOT NULL DEFAULT '0.0000' AFTER `moq_enterprise`, MODIFY COLUMN `processing_time` int(10) NOT NULL DEFAULT '0' AFTER `is_returnable`, AUTO_INCREMENT=1;
ALTER TABLE `user_address` AUTO_INCREMENT=327;
