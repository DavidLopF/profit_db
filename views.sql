-- profit_2.VW_CLIENT_GROUPS source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `VW_CLIENT_GROUPS` AS
select
    `CG`.`ID` AS `ID`,
    `CG`.`GROUP_NAME` AS `GROUP_NAME`,
    `CG`.`CLIENTS` AS `CLIENTS`,
    `CG`.`ACTIVE` AS `ACTIVE`,
    `CG`.`PROJECT_ID` AS `PROJECT_ID`,
    `CG`.`IS_DELETED` AS `IS_DELETED`,
    (
    select
        count(0)
    from
        `shipto` `SH`
    where
        ((`SH`.`PROJECT_ID` = `CG`.`PROJECT_ID`)
            and ((json_length(`CG`.`CLIENTS`) = 0)
                or `SH`.`CLIENT_ID` in (
                select
                    json_unquote(json_extract(`CG`.`CLIENTS`, concat('$[', `numbers`.`idx`, '].id')))
                from
                    (
                    select
                        0 AS `idx`
                union all
                    select
                        1 AS `1`
                union all
                    select
                        2 AS `2`
                union all
                    select
                        3 AS `3`
                union all
                    select
                        4 AS `4`
                union all
                    select
                        5 AS `5`
                union all
                    select
                        6 AS `6`
                union all
                    select
                        7 AS `7`
                union all
                    select
                        8 AS `8`
                union all
                    select
                        9 AS `9`) `numbers`)))) AS `SHIPTO_COUNT`,
    (
    select
        count(0)
    from
        `users_group` `SG`
    where
        (`SG`.`GROUP_ID` = `CG`.`ID`)) AS `SUBSCRIBERS`,
    (
    select
        count(0)
    from
        `client` `C`
    where
        (`C`.`NIT` in (
        select
            json_unquote(json_extract(`CG`.`CLIENTS`, concat('$[', `numbers`.`idx`, '].id')))
        from
            (
            select
                0 AS `idx`
        union all
            select
                1 AS `1`
        union all
            select
                2 AS `2`
        union all
            select
                3 AS `3`
        union all
            select
                4 AS `4`
        union all
            select
                5 AS `5`
        union all
            select
                6 AS `6`
        union all
            select
                7 AS `7`
        union all
            select
                8 AS `8`
        union all
            select
                9 AS `9`) `numbers`)
            or (json_length(`CG`.`CLIENTS`) = 0))) AS `CLIENT_COUNT`
from
    `client_group` `CG`;


-- profit_2.get_super_admins source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `get_super_admins` AS
select
    `u`.`ID` AS `ID`,
    `u`.`EMAIL` AS `EMAIL`,
    `u`.`PHONE` AS `PHONE`,
    `u`.`USER_NAME` AS `USER_NAME`,
    `u`.`POSITION` AS `POSITION`,
    `u`.`NOTIFICATION_CONFIG` AS `NOTIFICATION_CONFIG`,
    `u`.`UUID` AS `UUID`,
    `u`.`is_super_admin` AS `is_super_admin`,
    `u`.`IS_DELETED` AS `IS_DELETED`,
    `u`.`ACTIVE` AS `ACTIVE`
from
    `user` `u`
where
    ((`u`.`is_super_admin` = 1)
        and (`u`.`IS_DELETED` = 0));


-- profit_2.vw_bussines_rules source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_bussines_rules` AS
select
    `c`.`ID` AS `CHANNEL_ID`,
    `c`.`CHANNEL_DESCRIPTION` AS `CHANNEL_NAME`,
    `c`.`PROJECT_ID` AS `PROJECT_ID`,
    `c`.`IS_DELETED` AS `IS_DELETED`,
    (
    select
        json_arrayagg(json_object('id', `l`.`ID`, 'description', `l`.`DESCRIPTION_LINE`, 'sublines',(select json_arrayagg(json_object('id', `s`.`ID`, 'description', `s`.`SUBLINE_DESCRIPTION`)) from `subline` `s` where ((`s`.`LINE_ID` = `l`.`ID`) and (`s`.`IS_DELETED` = 0)))))
    from
        `line` `l`
    where
        ((`l`.`CHANNEL_ID` = `c`.`ID`)
            and (`l`.`IS_DELETED` = 0))) AS `CHANNEL_LINES`
from
    `channel` `c`
where
    (`c`.`IS_DELETED` = 0);


-- profit_2.vw_client_info source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_client_info` AS
select
    `c`.`NIT` AS `NIT`,
    `c`.`UUID` AS `UUID`,
    `c`.`PROJECT_ID` AS `PROJECT_ID`,
    `c`.`CLIENT_NAME` AS `CLIENT_NAME`,
    `c`.`BUSSINESS_NAME` AS `BUSSINESS_NAME`,
    `c`.`PHONE` AS `PHONE`,
    `c`.`EMAIL` AS `EMAIL`,
    `c`.`HOLDING_ID` AS `HOLDING_ID`,
    `c`.`CLIENT_TYPE_ID` AS `CLIENT_TYPE_ID`,
    `c`.`LOCATIONS` AS `LOCATIONS`,
    `c`.`IS_DELETED` AS `IS_DELETED`,
    `c`.`BILLING_PERIOD` AS `BILLING_PERIOD`,
    `c`.`RISK_ID` AS `RISK_ID`,
    `c`.`DOCUMENT_TYPE_ID` AS `DOCUMENT_TYPE_ID`,
    `c`.`STATUS_ID` AS `STATUS_ID`,
    `c`.`RADICATION_TYPE` AS `RADICATION_TYPE`,
    `c`.`CONDITION_TYPE` AS `CONDITION_TYPE`,
    (
    select
        `r`.`RISK_NAME`
    from
        `risk` `r`
    where
        (`r`.`ID` = `c`.`RISK_ID`)) AS `RISK`,
    (
    select
        `rt`.`RADICATION_NAME`
    from
        `radication_type` `rt`
    where
        (`rt`.`ID` = `c`.`RADICATION_TYPE`)) AS `RADICATION_TYPE_NAME`,
    (
    select
        `dt`.`DOCUMENT_NAME`
    from
        `documents_types` `dt`
    where
        (`c`.`DOCUMENT_TYPE_ID` = `dt`.`ID`)) AS `DOCUMENT_TYPE`,
    (
    select
        `cdt`.`CONDITION_DAY`
    from
        `condition_type` `cdt`
    where
        (`cdt`.`ID` = `c`.`CONDITION_TYPE`)) AS `CONDITION_TYPE_NAME`,
    (
    select
        `cs`.`STATUS_NAME`
    from
        `client_status` `cs`
    where
        (`c`.`STATUS_ID` = `cs`.`ID`)) AS `STATUS`,
    (
    select
        `ht`.`HOLDING_NAME`
    from
        `holding_type` `ht`
    where
        (`ht`.`ID` = `c`.`HOLDING_ID`)) AS `HOLDING_NAME`,
    (
    select
        `ct`.`CLIENT_TYPE`
    from
        `client_type` `ct`
    where
        (`c`.`CLIENT_TYPE_ID` = `ct`.`ID`)) AS `CLIENT_TYPE_NAME`
from
    `client` `c`;


-- profit_2.vw_country source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_country` AS
select
    `country`.`ID` AS `id`,
    `country`.`COUNTRY_NAME` AS `country_name`,
    `country`.`ADDRESS_FORMAT` AS `address_format`
from
    `country`;


-- profit_2.vw_currency source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_currency` AS
select
    `currency`.`ID` AS `ID`,
    `currency`.`CURRENCY_NAME` AS `CURRENCY_NAME`
from
    `currency`
where
    (`currency`.`IS_DELETED` = false);


-- profit_2.vw_invoice_age source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_invoice_age` AS
select
    `subquery`.`DAYS_RANGE` AS `DAYS_RANGE`,
    `subquery`.`INVOICES_COUNT` AS `INVOICES_COUNT`,
    `subquery`.`PERCENTAGE` AS `PERCENTAGE`
from
    (
    select
        (case
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 0 and 30) then '0-30'
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 31 and 60) then '31-60'
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 61 and 90) then '61-90'
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 91 and 120) then '91-120'
            else '121 - x'
        end) AS `DAYS_RANGE`,
        count(0) AS `INVOICES_COUNT`,
        ((count(0) / (
        select
            count(0)
        from
            `financial_records`
        where
            (`financial_records`.`EXPIRATION_DATE` < curdate()))) * 100) AS `PERCENTAGE`,
        (case
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 0 and 30) then 1
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 31 and 60) then 2
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 61 and 90) then 3
            when ((to_days(curdate()) - to_days(`financial_records`.`EXPIRATION_DATE`)) between 91 and 120) then 4
            else 5
        end) AS `ORDER_COL`
    from
        `financial_records`
    where
        (`financial_records`.`EXPIRATION_DATE` < curdate())
    group by
        `DAYS_RANGE`,
        `ORDER_COL`) `subquery`
order by
    `subquery`.`ORDER_COL`;


-- profit_2.vw_super_admins source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_super_admins` AS
select
    `us`.`EMAIL` AS `EMAIL`,
    `us`.`PHONE` AS `PHONE`,
    `us`.`USER_NAME` AS `USER_NAME`,
    `us`.`POSITION` AS `POSITION`,
    `us`.`NOTIFICATION_CONFIG` AS `NOTIFICATION_CONFIG`,
    `us`.`UUID` AS `UUID`,
    `us`.`is_super_admin` AS `is_super_admin`,
    `us`.`IS_DELETED` AS `IS_DELETED`
from
    `user` `us`
where
    (`us`.`is_super_admin` = 1);


-- profit_2.vw_user_bussines_rules source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_user_bussines_rules` AS
select
    json_arrayagg(json_object('CHANNEL_ID', `c`.`ID`, 'CHANNEL_DESCRIPTION', `c`.`CHANNEL_DESCRIPTION`, 'LINES',(select json_arrayagg(json_object('LINE_ID', `l`.`ID`, 'DESCRIPTION_LINE', `l`.`DESCRIPTION_LINE`, 'SUBLINES',(select json_arrayagg(json_object('SUBLINE_ID', `sl`.`ID`, 'SUBLINE_DESCRIPTION', `sl`.`SUBLINE_DESCRIPTION`)) from (`subline` `sl` join `user_subline` `usl` on((`sl`.`ID` = `usl`.`SUBLINE_ID`))) where ((`sl`.`LINE_ID` = `l`.`ID`) and (`usl`.`USER_ID` = `u`.`ID`))))) from (`line` `l` join `user_line` `ul` on((`l`.`ID` = `ul`.`LINE_ID`))) where ((`l`.`CHANNEL_ID` = `c`.`ID`) and (`ul`.`USER_ID` = `u`.`ID`))))) AS `CHANNELS`
from
    ((`user_channel` `uc`
join `channel` `c` on
    ((`uc`.`CHANNEL_ID` = `c`.`ID`)))
join `user` `u` on
    ((`uc`.`USER_ID` = `u`.`ID`)))
where
    ((`u`.`IS_DELETED` = 0)
        and (`c`.`IS_DELETED` = 0));


-- profit_2.vw_user_by_id source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_user_by_id` AS
select
    `u`.`ID` AS `ID`,
    `u`.`EMAIL` AS `EMAIL`,
    `u`.`PHONE` AS `PHONE`,
    `u`.`USER_NAME` AS `USER_NAME`,
    `u`.`POSITION` AS `POSITION`,
    `u`.`NOTIFICATION_CONFIG` AS `NOTIFICATION_CONFIG`,
    `u`.`UUID` AS `UUID`,
    `u`.`PHOTO` AS `PHOTO`,
    `u`.`is_super_admin` AS `is_super_admin`,
    `u`.`IS_DELETED` AS `IS_DELETED`,
    `ac`.`ACTIVE` AS `ACTIVE`,
    `ac`.`ROL_ID` AS `ROL_ID`,
    `ac`.`PROJECT_ID` AS `PROJECT_ID`,
    `p`.`PROJECT_DESCRIPTION` AS `PROJECT_DESCRIPTION`,
    (
    select
        json_arrayagg(json_object('ZONE_ID', `uz`.`ZONE_ID`, 'ZONE_DESCRIPTION', `z`.`ZONE_DESCRIPTION`)) AS `ZONES`
    from
        (`user_zone` `uz`
    join `zone` `z` on
        ((`uz`.`ZONE_ID` = `z`.`ID`)))
    where
        ((`uz`.`USER_ID` = `u`.`ID`)
            and (`z`.`PROJECT_ID` = `p`.`ID`))) AS `USER_ZONES`,
    (
    select
        json_arrayagg(json_object('ID', `uc`.`CHANNEL_ID`))
    from
        `user_channel` `uc`
    where
        (`uc`.`USER_ID` = `u`.`ID`)) AS `USER_CHANNELS`,
    (
    select
        json_arrayagg(json_object('ID', `ul`.`LINE_ID`))
    from
        `user_line` `ul`
    where
        (`ul`.`USER_ID` = `u`.`ID`)) AS `USER_LINES`,
    (
    select
        json_arrayagg(json_object('ID', `us`.`SUBLINE_ID`))
    from
        `user_subline` `us`
    where
        (`us`.`USER_ID` = `u`.`ID`)) AS `USER_SUBLINES`
from
    (((`user` `u`
join `company_assigments` `ac` on
    ((`u`.`ID` = `ac`.`USER_ID`)))
join `project` `p` on
    ((`ac`.`PROJECT_ID` = `p`.`ID`)))
join `user_rol` `ur` on
    ((`ac`.`ROL_ID` = `ur`.`ID`)));


-- profit_2.vw_user_info source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_user_info` AS
select
    `u`.`ID` AS `ID`,
    `u`.`EMAIL` AS `EMAIL`,
    `u`.`PHONE` AS `PHONE`,
    `u`.`USER_NAME` AS `USER_NAME`,
    `u`.`POSITION` AS `POSITION`,
    `u`.`NOTIFICATION_CONFIG` AS `NOTIFICATION_CONFIG`,
    `u`.`UUID` AS `UUID`,
    `u`.`PHOTO` AS `PHOTO`,
    `u`.`is_super_admin` AS `is_super_admin`,
    `u`.`IS_DELETED` AS `IS_DELETED`,
    `ac`.`ACTIVE` AS `ACTIVE`,
    `ac`.`ROL_ID` AS `ROL_ID`,
    `ac`.`PROJECT_ID` AS `PROJECT_ID`,
    `p`.`PROJECT_DESCRIPTION` AS `PROJECT_DESCRIPTION`,
    (
    select
        json_arrayagg(json_object('ZONE_ID', `uz`.`ZONE_ID`, 'ZONE_DESCRIPTION', `z`.`ZONE_DESCRIPTION`)) AS `ZONES`
    from
        (`user_zone` `uz`
    join `zone` `z` on
        ((`uz`.`ZONE_ID` = `z`.`ID`)))
    where
        ((`uz`.`USER_ID` = `u`.`ID`)
            and (`z`.`PROJECT_ID` = `p`.`ID`))) AS `USER_ZONES`,
    (
    select
        json_arrayagg(json_object('CHANNEL_ID', `c`.`ID`, 'CHANNEL_DESCRIPTION', `c`.`CHANNEL_DESCRIPTION`, 'LINES',(select json_arrayagg(json_object('LINE_ID', `l`.`ID`, 'DESCRIPTION_LINE', `l`.`DESCRIPTION_LINE`, 'SUBLINES',(select json_arrayagg(json_object('SUBLINE_ID', `sl`.`ID`, 'SUBLINE_DESCRIPTION', `sl`.`SUBLINE_DESCRIPTION`)) from (`subline` `sl` join `user_subline` `usl` on((`sl`.`ID` = `usl`.`SUBLINE_ID`))) where ((`sl`.`LINE_ID` = `l`.`ID`) and (`usl`.`USER_ID` = `u`.`ID`))))) from (`line` `l` join `user_line` `ul` on((`l`.`ID` = `ul`.`LINE_ID`))) where ((`l`.`CHANNEL_ID` = `c`.`ID`) and (`ul`.`USER_ID` = `u`.`ID`)))))
    from
        ((`user_channel` `uc`
    join `channel` `c` on
        ((`uc`.`CHANNEL_ID` = `c`.`ID`)))
    join `user` `u` on
        ((`uc`.`USER_ID` = `u`.`ID`)))
    where
        ((`u`.`IS_DELETED` = 0)
            and (`c`.`IS_DELETED` = 0))) AS `BUSSINES_RULES`
from
    (((`user` `u`
join `company_assigments` `ac` on
    ((`u`.`ID` = `ac`.`USER_ID`)))
join `project` `p` on
    ((`ac`.`PROJECT_ID` = `p`.`ID`)))
join `user_rol` `ur` on
    ((`ac`.`ROL_ID` = `ur`.`ID`)))
where
    (`ac`.`IS_DELETED` = 0);

   


-- profit_2.vw_wallet_client source

CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `vw_wallet_client` AS
select
    `w`.`ID` AS `ID`,
    `w`.`CLIENT_ID` AS `CLIENT_ID`,
    (
    select
        `c`.`CLIENT_NAME`
    from
        `client` `c`
    where
        (`c`.`NIT` = `w`.`CLIENT_ID`)) AS `CLIENT_NAME`,
    (
    select
        `c`.`PROJECT_ID`
    from
        `client` `c`
    where
        (`c`.`NIT` = `w`.`CLIENT_ID`)) AS `PROJECT_ID`,
    `w`.`PAST_DUE_AMMOUNT` AS `PAST_DUE_AMMOUNT`,
    `w`.`BUDGET_AMMOUNT` AS `BUDGET_AMMOUNT`,
    `w`.`APPLIED_PAYMENTS_AMMOUNT` AS `APPLIED_PAYMENTS_AMMOUNT`,
    `w`.`UNAPPLIED_PAYMENTS_AMMOUNT` AS `UNAPPLIED_PAYMENTS_AMMOUNT`,
    `w`.`TOTAL_PORTFOLIO` AS `TOTAL_PORTFOLIO`,
    (
    select
        `vci`.`HOLDING_ID`
    from
        `vw_client_info` `vci`
    where
        (`vci`.`NIT` = `w`.`CLIENT_ID`)) AS `HOLDING_ID`,
    (
    select
        `vci`.`HOLDING_NAME`
    from
        `vw_client_info` `vci`
    where
        (`vci`.`NIT` = `w`.`CLIENT_ID`)) AS `HOLDING_NAME`
from
    `client_wallet` `w`;
    

CREATE OR REPLACE VIEW financial_discounts_view AS
SELECT 
    fd.*,
    CASE 
        WHEN fd.ERP_ID IS NULL THEN 
            CONCAT('CP-', ROW_NUMBER() OVER (PARTITION BY fd.PROJECT_ID ORDER BY fd.ID))
        ELSE 
            NULL
    END AS CP_ID
FROM 
    financial_discounts fd