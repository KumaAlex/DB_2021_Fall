1) Types(type_ID) – Product_Hierarchy(child_type_ID) 
and 
2) Types(type_ID) – Product_Hierarchy(parent_type_ID): only 1 to 1 or many, because children can have 0 or many parents and parents can have 0 or many children.

3) Types(type_ID)  – Prod_types(type_ID)
and
4) Products(UPC_code) – Prod_types(UPC_code): only 1 to 1 or many, because each product can be of different types.

5) Vendors(vendor_ID) – Vendor_Prod(vendor_ID)
and
6) Products(UPC_code) – Vendor_Prod(UPC_code): only 1 to 0 or many, because each vendor can sell different products of different brands or nothing.

7) Vendors(vendor_ID) – Store_Vendor(vendor_ID)
and
8) Stores(store_ID) - Store_Vendor(store_ID): only 1 to 0 or many, because each vendor can work with 0 or many stores.

9) Products(UPC_code) – Storage(UPC_code)
and
10) Stores(store_ID) – Storage(store_ID): only 1 to 0 or many, because stores may sell multiple products or nothing.

11) Products(brand_ID) – Brands(brand_ID): 0 or many to 0 or many, because different brands may have the same product or nothing. The product may be unbranded.

12) Products(UPC_code) – Basket(UPC_code): only 1 to 0 or many, because customers may buy a lot of goods at the same time.

13) Stores(store_ID) – Basket(store_ID): only 1 to 0 or many, because different customers may buy in different stores at the same time.

14) Customers(customer_ID) – Basket(customer_ID): only 1 to 0 or many, because the customer can buy several items or nothing

15) Customer(customer_ID) – Frequent_shopper(customer_ID): only 1 to 0 or 1, because not all customers are frequent shoppers

