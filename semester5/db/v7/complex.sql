CREATE TABLE v7.complex AS (
    SELECT
        "order".id              AS "order_id",
        "details".customer_name AS "customer_name",
        "city".title            AS "customer_city",
        "product_type".title    AS "product_type",
        "material".title        AS "material_type",
        "order".total_price     AS "order_price"
    FROM
        v7.order AS "order"
    LEFT JOIN
        v7.order_details AS "details"
        ON "order".id = "details".order_id
    LEFT JOIN
        v7.product_type AS "product_type"
        ON "order".product_type_id = "product_type".id
    LEFT JOIN
        v7.material AS "material"
        ON "order".material_id = "material".id
    LEFT JOIN
        v7.city AS "city"
        ON "details".city_id = "city".id
    WHERE
        "details".customer_name IS NOT NULL
);
