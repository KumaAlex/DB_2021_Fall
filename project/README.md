Products can be from one to several types and brands. Since the products
in the prod\_types and brands tables are lists, the relationship will be
one or many to one or many. The relationship between products and
stores, customers, vendors is zero or many to one or many, because these
lists do not necessarily have all products. The relationship between
products and online orders is one and only one to zero or many, because
each order is placed one product at a time for several customers. The
connection between vendors and stores is one or many to one or many,
because both can have several partners. The connection between
freq\_shopper and customer, because not all customers are freq\_shopper.
The connection between store and customers is one and only one to zero
or many, because the customer comes to a particular store. Communication
between customers and online orders is one or many to zero or many,
because several people can order a product.
