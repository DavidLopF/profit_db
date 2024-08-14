INSERT INTO profit_2.country
(ID, COUNTRY_NAME, ADDRESS_FORMAT, is_deleted)
VALUES(1, 'Colombia', 'Calle 1 # 1 - 1', 0);
INSERT INTO profit_2.country
(ID, COUNTRY_NAME, ADDRESS_FORMAT, is_deleted)
VALUES(6, 'Mexico', 'Calle 6ta', 0);
INSERT INTO profit_2.country
(ID, COUNTRY_NAME, ADDRESS_FORMAT, is_deleted)
VALUES(7, 'Venezuela', 'Calle 5ta', 0);
INSERT INTO profit_2.country
(ID, COUNTRY_NAME, ADDRESS_FORMAT, is_deleted)
VALUES(8, 'Argentina', 'Calle 5ta', 0);

--------------------------------

INSERT INTO profit_2.vw_currency
(ID, CURRENCY_NAME)
VALUES(1, 'COP');
INSERT INTO profit_2.vw_currency
(ID, CURRENCY_NAME)
VALUES(3, 'USD');


-----------------------------------


INSERT INTO profit_2.radication_type
(ID, RADICATION_NAME, IS_DELETED)
VALUES(1, 'email', 0);
INSERT INTO profit_2.radication_type
(ID, RADICATION_NAME, IS_DELETED)
VALUES(2, 'web', 0);
INSERT INTO profit_2.radication_type
(ID, RADICATION_NAME, IS_DELETED)
VALUES(3, 'radian', 0);
INSERT INTO profit_2.radication_type
(ID, RADICATION_NAME, IS_DELETED)
VALUES(4, 'fisica', 0);
INSERT INTO profit_2.radication_type
(ID, RADICATION_NAME, IS_DELETED)
VALUES(5, 'fisica y web', 0);


-----------------------------------

INSERT INTO profit_2.condition_type
(ID, CONDITION_DAY, IS_DELETED)
VALUES(1, 30, 0);
INSERT INTO profit_2.condition_type
(ID, CONDITION_DAY, IS_DELETED)
VALUES(2, 60, 0);
INSERT INTO profit_2.condition_type
(ID, CONDITION_DAY, IS_DELETED)
VALUES(3, 90, 0);
INSERT INTO profit_2.condition_type
(ID, CONDITION_DAY, IS_DELETED)
VALUES(4, 120, 0);
INSERT INTO profit_2.condition_type
(ID, CONDITION_DAY, IS_DELETED)
VALUES(5, 180, 0);

-----------------------------------

INSERT INTO profit_2.client_status
(ID, STATUS_NAME, IS_DELETED)
VALUES(1, 'creado', 0);
INSERT INTO profit_2.client_status
(ID, STATUS_NAME, IS_DELETED)
VALUES(2, 'aprobado', 0);
INSERT INTO profit_2.client_status
(ID, STATUS_NAME, IS_DELETED)
VALUES(3, 'rechazado', 0);
INSERT INTO profit_2.client_status
(ID, STATUS_NAME, IS_DELETED)
VALUES(4, 'bloqueado', 0);
INSERT INTO profit_2.client_status
(ID, STATUS_NAME, IS_DELETED)
VALUES(5, 'juridico', 0);
INSERT INTO profit_2.client_status
(ID, STATUS_NAME, IS_DELETED)
VALUES(6, 'casa de cobro', 0);

-----------------------------------

INSERT INTO profit_2.location
(ID, CITY)
VALUES(1, 'Bogotá');
INSERT INTO profit_2.location
(ID, CITY)
VALUES(246, 'Medellin');
INSERT INTO profit_2.location
(ID, CITY)
VALUES(247, 'Cali');
INSERT INTO profit_2.location
(ID, CITY)
VALUES(248, 'Pereira');
INSERT INTO profit_2.location
(ID, CITY)
VALUES(249, 'Barranquilla');


-----------------------------------


INSERT INTO profit_2.financial_discounts_status
(ID, FINANCIAL_STATUS)
VALUES(1, 'Creado');

-----------------------------------

INSERT INTO profit_2.financial_discount_motive
(ID, NAME)
VALUES(1, 'pronto pago');
INSERT INTO profit_2.financial_discount_motive
(ID, NAME)
VALUES(2, 'Volumen');
INSERT INTO profit_2.financial_discount_motive
(ID, NAME)
VALUES(3, 'Devolucion');

-----------------------------------

INSERT INTO profit_2.financial_discounts_document_types
(ID, DOCUMENT_TYPE, RGB)
VALUES(1, 'Nota debito', '#3D3D3D');
INSERT INTO profit_2.financial_discounts_document_types
(ID, DOCUMENT_TYPE, RGB)
VALUES(2, 'Nota credito', '#969696');
INSERT INTO profit_2.financial_discounts_document_types
(ID, DOCUMENT_TYPE, RGB)
VALUES(3, 'Descuento', '#966636');

--------------------------------------

INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(1, 'vencida', '#FF6B00');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(2, 'sin conciliar', '#969696');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(3, 'conciliada', '#0085FF');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(4, 'saldo', '#3D3D3D');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(5, 'aplicacion', '#A9BA43');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(6, 'pagada', '#FF6B00');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(7, 'anulada', '#C80000');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(8, 'corriente', '#FF6B00');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(9, 'cobro juridico', '#FF6B00');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(10, 'pago no aplicado', '#FF6B00');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(11, 'novedad', '#F4076A');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(12, 'glosado', '#00C2FF');
INSERT INTO profit_2.financial_records_status
(ID, FINANCIAL_STATUS, RGB)
VALUES(13, 'devolucion', '#FF6B00');


---------------------------------------

INSERT INTO profit_2.financial_records_document_types
(ID, DOCUMENT_TYPE)
VALUES(1, 'factura');

------------------------------------------

INSERT INTO profit_2.documents_types
(ID, DOCUMENT_NAME, IS_DELETED)
VALUES(1, 'NIT', 0);
INSERT INTO profit_2.documents_types
(ID, DOCUMENT_NAME, IS_DELETED)
VALUES(2, 'Cedula', 0);
INSERT INTO profit_2.documents_types
(ID, DOCUMENT_NAME, IS_DELETED)
VALUES(3, 'Pasaporte', 0);
INSERT INTO profit_2.documents_types
(ID, DOCUMENT_NAME, IS_DELETED)
VALUES(4, 'Cedula de extranjeria', 0);  


--------------------------------------------

INSERT INTO profit_2.financial_discount_event_type
(ID, EVENT_TYPE)
VALUES(5, 'Emision del ajuste');
INSERT INTO profit_2.financial_discount_event_type
(ID, EVENT_TYPE)
VALUES(6, 'Creacion de ajuste');
INSERT INTO profit_2.financial_discount_event_type
(ID, EVENT_TYPE)
VALUES(7, 'Facturas aplicadas');
INSERT INTO profit_2.financial_discount_event_type
(ID, EVENT_TYPE)
VALUES(8, 'Legaliazcion de ajuste');

-------------------------------------------

INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(1, 'Emision de factura');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(2, 'Radicar factura');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(3, 'Acuerdo de pago');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(4, 'Ajuste contable');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(5, 'Registrar novedad');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(6, 'Cambiar estado');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(7, 'Aplicar pagos');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(8, 'Vincular orden de compra');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(9, 'Generar nota de credito');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(10, 'Generar nota de debito');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(11, 'Generar descuento');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(12, 'Aviso de vencimiento');
INSERT INTO profit_2.invoice_event_type
(ID, EVENT_TYPE)
VALUES(13, 'Vencimiento de factura');

--------------------------


INSERT INTO profit_2.invoice_incident_motive
(ID, NAME)
VALUES(1, 'Diferencia en valores');
INSERT INTO profit_2.invoice_incident_motive
(ID, NAME)
VALUES(2, 'La orden de compra no coincide');
INSERT INTO profit_2.invoice_incident_motive
(ID, NAME)
VALUES(3, 'Radicado fuera de fechas');
INSERT INTO profit_2.invoice_incident_motive
(ID, NAME)
VALUES(4, 'Devolucion'); 