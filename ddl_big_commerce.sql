DROP INDEX `iddashfacts_clients_unique` ON `dashfacts_clients`;

ALTER TABLE `dashfacts_clients`DROP PRIMARY KEY;

DROP TABLE `brands`;
DROP TABLE `categories`;
DROP TABLE `countries`;
DROP TABLE `coupons`;
DROP TABLE `customer_addresses`;
DROP TABLE `customers`;
DROP TABLE `dashfacts_clients`;
DROP TABLE `option_values`;
DROP TABLE `options`;
DROP TABLE `optionsets`;
DROP TABLE `order_status`;
DROP TABLE `orders`;
DROP TABLE `orders_coupons`;
DROP TABLE `orders_products`;
DROP TABLE `orders_shipments`;
DROP TABLE `orders_shipping_address`;
DROP TABLE `products`;
DROP TABLE `products_discount`;
DROP TABLE `products_sku`;
DROP TABLE `states`;
DROP TABLE `store`;
DROP TABLE `users`;

CREATE TABLE `brands` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`page_title` tinytext NULL,
`meta_keywords` tinytext NULL,
`meta_description` tinytext NULL,
`image_file` tinytext NULL,
`search_keywords` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `categories` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`parent_id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`description` tinytext NULL,
`sort_order` int(11) NULL DEFAULT NULL,
`page_title` tinytext NULL,
`meta_keywords` tinytext NULL,
`meta_description` tinytext NULL,
`layout_file` tinytext NULL,
`parent_category_list` tinytext NULL,
`image_file` tinytext NULL,
`is_visible` tinytext NULL,
`search_keywords` tinytext NULL,
`url` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `countries` (
`countries` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`country` tinytext NULL,
`country_iso2` tinytext NULL,
`country_iso3` tinytext NULL,
`states` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `coupons` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`type` tinytext NULL,
`amount` double NULL DEFAULT NULL,
`min_purchase` double NULL DEFAULT NULL,
`expires` tinytext NULL,
`enabled` tinytext NULL,
`code` tinytext NULL,
`entity` tinytext NULL,
`ids` tinytext NULL,
`num_uses` int(11) NULL DEFAULT NULL,
`max_uses` int(11) NULL DEFAULT NULL,
`max_uses_per_customer` int(11) NULL DEFAULT NULL,
`restricted_to` tinytext NULL,
`shipping_methods` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `customer_addresses` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`customer_id` int(11) NULL DEFAULT NULL,
`first_name` tinytext NULL,
`last_name` tinytext NULL,
`company` tinytext NULL,
`street_1` tinytext NULL,
`street_2` tinytext NULL,
`city` tinytext NULL,
`state` tinytext NULL,
`zip` int(11) NULL DEFAULT NULL,
`country` tinytext NULL,
`country_iso2` tinytext NULL,
`phone` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `customers` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`company` tinytext NULL,
`first_name` tinytext NULL,
`last_name` tinytext NULL,
`email` tinytext NULL,
`phone` tinytext NULL,
`date_created` tinytext NULL,
`date_modified` tinytext NULL,
`store_credit` double NULL DEFAULT NULL,
`registration_ip_address` tinytext NULL,
`customer_group_id` int(11) NULL DEFAULT NULL,
`notes` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `dashfacts_clients` (
`dashfacts_id` int(11) NOT NULL AUTO_INCREMENT,
`store_address` varchar(105) NOT NULL,
`username` varchar(45) NOT NULL,
`api_key` varchar(45) NOT NULL,
PRIMARY KEY (`dashfacts_id`) ,
UNIQUE INDEX `iddashfacts_clients_unique` (`dashfacts_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2;

CREATE TABLE `option_values` (
`options_values` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`option_id` int(11) NULL DEFAULT NULL,
`label` tinytext NULL,
`sort_order` int(11) NULL DEFAULT NULL,
`value` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `options` (
`options` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`display_name` tinytext NULL,
`type` tinytext NULL,
`values` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `optionsets` (
`optionsets` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`options` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `order_status` (
`order_status` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`order` int(11) NULL DEFAULT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `orders` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`customer_id` int(11) NULL DEFAULT NULL,
`date_created` tinytext NULL,
`date_modified` tinytext NULL,
`date_shipped` tinytext NULL,
`status_id` int(11) NULL DEFAULT NULL,
`status` tinytext NULL,
`subtotal_ex_tax` double NULL DEFAULT NULL,
`subtotal_inc_tax` double NULL DEFAULT NULL,
`subtotal_tax` double NULL DEFAULT NULL,
`base_shipping_cost` double NULL DEFAULT NULL,
`shipping_cost_ex_tax` double NULL DEFAULT NULL,
`shipping_cost_inc_tax` double NULL DEFAULT NULL,
`shipping_cost_tax` double NULL DEFAULT NULL,
`shipping_cost_tax_class_id` int(11) NULL DEFAULT NULL,
`base_handling_cost` double NULL DEFAULT NULL,
`handling_cost_ex_tax` double NULL DEFAULT NULL,
`handling_cost_inc_tax` double NULL DEFAULT NULL,
`handling_cost_tax` double NULL DEFAULT NULL,
`handling_cost_tax_class_id` int(11) NULL DEFAULT NULL,
`base_wrapping_cost` double NULL DEFAULT NULL,
`wrapping_cost_ex_tax` double NULL DEFAULT NULL,
`wrapping_cost_inc_tax` double NULL DEFAULT NULL,
`wrapping_cost_tax` double NULL DEFAULT NULL,
`wrapping_cost_tax_class_id` int(11) NULL DEFAULT NULL,
`total_ex_tax` double NULL DEFAULT NULL,
`total_inc_tax` double NULL DEFAULT NULL,
`total_tax` double NULL DEFAULT NULL,
`items_total` int(11) NULL DEFAULT NULL,
`items_shipped` int(11) NULL DEFAULT NULL,
`payment_method` tinytext NULL,
`payment_provider_id` tinytext NULL,
`payment_status` tinytext NULL,
`refunded_amount` double NULL DEFAULT NULL,
`order_is_digital` tinytext NULL,
`store_credit_amount` double NULL DEFAULT NULL,
`gift_certificate_amount` double NULL DEFAULT NULL,
`ip_address` tinytext NULL,
`geoip_country` tinytext NULL,
`geoip_country_iso2` tinytext NULL,
`currency_id` int(11) NULL DEFAULT NULL,
`currency_code` tinytext NULL,
`currency_exchange_rate` double NULL DEFAULT NULL,
`default_currency_id` int(11) NULL DEFAULT NULL,
`default_currency_code` tinytext NULL,
`staff_notes` tinytext NULL,
`customer_message` tinytext NULL,
`discount_amount` double NULL DEFAULT NULL,
`coupon_discount` double NULL DEFAULT NULL,
`shipping_address_count` int(11) NULL DEFAULT NULL,
`is_deleted` tinytext NULL,
`first_name` tinytext NULL,
`last_name` tinytext NULL,
`company` tinytext NULL,
`street_1` int(11) NULL DEFAULT NULL,
`street_2` tinytext NULL,
`city` tinytext NULL,
`state` tinytext NULL,
`zip` varchar(11) NULL DEFAULT NULL,
`country` tinytext NULL,
`country_iso2` tinytext NULL,
`phone` tinytext NULL,
`email` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `orders_coupons` (
`orders_coupons` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`coupon_id` int(11) NULL DEFAULT NULL,
`order_id` int(11) NULL DEFAULT NULL,
`code` tinytext NULL,
`amount` double NULL DEFAULT NULL,
`type` int(11) NULL DEFAULT NULL,
`discount` double NULL DEFAULT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `orders_products` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`order_id` int(11) NULL DEFAULT NULL,
`product_id` int(11) NULL DEFAULT NULL,
`order_address_id` int(11) NULL DEFAULT NULL,
`name` tinytext NULL,
`sku` tinytext NULL,
`type` tinytext NULL,
`base_price` double NULL DEFAULT NULL,
`price_ex_tax` double NULL DEFAULT NULL,
`price_inc_tax` double NULL DEFAULT NULL,
`price_tax` double NULL DEFAULT NULL,
`base_total` double NULL DEFAULT NULL,
`total_ex_tax` double NULL DEFAULT NULL,
`total_inc_tax` double NULL DEFAULT NULL,
`total_tax` double NULL DEFAULT NULL,
`weight` double NULL DEFAULT NULL,
`quantity` int(11) NULL DEFAULT NULL,
`base_cost_price` double NULL DEFAULT NULL,
`cost_price_inc_tax` double NULL DEFAULT NULL,
`cost_price_ex_tax` double NULL DEFAULT NULL,
`cost_price_tax` double NULL DEFAULT NULL,
`is_refunded` tinytext NULL,
`refund_amount` double NULL DEFAULT NULL,
`return_id` int(11) NULL DEFAULT NULL,
`wrapping_name` tinytext NULL,
`base_wrapping_cost` double NULL DEFAULT NULL,
`wrapping_cost_ex_tax` double NULL DEFAULT NULL,
`wrapping_cost_inc_tax` double NULL DEFAULT NULL,
`wrapping_cost_tax` double NULL DEFAULT NULL,
`wrapping_message` tinytext NULL,
`quantity_shipped` int(11) NULL DEFAULT NULL,
`event_name` tinytext NULL,
`event_date` tinytext NULL,
`fixed_shipping_cost` double NULL DEFAULT NULL,
`ebay_item_id` tinytext NULL,
`ebay_transaction_id` tinytext NULL,
`option_set_id` tinytext NULL,
`parent_order_product_id` tinytext NULL,
`is_bundled_product` tinytext NULL,
`bin_picking_number` tinytext NULL,
`discount_amount` float NULL DEFAULT NULL,
`product_options` tinytext NULL,
`configurable_fields` tinytext NULL,
`discount_type` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `orders_shipments` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`order_id` int(11) NULL DEFAULT NULL,
`customer_id` int(11) NULL DEFAULT NULL,
`order_address_id` int(11) NULL DEFAULT NULL,
`date_created` tinytext NULL,
`tracking_number` tinytext NULL,
`shipping_method` tinytext NULL,
`comments` tinytext NULL,
`first_name` tinytext NULL,
`last_name` tinytext NULL,
`company` tinytext NULL,
`street_1` int(11) NULL DEFAULT NULL,
`street_2` tinytext NULL,
`city` tinytext NULL,
`state` tinytext NULL,
`zip` tinytext NULL,
`country` tinytext NULL,
`country_iso2` tinytext NULL,
`phone` tinytext NULL,
`email` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `orders_shipping_address` (
`store_name` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`order_id` int(11) NULL DEFAULT NULL,
`first_name` tinytext NULL,
`last_name` tinytext NULL,
`company` tinytext NULL,
`street_1` tinytext NULL,
`street_2` tinytext NULL,
`city` tinytext NULL,
`zip` tinytext NULL,
`country` tinytext NULL,
`country_iso2` tinytext NULL,
`state` tinytext NULL,
`email` tinytext NULL,
`phone` tinytext NULL,
`items_total` int(11) NULL DEFAULT NULL,
`items_shipped` int(11) NULL DEFAULT NULL,
`shipping_method` tinytext NULL,
`base_cost` double NULL DEFAULT NULL,
`cost_ex_tax` double NULL DEFAULT NULL,
`cost_inc_tax` double NULL DEFAULT NULL,
`cost_tax` double NULL DEFAULT NULL,
`cost_tax_class_id` int(11) NULL DEFAULT NULL,
`base_handling_cost` double NULL DEFAULT NULL,
`handling_cost_ex_tax` double NULL DEFAULT NULL,
`handling_cost_inc_tax` double NULL DEFAULT NULL,
`handling_cost_tax` double NULL DEFAULT NULL,
`handling_cost_tax_class_id` int(11) NULL DEFAULT NULL,
`shipping_zone_id` int(11) NULL DEFAULT NULL,
`shipping_zone_name` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `products` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`keyword_filter` tinytext NULL,
`name` tinytext NULL,
`type` tinytext NULL,
`sku` tinytext NULL,
`description` longtext NULL,
`search_keywords` tinytext NULL,
`availability_description` tinytext NULL,
`price` double NULL DEFAULT NULL,
`cost_price` double NULL DEFAULT NULL,
`retail_price` double NULL DEFAULT NULL,
`sale_price` double NULL DEFAULT NULL,
`sort_order` int(11) NULL DEFAULT NULL,
`is_visible` tinytext NULL,
`is_featured` tinytext NULL,
`related_products` int(11) NULL DEFAULT NULL,
`inventory_level` int(11) NULL DEFAULT NULL,
`inventory_warning_level` int(11) NULL DEFAULT NULL,
`warranty` tinytext NULL,
`weight` double NULL DEFAULT NULL,
`width` double NULL DEFAULT NULL,
`height` double NULL DEFAULT NULL,
`depth` double NULL DEFAULT NULL,
`fixed_cost_shipping_price` double NULL DEFAULT NULL,
`is_free_shipping` tinytext NULL,
`inventory_tracking` tinytext NULL,
`rating_total` int(11) NULL DEFAULT NULL,
`rating_count` int(11) NULL DEFAULT NULL,
`total_sold` int(11) NULL DEFAULT NULL,
`date_created` tinytext NULL,
`brand_id` int(11) NULL DEFAULT NULL,
`view_count` int(11) NULL DEFAULT NULL,
`page_title` tinytext NULL,
`meta_keywords` tinytext NULL,
`meta_description` tinytext NULL,
`layout_file` tinytext NULL,
`is_price_hidden` tinytext NULL,
`price_hidden_label` tinytext NULL,
`value` int(11) NULL DEFAULT NULL,
`date_modified` tinytext NULL,
`event_date_field_name` tinytext NULL,
`event_date_type` tinytext NULL,
`event_date_start` tinytext NULL,
`event_date_end` tinytext NULL,
`myob_asset_account` tinytext NULL,
`myob_income_account` tinytext NULL,
`myob_expense_account` tinytext NULL,
`peachtree_gl_account` tinytext NULL,
`condition` tinytext NULL,
`is_condition_shown` tinytext NULL,
`preorder_release_date` tinytext NULL,
`is_preorder_only` tinytext NULL,
`preorder_message` tinytext NULL,
`order_quantity_minimum` int(11) NULL DEFAULT NULL,
`order_quantity_maximum` int(11) NULL DEFAULT NULL,
`open_graph_type` tinytext NULL,
`open_graph_title` tinytext NULL,
`open_graph_description` tinytext NULL,
`is_open_graph_thumbnail` tinytext NULL,
`upc` tinytext NULL,
`date_last_imported` tinytext NULL,
`option_set_id` tinytext NULL,
`tax_class_id` int(11) NULL DEFAULT NULL,
`option_set_display` tinytext NULL,
`bin_picking_number` int(11) NULL DEFAULT NULL,
`custom_url` tinytext NULL,
`availability` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `products_discount` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`product_id` int(11) NULL DEFAULT NULL,
`min` int(11) NULL DEFAULT NULL,
`max` int(11) NULL DEFAULT NULL,
`type` tinytext NULL,
`type_value` double NULL DEFAULT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `products_sku` (
`store_name` longtext NULL,
`id` int(11) NULL DEFAULT NULL,
`product_id` int(11) NULL DEFAULT NULL,
`sku` tinytext NULL,
`cost_price` double NULL DEFAULT NULL,
`upc` tinytext NULL,
`inventory_level` int(11) NULL DEFAULT NULL,
`inventory_warning_level` int(11) NULL DEFAULT NULL,
`bin_picking_number` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `states` (
`states` tinytext NULL,
`id` int(11) NULL DEFAULT NULL,
`state` tinytext NULL,
`state_abbreviation` tinytext NULL,
`country_id` int(11) NULL DEFAULT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `store` (
`store_name` longtext NULL,
`id` tinytext NULL,
`domain` tinytext NULL,
`name` tinytext NULL,
`address` tinytext NULL,
`phone` tinytext NULL,
`admin_email` tinytext NULL,
`order_email` tinytext NULL,
`language` tinytext NULL,
`currency` tinytext NULL,
`weight_units` tinytext NULL,
`dimension_units` tinytext NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE `users` (
`username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
`password` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
`enabled` tinyint(1) NOT NULL,
`description` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci;

