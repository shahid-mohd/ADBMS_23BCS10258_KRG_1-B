CREATE VIEW vW_SALES_REPORT AS  
SELECT   
    S.order_id,  
    S.order_date,  
    P.product_name,  
    C.customer_name,  
    (P.unit_price * S.quantity) - ((P.unit_price * S.quantity) * S.discount_percent / 100) 
AS total_cost  
FROM customer_info AS C  
JOIN sales_records AS S   
    ON S.customer_id = C.customer_id  
JOIN product_list AS P  
    ON P.product_id = S.product_id;  
  
SELECT * FROM vW_SALES_REPORT;  
  
CREATE ROLE SALES_USER  
LOGIN  
PASSWORD 'sales_password';  
  
GRANT SELECT ON vW_SALES_REPORT TO SALES_USER;  
  
REVOKE SELECT ON vW_SALES_REPORT FROM SALES_USER; 
