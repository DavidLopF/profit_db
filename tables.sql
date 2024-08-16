-- profit_2.billing_period_shipto_configuration definition

CREATE TABLE `billing_period_shipto_configuration` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PERIOD_CONFIGURATION` json NOT NULL,
  `SHIP_TO_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIP_TO_ID` (`SHIP_TO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.client_marketplace definition

CREATE TABLE `client_marketplace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `discount_code_customer_matrix` varchar(255) DEFAULT NULL,
  `receives_partials` varchar(255) DEFAULT NULL,
  `lots_greater_than` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
  `BU` varchar(255) DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `pricelist_id` int DEFAULT NULL,
  `payment_condition` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx` (`id`,`warehouse_id`,`client_id`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1958 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.client_status definition

CREATE TABLE `client_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `STATUS_NAME` enum('creado','aprobado','rechazado','bloqueado','juridico','casa de cobro') DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.client_type definition

CREATE TABLE `client_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_TYPE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;


-- profit_2.condition_type definition

CREATE TABLE `condition_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONDITION_DAY` int NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.contact_position definition

CREATE TABLE `contact_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.country definition

CREATE TABLE `country` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COUNTRY_NAME` varchar(255) NOT NULL,
  `ADDRESS_FORMAT` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;


-- profit_2.country_calling_code definition

CREATE TABLE `country_calling_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.currency definition

CREATE TABLE `currency` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CURRENCY_NAME` varchar(255) NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;


-- profit_2.discount_category definition

CREATE TABLE `discount_category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discount_contracts_ranges definition

CREATE TABLE `discount_contracts_ranges` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_PROJECT` int DEFAULT NULL,
  `UNITS_FROM` int DEFAULT NULL,
  `UNITS_TO` int DEFAULT NULL,
  `ID_LINE` int DEFAULT NULL,
  `ID_PRODUCT` int DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.documents_types definition

CREATE TABLE `documents_types` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DOCUMENT_NAME` enum('NIT','Cedula','Pasaporte','Cedula de extranjeria') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.financial_discount_event_type definition

CREATE TABLE `financial_discount_event_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.financial_discount_motive definition

CREATE TABLE `financial_discount_motive` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.financial_discounts_document_types definition

CREATE TABLE `financial_discounts_document_types` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DOCUMENT_TYPE` varchar(255) NOT NULL,
  `RGB` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.financial_discounts_status definition

CREATE TABLE `financial_discounts_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FINANCIAL_STATUS` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.financial_records_document_types definition

CREATE TABLE `financial_records_document_types` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DOCUMENT_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.financial_records_status definition

CREATE TABLE `financial_records_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FINANCIAL_STATUS` varchar(255) NOT NULL,
  `RGB` varchar(255) DEFAULT '{0,0,0}',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.invoice_event_type definition

CREATE TABLE `invoice_event_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.invoice_incident_motive definition

CREATE TABLE `invoice_incident_motive` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.location definition

CREATE TABLE `location` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CITY` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb3;


-- profit_2.marketplace_client_project definition

CREATE TABLE `marketplace_client_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `project_id` int NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.marketplace_order definition

CREATE TABLE `marketplace_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `total_pronto_pago` double DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `detail` json DEFAULT NULL,
  `shipping_info` json DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint DEFAULT '0',
  `is_draft` tinyint DEFAULT '0',
  `order_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.notification_email definition

CREATE TABLE `notification_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `USER_COMUNICATION_ID` int DEFAULT NULL,
  `TEMPLATE_ID` int DEFAULT NULL,
  `NOTIFICATION_MESSAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.orders_status definition

CREATE TABLE `orders_status` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ORDER_STATUS` varchar(255) NOT NULL,
  `RGB` varchar(255) DEFAULT '{0,0,0}',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.page definition

CREATE TABLE `page` (
  `PAGE_ID` int NOT NULL AUTO_INCREMENT,
  `NUMBER_PAGE` int NOT NULL,
  `PAGE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;


-- profit_2.pricelist definition

CREATE TABLE `pricelist` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_idx` (`id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.pricelist_prices definition

CREATE TABLE `pricelist_prices` (
  `id` int NOT NULL,
  `id_pricelist` int DEFAULT NULL,
  `id_product` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_idx` (`id`,`id_pricelist`,`id_product`,`project_id`),
  KEY `id_pricelist` (`id_pricelist`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.products definition

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SKU` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `id_line` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `taxes` double DEFAULT NULL,
  `kit` tinyint(1) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `EAN` varchar(100) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SKU` (`SKU`),
  KEY `id_line` (`id_line`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.products_category definition

CREATE TABLE `products_category` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `project_id` int DEFAULT NULL,
  `line_id` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_idx` (`id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.products_line definition

CREATE TABLE `products_line` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_idx` (`id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.products_stock definition

CREATE TABLE `products_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` varchar(255) DEFAULT NULL,
  `id_warehouse` int DEFAULT NULL,
  `units` int DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `batch_date` date DEFAULT NULL,
  `units_calculated` int DEFAULT NULL,
  `batch_expiration_date` date DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_warehouse` (`id_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.products_vendor definition

CREATE TABLE `products_vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_products_line` int NOT NULL,
  `id_products_category` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.radication_type definition

CREATE TABLE `radication_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RADICATION_NAME` enum('email','web','radian','fisica','fisica y web') NOT NULL,
  `IS_DELETED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.risk definition

CREATE TABLE `risk` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RISK_NAME` enum('Bajo','Medio bajo','Medio','Medio alto','Alto','No calculado') DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.template definition

CREATE TABLE `template` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `BODY` varchar(255) NOT NULL,
  `TEMPLATE_TYPE` enum('Email','Whatsapp') NOT NULL,
  `TEMPLATE_SUBJECT` varchar(255) NOT NULL,
  `FILES` json NOT NULL,
  `CREATED_AT` date NOT NULL,
  `UPDATED_AT` date NOT NULL,
  `action_type` enum('ajustes contables','acuerdo de pago','registro contabilidad','cambio de estado','radicar factura','apligar pagos','vincular orden de compra') DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb3;


-- profit_2.`user` definition

CREATE TABLE `user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `POSITION` varchar(255) NOT NULL,
  `NOTIFICATION_CONFIG` json DEFAULT NULL,
  `UUID` mediumtext NOT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `IS_DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `ACTIVE` tinyint(1) DEFAULT '0',
  `PHOTO` varchar(255) NOT NULL DEFAULT 'https://fileusers.s3.us-east-2.amazonaws.com/user_default.webp',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb3;


-- profit_2.user_rol definition

CREATE TABLE `user_rol` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROL_NAME` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;


-- profit_2.warehouse definition

CREATE TABLE `warehouse` (
  `id` int DEFAULT NULL,
  `warehouse` varchar(255) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_idx` (`id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.action_permissions definition

CREATE TABLE `action_permissions` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROL_ID` int NOT NULL,
  `ACTION_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROL_ID` (`ROL_ID`),
  KEY `ACTION_ID` (`ACTION_ID`),
  CONSTRAINT `action_permissions_ibfk_1` FOREIGN KEY (`ROL_ID`) REFERENCES `user_rol` (`ID`),
  CONSTRAINT `action_permissions_ibfk_2` FOREIGN KEY (`ACTION_ID`) REFERENCES `invoice_event_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.component definition

CREATE TABLE `component` (
  `COMPONENT_ID` int NOT NULL AUTO_INCREMENT,
  `COMPONENT_NAME` varchar(255) NOT NULL,
  `PAGE_ID` int NOT NULL,
  PRIMARY KEY (`COMPONENT_ID`),
  KEY `PAGE_ID` (`PAGE_ID`),
  CONSTRAINT `component_ibfk_1` FOREIGN KEY (`PAGE_ID`) REFERENCES `page` (`PAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;


-- profit_2.discount_type definition

CREATE TABLE `discount_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `ID_DISCOUNT_CATEGORY` int DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID_DISCOUNT_CATEGORY` (`ID_DISCOUNT_CATEGORY`),
  CONSTRAINT `discount_type_ibfk_1` FOREIGN KEY (`ID_DISCOUNT_CATEGORY`) REFERENCES `discount_category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discounts definition

CREATE TABLE `discounts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int DEFAULT NULL,
  `DISCOUNT_TYPE_ID` int DEFAULT NULL,
  `DISCOUNT_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `APPLY_OTHERS_DISCOUNTS` tinyint(1) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `MIN_UNITS_BY_ORDER` int DEFAULT NULL,
  `DISCOUNT_COMPUTATION` int DEFAULT NULL COMMENT '1: Porcentaje, 2: Monto',
  `ID_CLIENT` int DEFAULT NULL,
  `CONTRACT_ARCHIVE` varchar(255) DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT '1',
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` varchar(30) DEFAULT NULL,
  `UPDATED_BY` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DISCOUNT_TYPE_ID` (`DISCOUNT_TYPE_ID`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`DISCOUNT_TYPE_ID`) REFERENCES `discount_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.documents_by_type_of_client definition

CREATE TABLE `documents_by_type_of_client` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DOCUMENT_NAME` varchar(255) NOT NULL,
  `FORMAT_DOCUMENT` varchar(255) NOT NULL,
  `REQUIRED` tinyint(1) NOT NULL,
  `CLIENT_TYPE_ID` int NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CLIENT_TYPPE_ID` (`CLIENT_TYPE_ID`),
  CONSTRAINT `documents_by_type_of_client_ibfk_1` FOREIGN KEY (`CLIENT_TYPE_ID`) REFERENCES `client_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;


-- profit_2.project definition

CREATE TABLE `project` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UUID` varchar(255) NOT NULL,
  `PROJECT_DESCRIPTION` varchar(255) NOT NULL,
  `RGB_CONFIG` varchar(255) NOT NULL,
  `LOGO` varchar(255) DEFAULT NULL,
  `NIT` varchar(255) NOT NULL,
  `CONTACT` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `COUNTRY_ID` int NOT NULL,
  `CURRENCY` json NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  `BILLING_PERIOD` date DEFAULT NULL,
  `DSO_CURRENLY_YEAR` tinyint(1) DEFAULT '0',
  `DSO_DAYS` int DEFAULT '0',
  `ACCEPT_DATE` tinyint(1) DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `POSITION_CONTACT` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `FK_COUNTRY_ID` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb3;


-- profit_2.rol_permissions definition

CREATE TABLE `rol_permissions` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROL_ID` int NOT NULL,
  `COMPONENT_ID` int NOT NULL,
  `CREATE_PERMISSION` tinyint(1) DEFAULT NULL,
  `UPDATE_PERMISSION` tinyint(1) DEFAULT NULL,
  `DELETE_PERMISSION` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROL_ID` (`ROL_ID`),
  KEY `COMPONENT_ID` (`COMPONENT_ID`),
  CONSTRAINT `rol_permissions_ibfk_1` FOREIGN KEY (`ROL_ID`) REFERENCES `user_rol` (`ID`),
  CONSTRAINT `rol_permissions_ibfk_2` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`COMPONENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;


-- profit_2.`zone` definition

CREATE TABLE `zone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int NOT NULL,
  `ZONE_DESCRIPTION` varchar(255) NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3;


-- profit_2.address_location definition

CREATE TABLE `address_location` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `COMPLEMENT` varchar(255) DEFAULT NULL,
  `LOCATION_ID` int DEFAULT NULL,
  `PROJECT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `address_location_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`ID`),
  CONSTRAINT `address_location_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.billing_period_project_configuration definition

CREATE TABLE `billing_period_project_configuration` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PERIOD_CONFIGURATION` json NOT NULL,
  `PROJECT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `billing_period_project_configuration_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.channel definition

CREATE TABLE `channel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int NOT NULL,
  `CHANNEL_DESCRIPTION` varchar(255) NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `channel_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb3;


-- profit_2.client_group definition

CREATE TABLE `client_group` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(255) NOT NULL,
  `CLIENTS` json NOT NULL,
  `ACTIVE` tinyint(1) DEFAULT '1',
  `PROJECT_ID` int DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `client_group_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb3;


-- profit_2.client_type_by_project definition

CREATE TABLE `client_type_by_project` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int NOT NULL,
  `CLIENT_TYPE_ID` int NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CLIENT_TYPE_ID` (`CLIENT_TYPE_ID`),
  KEY `client_type_by_project_ibfk_2` (`PROJECT_ID`),
  CONSTRAINT `client_type_by_project_ibfk_1` FOREIGN KEY (`CLIENT_TYPE_ID`) REFERENCES `client_type` (`ID`),
  CONSTRAINT `client_type_by_project_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3;


-- profit_2.company_assigments definition

CREATE TABLE `company_assigments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROL_ID` int NOT NULL,
  `PROJECT_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `ACTIVE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROL_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `company_assigments_ibfk_1` FOREIGN KEY (`ROL_ID`) REFERENCES `user_rol` (`ID`),
  CONSTRAINT `company_assigments_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `company_assigments_ibfk_3` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb3;


-- profit_2.comunication definition

CREATE TABLE `comunication` (
  `COMUNICATION_ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_GROUP_ID` int DEFAULT NULL,
  `COMUNICATION_NAME` varchar(255) NOT NULL,
  `COMUNICATION_STATE` tinyint(1) NOT NULL,
  `PERIODICITY` varchar(255) NOT NULL,
  PRIMARY KEY (`COMUNICATION_ID`),
  KEY `CLIENT_GROUP_ID` (`CLIENT_GROUP_ID`),
  CONSTRAINT `comunication_ibfk_1` FOREIGN KEY (`CLIENT_GROUP_ID`) REFERENCES `client_group` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb3;


-- profit_2.comunication_project definition

CREATE TABLE `comunication_project` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECT_ID` int NOT NULL,
  `USER` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `CREDENTIAL_TYPE` enum('Email','Whatsapp') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `comunication_project_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4223 DEFAULT CHARSET=utf8mb3;


-- profit_2.discount_clientgroup definition

CREATE TABLE `discount_clientgroup` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DISCOUNT` int DEFAULT NULL,
  `ID_CLIENTGROUP` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DISCOUNT` (`ID_DISCOUNT`),
  CONSTRAINT `discount_clientgroup_ibfk_1` FOREIGN KEY (`ID_DISCOUNT`) REFERENCES `discounts` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discount_contracts definition

CREATE TABLE `discount_contracts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DISCOUNT` int DEFAULT NULL,
  `ID_LINE` int DEFAULT NULL,
  `ID_PRODUCT` int DEFAULT NULL,
  `UNITS` int DEFAULT NULL,
  `ID_DISCOUNT_CONTRACTS_RANGES` int DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID_DISCOUNT` (`ID_DISCOUNT`),
  KEY `ID_DISCOUNT_CONTRACTS_RANGES` (`ID_DISCOUNT_CONTRACTS_RANGES`),
  CONSTRAINT `discount_contracts_ibfk_1` FOREIGN KEY (`ID_DISCOUNT`) REFERENCES `discounts` (`ID`),
  CONSTRAINT `discount_contracts_ibfk_2` FOREIGN KEY (`ID_DISCOUNT_CONTRACTS_RANGES`) REFERENCES `discount_contracts_ranges` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discount_products_categories definition

CREATE TABLE `discount_products_categories` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DISCOUNT` int DEFAULT NULL,
  `ID_LINE` int DEFAULT NULL,
  `ID_PRODUCT` int DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID_DISCOUNT` (`ID_DISCOUNT`),
  CONSTRAINT `discount_products_categories_ibfk_1` FOREIGN KEY (`ID_DISCOUNT`) REFERENCES `discounts` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discount_ranges definition

CREATE TABLE `discount_ranges` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DISCOUNT` int DEFAULT NULL,
  `UNITS_FROM` double DEFAULT NULL,
  `UNITS_TO` double DEFAULT NULL,
  `MIN_PRODUCTS` int DEFAULT NULL,
  `MIN_CHANNEL` int DEFAULT NULL,
  `MIN_UNITS_BY_CHANNEL` int DEFAULT NULL,
  `MIN_UNITS_BY_ORDER_BY_SKU` int DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ID_DISCOUNT` (`ID_DISCOUNT`),
  CONSTRAINT `discount_ranges_ibfk_1` FOREIGN KEY (`ID_DISCOUNT`) REFERENCES `discounts` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.holding_type definition

CREATE TABLE `holding_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HOLDING_NAME` varchar(255) NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `PROJECT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `holding_type_FK` (`PROJECT_ID`),
  CONSTRAINT `holding_type_FK` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;


-- profit_2.line definition

CREATE TABLE `line` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int NOT NULL,
  `DESCRIPTION_LINE` varchar(255) DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `idx_line` (`CHANNEL_ID`),
  CONSTRAINT `line_ibfk_1` FOREIGN KEY (`CHANNEL_ID`) REFERENCES `channel` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3;


-- profit_2.shipto_channel definition

CREATE TABLE `shipto_channel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SHIP_TO_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CHANNEL_ID` int DEFAULT NULL,
  `PROJECT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIP_TO_ID` (`SHIP_TO_ID`),
  KEY `CHANNEL_ID` (`CHANNEL_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `shipto_channel_ibfk_2` FOREIGN KEY (`CHANNEL_ID`) REFERENCES `channel` (`ID`),
  CONSTRAINT `shipto_channel_ibfk_3` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.shipto_line definition

CREATE TABLE `shipto_line` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SHIP_TO_ID` varchar(50) NOT NULL,
  `LINE_ID` int DEFAULT NULL,
  `CHANNEL_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIP_TO_ID` (`SHIP_TO_ID`),
  KEY `LINE_ID` (`LINE_ID`),
  CONSTRAINT `shipto_line_ibfk_2` FOREIGN KEY (`LINE_ID`) REFERENCES `line` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.shipto_zone definition

CREATE TABLE `shipto_zone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SHIP_TO_ID` varchar(100) DEFAULT NULL,
  `ZONE_ID` int DEFAULT NULL,
  `PROJECT_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIP_TO_ID` (`SHIP_TO_ID`),
  KEY `ZONE_ID` (`ZONE_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `shipto_zone_ibfk_2` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`),
  CONSTRAINT `shipto_zone_ibfk_3` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.subline definition

CREATE TABLE `subline` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LINE_ID` int NOT NULL,
  `SUBLINE_DESCRIPTION` varchar(255) NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LINE_ID` (`LINE_ID`),
  CONSTRAINT `subline_ibfk_1` FOREIGN KEY (`LINE_ID`) REFERENCES `line` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb3;


-- profit_2.user_channel definition

CREATE TABLE `user_channel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `CHANNEL_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CHANNEL_ID` (`CHANNEL_ID`),
  KEY `USER_CHANNEL_INDEX` (`USER_ID`,`CHANNEL_ID`),
  CONSTRAINT `user_channel_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `user_channel_ibfk_2` FOREIGN KEY (`CHANNEL_ID`) REFERENCES `channel` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=629 DEFAULT CHARSET=utf8mb3;


-- profit_2.user_comunication definition

CREATE TABLE `user_comunication` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `COMUNICATION_ID` int NOT NULL,
  `CONTACT_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `COMUNICATION_ID` (`COMUNICATION_ID`),
  CONSTRAINT `user_comunication_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `user_comunication_ibfk_2` FOREIGN KEY (`COMUNICATION_ID`) REFERENCES `comunication` (`COMUNICATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=utf8mb3;


-- profit_2.user_line definition

CREATE TABLE `user_line` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `LINE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LINE_ID` (`LINE_ID`),
  KEY `USER_LINE_INDEX` (`USER_ID`,`LINE_ID`),
  CONSTRAINT `user_line_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `user_line_ibfk_2` FOREIGN KEY (`LINE_ID`) REFERENCES `line` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=utf8mb3;


-- profit_2.user_subline definition

CREATE TABLE `user_subline` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `SUBLINE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SUBLINE_ID` (`SUBLINE_ID`),
  KEY `USER_SUBLINE_INDEX` (`USER_ID`,`SUBLINE_ID`),
  CONSTRAINT `user_subline_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `user_subline_ibfk_2` FOREIGN KEY (`SUBLINE_ID`) REFERENCES `subline` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8mb3;


-- profit_2.user_zone definition

CREATE TABLE `user_zone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `ZONE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `ZONE_ID` (`ZONE_ID`),
  CONSTRAINT `user_zone_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `user_zone_ibfk_2` FOREIGN KEY (`ZONE_ID`) REFERENCES `zone` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=618 DEFAULT CHARSET=utf8mb3;


-- profit_2.users_group definition

CREATE TABLE `users_group` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `GROUP_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_group_unique` (`USER_ID`,`GROUP_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `GROUP_ID` (`GROUP_ID`),
  CONSTRAINT `users_group_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `users_group_ibfk_2` FOREIGN KEY (`GROUP_ID`) REFERENCES `client_group` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8mb3;


-- profit_2.client definition

CREATE TABLE `client` (
  `NIT` int NOT NULL AUTO_INCREMENT,
  `UUID` varchar(255) NOT NULL,
  `PROJECT_ID` int NOT NULL,
  `CLIENT_NAME` varchar(255) NOT NULL,
  `BUSSINESS_NAME` varchar(255) NOT NULL,
  `PHONE` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `HOLDING_ID` int DEFAULT NULL,
  `CLIENT_TYPE_ID` int NOT NULL,
  `LOCATIONS` json DEFAULT NULL,
  `IS_DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `BILLING_PERIOD` date DEFAULT NULL,
  `RISK_ID` int DEFAULT NULL,
  `DOCUMENT_TYPE_ID` int DEFAULT NULL,
  `STATUS_ID` int DEFAULT NULL,
  `RADICATION_TYPE` int DEFAULT NULL,
  `CONDITION_TYPE` int DEFAULT NULL,
  `QUOTA` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`NIT`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `HOLDING_ID` (`HOLDING_ID`),
  KEY `FK_CLIENT_TYPE_ID` (`CLIENT_TYPE_ID`),
  KEY `RISK_ID` (`RISK_ID`),
  KEY `fk_document_type_id` (`DOCUMENT_TYPE_ID`),
  KEY `FK_CLIENT_STATUS` (`STATUS_ID`),
  KEY `RADICATION_TYPE` (`RADICATION_TYPE`),
  KEY `CONDITION_TYPE` (`CONDITION_TYPE`),
  CONSTRAINT `client_ibfk_2` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `client_ibfk_3` FOREIGN KEY (`HOLDING_ID`) REFERENCES `holding_type` (`ID`),
  CONSTRAINT `client_ibfk_4` FOREIGN KEY (`RISK_ID`) REFERENCES `risk` (`ID`),
  CONSTRAINT `client_ibfk_5` FOREIGN KEY (`RADICATION_TYPE`) REFERENCES `radication_type` (`ID`),
  CONSTRAINT `client_ibfk_6` FOREIGN KEY (`CONDITION_TYPE`) REFERENCES `condition_type` (`ID`),
  CONSTRAINT `FK_CLIENT_STATUS` FOREIGN KEY (`STATUS_ID`) REFERENCES `client_status` (`ID`),
  CONSTRAINT `FK_CLIENT_TYPE_ID` FOREIGN KEY (`CLIENT_TYPE_ID`) REFERENCES `client_type` (`ID`),
  CONSTRAINT `fk_document_type_id` FOREIGN KEY (`DOCUMENT_TYPE_ID`) REFERENCES `documents_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483647 DEFAULT CHARSET=utf8mb3;


-- profit_2.client_changes_log definition

CREATE TABLE `client_changes_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `STATUS_CHANGE_CLIENT` varchar(255) NOT NULL,
  `CREATED_AT` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `client_changes_log_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `client_changes_log_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.client_comunication definition

CREATE TABLE `client_comunication` (
  `CLIENT_COMUNICATION_ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `COMUNICATION_TYPE` enum('Email','Whatsapp') NOT NULL,
  `credencials` json DEFAULT NULL,
  PRIMARY KEY (`CLIENT_COMUNICATION_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `client_comunication_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.client_documents definition

CREATE TABLE `client_documents` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `client_documents_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb3;


-- profit_2.client_event definition

CREATE TABLE `client_event` (
  `CLIENT_EVENT_ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `EVENT_TYPE` enum('Conciliacion','Novedades','Envio email','Envio Whatsapp','Acuedo de pago') NOT NULL,
  `COMMENTS` varchar(255) NOT NULL,
  `FILES` json NOT NULL,
  `CREATED_AT` date NOT NULL,
  PRIMARY KEY (`CLIENT_EVENT_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `client_event_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `client_event_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.client_wallet definition

CREATE TABLE `client_wallet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `PAST_DUE_AMMOUNT` bigint NOT NULL DEFAULT '0',
  `BUDGET_AMMOUNT` bigint NOT NULL DEFAULT '0',
  `APPLIED_PAYMENTS_AMMOUNT` bigint NOT NULL DEFAULT '0',
  `UNAPPLIED_PAYMENTS_AMMOUNT` bigint NOT NULL DEFAULT '0',
  `TOTAL_PORTFOLIO` bigint DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `client_wallet_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=6144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.clients_other_address definition

CREATE TABLE `clients_other_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `code_address` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `project_id` int DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `clients_other_address_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.clients_vendor definition

CREATE TABLE `clients_vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `clients_vendor_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`NIT`),
  CONSTRAINT `clients_vendor_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.contact definition

CREATE TABLE `contact` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `CONTACT_NAME` varchar(255) NOT NULL,
  `CONTACT_PHONE` varchar(255) NOT NULL,
  `CONTACT_EMAIL` varchar(255) NOT NULL,
  `NAME_POSITION` varchar(255) NOT NULL,
  `CONTACT_LASTNAME` varchar(255) DEFAULT NULL,
  `COUNTRY_CALLING_CODE_ID` int DEFAULT NULL,
  `contact_position_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `fk_contact_position` (`contact_position_id`),
  KEY `fk_country_calling_code` (`COUNTRY_CALLING_CODE_ID`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `fk_contact_position` FOREIGN KEY (`contact_position_id`) REFERENCES `contact_position` (`id`),
  CONSTRAINT `fk_country_calling_code` FOREIGN KEY (`COUNTRY_CALLING_CODE_ID`) REFERENCES `country_calling_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;


-- profit_2.dynamic_links definition

CREATE TABLE `dynamic_links` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `DOMAIN` varchar(255) NOT NULL,
  `EXPIRATION_DATE` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `dynamic_links_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.financial_discounts definition

CREATE TABLE `financial_discounts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SUCURSAL_ID` int DEFAULT NULL,
  `LINE_ID` int DEFAULT NULL,
  `SUB_LINE_ID` int DEFAULT NULL,
  `PROJECT_ID` int NOT NULL,
  `DEPENDECY_SUCURSAL` tinyint(1) NOT NULL,
  `INITIAL_VALUE` double DEFAULT NULL,
  `CURRENT_VALUE` double DEFAULT NULL,
  `EXPIRATION_DATE` date DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FILES` json DEFAULT NULL,
  `CREATE_AT` date NOT NULL,
  `UPDATE_AT` date NOT NULL,
  `DELETE_AT` date DEFAULT NULL,
  `STATUS_ID` int NOT NULL,
  `DOCUMENT_TYPE_ID` int NOT NULL,
  `CLIENT_ID` int DEFAULT NULL,
  `PERCENTAGE` int DEFAULT NULL,
  `IS_DISCOUNT` tinyint(1) DEFAULT NULL,
  `DATE_OF_ISSUE` date DEFAULT NULL,
  `ERP_ID` int DEFAULT NULL,
  `MOTIVE_ID` int DEFAULT NULL,
  `VALIDITY_RANGE` json DEFAULT NULL,
  `EARLYPAY_DATE` date DEFAULT NULL,
  `IS_LEGALIZED` tinyint(1) DEFAULT '0',
  `IS_DELETED` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SUCURSAL_ID` (`SUCURSAL_ID`),
  KEY `LINE_ID` (`LINE_ID`),
  KEY `SUB_LINE_ID` (`SUB_LINE_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `FINANCIAL_DISCOUNTS_STATUS_ID` (`STATUS_ID`),
  KEY `FINANCIAL_DISCOUNTS_DOCUMENT_TYPES_ID` (`DOCUMENT_TYPE_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `MOTIVE_ID` (`MOTIVE_ID`),
  CONSTRAINT `financial_discounts_ibfk_2` FOREIGN KEY (`LINE_ID`) REFERENCES `line` (`ID`),
  CONSTRAINT `financial_discounts_ibfk_3` FOREIGN KEY (`SUB_LINE_ID`) REFERENCES `subline` (`ID`),
  CONSTRAINT `financial_discounts_ibfk_4` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `financial_discounts_ibfk_5` FOREIGN KEY (`STATUS_ID`) REFERENCES `financial_discounts_status` (`ID`),
  CONSTRAINT `financial_discounts_ibfk_6` FOREIGN KEY (`DOCUMENT_TYPE_ID`) REFERENCES `financial_discounts_document_types` (`ID`),
  CONSTRAINT `financial_discounts_ibfk_7` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `financial_discounts_ibfk_8` FOREIGN KEY (`MOTIVE_ID`) REFERENCES `financial_discount_motive` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26598 DEFAULT CHARSET=utf8mb3;
-- profit_2.financial_records definition

CREATE TABLE `financial_records` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SHIPTO_ID` int DEFAULT NULL,
  `LINE_ID` int DEFAULT NULL,
  `SUB_LINE_ID` int DEFAULT NULL,
  `PROJECT_ID` int NOT NULL,
  `DEPENDECY_SUCURSAL` tinyint(1) NOT NULL,
  `CUFE` varchar(255) NOT NULL,
  `INITIAL_VALUE` int NOT NULL,
  `CURRENT_VALUE` int NOT NULL,
  `EXPIRATION_DATE` date NOT NULL,
  `COMMENTS` varchar(255) NOT NULL,
  `INVOICE_URL` varchar(255) NOT NULL,
  `FILES` json DEFAULT NULL,
  `RADICATION_TYPE` varchar(255) NOT NULL,
  `CREATE_AT` date NOT NULL,
  `UPDATED_AT` date DEFAULT NULL,
  `DELETE_AT` date DEFAULT NULL,
  `CURRENCY_ID` int NOT NULL,
  `STATUS_ID` int DEFAULT NULL,
  `DOCUMENT_TYPE_ID` int DEFAULT NULL,
  `CLIENT_ID` int DEFAULT NULL,
  `earlypay_date` date DEFAULT NULL,
  `accept_date` date DEFAULT NULL,
  `FINANCIAL_RECORD_DATE` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPTO_ID` (`SHIPTO_ID`),
  KEY `LINE_ID` (`LINE_ID`),
  KEY `SUB_LINE_ID` (`SUB_LINE_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `FK_CURRENCY_ID` (`CURRENCY_ID`),
  KEY `financial_records_status_id` (`STATUS_ID`),
  KEY `financial_records_document_types_id` (`DOCUMENT_TYPE_ID`),
  KEY `id_client` (`CLIENT_ID`),
  CONSTRAINT `financial_records_ibfk_2` FOREIGN KEY (`LINE_ID`) REFERENCES `line` (`ID`),
  CONSTRAINT `financial_records_ibfk_3` FOREIGN KEY (`SUB_LINE_ID`) REFERENCES `subline` (`ID`),
  CONSTRAINT `financial_records_ibfk_4` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `financial_records_ibfk_5` FOREIGN KEY (`STATUS_ID`) REFERENCES `financial_records_status` (`ID`),
  CONSTRAINT `financial_records_ibfk_6` FOREIGN KEY (`DOCUMENT_TYPE_ID`) REFERENCES `financial_records_document_types` (`ID`),
  CONSTRAINT `financial_records_ibfk_7` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `FK_CURRENCY_ID` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `currency` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=208787 DEFAULT CHARSET=utf8mb3;


-- profit_2.financial_records_vs_financial_discounts definition

CREATE TABLE `financial_records_vs_financial_discounts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_FINANCIAL_RECORD` int DEFAULT NULL,
  `ID_FINANCIAL_DISCOUNT` int DEFAULT NULL,
  `AMOUNT` decimal(10,2) DEFAULT NULL,
  `TIMESTAMP` date DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_FINANCIAL_RECORD` (`ID_FINANCIAL_RECORD`),
  KEY `ID_FINANCIAL_DISCOUNT` (`ID_FINANCIAL_DISCOUNT`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `financial_records_vs_financial_discounts_ibfk_1` FOREIGN KEY (`ID_FINANCIAL_RECORD`) REFERENCES `financial_records` (`ID`),
  CONSTRAINT `financial_records_vs_financial_discounts_ibfk_2` FOREIGN KEY (`ID_FINANCIAL_DISCOUNT`) REFERENCES `financial_discounts` (`ID`),
  CONSTRAINT `financial_records_vs_financial_discounts_ibfk_3` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.historical_dso definition

CREATE TABLE `historical_dso` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `HISTORIC` json NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `historical_dso_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.invoice_record_event definition

CREATE TABLE `invoice_record_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_INVOICE` int NOT NULL,
  `COMMENTS` varchar(255) NOT NULL,
  `FILES` json NOT NULL,
  `CREATE_AT` date NOT NULL,
  `EVENT_DATE` date NOT NULL,
  `INVOICE_EVENT_TYPE_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `AMMOUNT` double DEFAULT NULL,
  `FINANCIAL_DISCOUNT_ID` int DEFAULT NULL,
  `PREVIOUS_STATUS_ID` int DEFAULT NULL,
  `INCIDENT_ID` int DEFAULT NULL,
  `EMAIL_ID` int DEFAULT NULL,
  `RADICATION_TYPE_ID` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `incident_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ID_INVOICE` (`ID_INVOICE`),
  KEY `INVOICE_EVENT_TYPE_ID` (`INVOICE_EVENT_TYPE_ID`),
  KEY `FK_USER_ID` (`USER_ID`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `invoice_record_event_ibfk_1` FOREIGN KEY (`ID_INVOICE`) REFERENCES `financial_records` (`ID`),
  CONSTRAINT `invoice_record_event_ibfk_2` FOREIGN KEY (`INVOICE_EVENT_TYPE_ID`) REFERENCES `invoice_event_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=197934 DEFAULT CHARSET=utf8mb3;


-- profit_2.notification_triggers definition

CREATE TABLE `notification_triggers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('frecuencia','evento','accion') NOT NULL,
  `template_id` int DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `date_init_frequency` date NOT NULL,
  `date_end_frequency` date DEFAULT NULL,
  `frequency` enum('semanal','mensual') DEFAULT NULL,
  `frequency_days` varchar(50) DEFAULT NULL,
  `event_days_before` int DEFAULT NULL,
  `last_send` date DEFAULT NULL,
  `event_invoice_id` int DEFAULT NULL,
  `invoice_event_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `fk_event` (`event_invoice_id`),
  CONSTRAINT `fk_event` FOREIGN KEY (`event_invoice_id`) REFERENCES `invoice_record_event` (`ID_INVOICE`),
  CONSTRAINT `notification_triggers_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.notification_wpp definition

CREATE TABLE `notification_wpp` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_COMUNICATION_ID` int NOT NULL,
  `TEMPLATE_ID` int NOT NULL,
  `NOTIFICATION_MESSAGE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_COMUNICATION_ID` (`USER_COMUNICATION_ID`),
  KEY `TEMPLATE_ID` (`TEMPLATE_ID`),
  CONSTRAINT `notification_wpp_ibfk_1` FOREIGN KEY (`USER_COMUNICATION_ID`) REFERENCES `user_comunication` (`ID`),
  CONSTRAINT `notification_wpp_ibfk_2` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `template` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;


-- profit_2.shipto definition

CREATE TABLE `shipto` (
  `ACCOUNTING_CODE` varchar(100) NOT NULL,
  `CLIENT_ID` int NOT NULL,
  `DEPENDECY_CLIENT` tinyint(1) NOT NULL,
  `CONTACTS` json NOT NULL,
  `SHIPTO_DESCRIPTION` varchar(255) NOT NULL,
  `CONDITION_PAYMENT` int DEFAULT NULL,
  `BILLING_PERIOD` date DEFAULT NULL,
  `RADICATION_TYPE` int DEFAULT NULL,
  `PROJECT_ID` int NOT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `ADDRESS_ID` int DEFAULT NULL,
  KEY `ID_CLIENTE` (`CLIENT_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `fk_condition_payment` (`CONDITION_PAYMENT`),
  KEY `fk_radication_type` (`RADICATION_TYPE`),
  KEY `ADDRESS_ID` (`ADDRESS_ID`),
  CONSTRAINT `fk_condition_payment` FOREIGN KEY (`CONDITION_PAYMENT`) REFERENCES `condition_type` (`ID`),
  CONSTRAINT `fk_radication_type` FOREIGN KEY (`RADICATION_TYPE`) REFERENCES `radication_type` (`ID`),
  CONSTRAINT `shipto_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `shipto_ibfk_7` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`ID`),
  CONSTRAINT `shipto_ibfk_8` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address_location` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.shipto_subline definition

CREATE TABLE `shipto_subline` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SHIP_TO_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SUBLINE_ID` int DEFAULT NULL,
  `LINE_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIP_TO_ID` (`SHIP_TO_ID`),
  KEY `SUBLINE_ID` (`SUBLINE_ID`),
  KEY `LINE_ID` (`LINE_ID`),
  CONSTRAINT `shipto_subline_ibfk_2` FOREIGN KEY (`SUBLINE_ID`) REFERENCES `subline` (`ID`),
  CONSTRAINT `shipto_subline_ibfk_3` FOREIGN KEY (`LINE_ID`) REFERENCES `line` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.tickets definition

CREATE TABLE `tickets` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CREATOR_USER_ID` int NOT NULL,
  `CLIENT_ID` int DEFAULT NULL,
  `SHIPTO_ID` int DEFAULT NULL,
  `INVOICE_ID` int DEFAULT NULL,
  `ASSGINED_USER_ID` int NOT NULL,
  `TYPE_TICKET` enum('Conciliacion','Creacion de cliente','Aprovacion de descuentos',' Cambio de datos en cliente') NOT NULL,
  `STATT_TICKET` enum('Registrada','Asignada','Aprbada','Rechazada','Cerrada') NOT NULL,
  `UPDATE_AT` date NOT NULL,
  `CREATE_AT` date NOT NULL,
  `IS_ORDER` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CREATOR_USER_ID` (`CREATOR_USER_ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  KEY `SHIPTO_ID` (`SHIPTO_ID`),
  KEY `INVOICE_ID` (`INVOICE_ID`),
  KEY `ASSGINED_USER_ID` (`ASSGINED_USER_ID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`CREATOR_USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`INVOICE_ID`) REFERENCES `financial_records` (`ID`),
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`ASSGINED_USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.tickets_comments definition

CREATE TABLE `tickets_comments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_TICKET` int NOT NULL,
  `CREATOR_USER` int NOT NULL,
  `COMMENT` varchar(255) NOT NULL,
  `UPDATE_AT` date NOT NULL,
  `CREATE_AT` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_TICKET` (`ID_TICKET`),
  KEY `CREATOR_USER` (`CREATOR_USER`),
  CONSTRAINT `tickets_comments_ibfk_1` FOREIGN KEY (`ID_TICKET`) REFERENCES `tickets` (`ID`),
  CONSTRAINT `tickets_comments_ibfk_2` FOREIGN KEY (`CREATOR_USER`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.approving_users definition

CREATE TABLE `approving_users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `TICKET_ID` int NOT NULL,
  `APPRVONG_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `TICKET_ID` (`TICKET_ID`),
  CONSTRAINT `approving_users_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `approving_users_ibfk_2` FOREIGN KEY (`TICKET_ID`) REFERENCES `tickets` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.billing_period_client_configuration definition

CREATE TABLE `billing_period_client_configuration` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` int NOT NULL,
  `PERIOD_CONFIGURATION` json NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `billing_period_client_configuration_ibfk_1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=4140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discount_user_approbal definition

CREATE TABLE `discount_user_approbal` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FINANCIAL_DISCOUNT_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FINANCIAL_DISCOUNT_ID` (`FINANCIAL_DISCOUNT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `discount_user_approbal_ibfk_1` FOREIGN KEY (`FINANCIAL_DISCOUNT_ID`) REFERENCES `financial_discounts` (`ID`),
  CONSTRAINT `discount_user_approbal_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- profit_2.discounts_invoice definition

CREATE TABLE `discounts_invoice` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `INVOICE_ID` int NOT NULL,
  `AMOUNT` double NOT NULL,
  `DISCOUNT_TYPE` enum('Manual','Pronto pago') NOT NULL,
  `CREATE_AT` date NOT NULL,
  `IS_APPROVED` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `INVOICE_ID` (`INVOICE_ID`),
  CONSTRAINT `discounts_invoice_ibfk_1` FOREIGN KEY (`INVOICE_ID`) REFERENCES `financial_records` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- profit_2.financial_discount_event definition

CREATE TABLE `financial_discount_event` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_FINANCIAL_DISCOUNT` varchar(255) DEFAULT NULL,
  `CP_ID_FINANCIAL_DISCOUNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CP_STATUS` int NOT NULL,
  `INVOICES` json DEFAULT NULL,
  `FILES` json DEFAULT NULL,
  `CREATED_AT` date DEFAULT NULL,
  `INVOICE_EVENT_TYPE` int NOT NULL,
  `USER_ID` int DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `EVENT_DATE` date DEFAULT NULL,
  `IS_DELETED` tinyint(1) DEFAULT '0',
  `AMMOUNT` double DEFAULT NULL,
  `STATUS` int NOT NULL,
  `CP_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CP_ID_FINANCIAL_DISCOUNT` (`CP_ID_FINANCIAL_DISCOUNT`),
  KEY `USER_ID` (`USER_ID`),
  KEY `INVOICE_EVENT_TYPE` (`INVOICE_EVENT_TYPE`),
  CONSTRAINT `financial_discount_event_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `financial_discount_event_ibfk_3` FOREIGN KEY (`INVOICE_EVENT_TYPE`) REFERENCES `financial_discount_event_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3990 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- profit_2.incident_timeline definition

CREATE TABLE `incident_timeline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `comments` varchar(255) DEFAULT NULL,
  `files` json DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  KEY `approved_by` (`approved_by`),
  KEY `rejected_by` (`rejected_by`),
  CONSTRAINT `incident_timeline_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `invoice_record_event` (`ID`),
  CONSTRAINT `incident_timeline_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `user` (`ID`),
  CONSTRAINT `incident_timeline_ibfk_3` FOREIGN KEY (`rejected_by`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;