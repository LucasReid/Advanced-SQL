--Lucas Reid COMP325-01 Lab1

-- Step 10
INSERT INTO c325_lab1_categories (cat_id, cat_desc) VALUES (1,'Fiction');
INSERT INTO c325_lab1_categories (cat_id, cat_desc) VALUES (2,'Mathmatics');
INSERT INTO c325_lab1_categories (cat_id, cat_desc) VALUES (3,'Autobigraphy');
INSERT INTO c325_lab1_categories (cat_id, cat_desc) VALUES (4,'Computer Science');
INSERT INTO c325_lab1_categories (cat_id, cat_desc) VALUES (5,'Cooking');
	
--step 12
INSERT INTO c325_lab1_books (book_id, book_title, book_author, book_pub_date, book_quantity, book_cost) VALUES (55,'Death by Chocolate','Julia Child','1993-22-03',23, '16.99');
INSERT INTO c325_lab1_books (book_id, book_title, book_author, book_pub_date, book_quantity, book_cost) VALUES (74,'Introduction to Calculus','Isaac Newton','1666-10-17',10, '450.76');
INSERT INTO c325_lab1_books (book_id, book_title, book_author, book_pub_date, book_quantity, book_cost) VALUES (99,'I''m a Complete Tool','John Mayer','2016-05-22',100, '5.97');
INSERT INTO c325_lab1_books (book_id, book_title, book_author, book_pub_date, book_quantity, book_cost) VALUES (13,'Advanced SQL and you','Lucas Reid','2012-09-22',19, '5.97');
INSERT INTO c325_lab1_books (book_id, book_title, book_author, book_pub_date, book_quantity, book_cost) VALUES (10,'Lizards of the World','Lizardking','2025-11-15',99, '14.62');
INSERT INTO c325_lab1_books (book_id, book_title, book_author, book_pub_date, book_quantity, book_cost) VALUES (43,'Random Book Title','Somegui','2030-07-01',91, '19.62');

--step 13
UPDATE c325_lab1_books SET cat_id = 5 where book_id = 55;
UPDATE c325_lab1_books SET cat_id = 1  where book_id = 10;
UPDATE c325_lab1_books SET cat_id = 4  where book_id = 13;
UPDATE c325_lab1_books SET cat_id = 3  where book_id = 43;
UPDATE c325_lab1_books SET cat_id = 2  where book_id = 74;
UPDATE c325_lab1_books SET cat_id = 3  where book_id = 99;

14. ALTER TABLE c325_lab1_books ADD book_price NUMERIC (8,2);
15. UPDATE c325_lab1_books SET book_price=book_price+(book_price*.16);
16. SELECT * FROM c325_lab1_books where cat_id = 1 AND book_price >=25.00;
	Empty set (0.00 sec)
17. SELECT cat_desc FROM c325_lab1_categories ORDER BY cat_desc DESC;
18. SELECT min(book_price), max(book_price), avg(book_price) FROM c325_lab1_books where cat_id=1;
19. SELECT book_title FROM c325_lab1_books WHERE book_quantity >5 AND book_pub_date BETWEEN 	'1990-01-01' AND '2014-09-01';
20. SELECT COUNT(*), book_cost FROM c325_lab1_books GROUP BY book_cost;
21. SELECT * FROM c325_lab1_books where book_quantity>(SELECT AVG(book_quantity) FROM c325_lab1_books);



	



