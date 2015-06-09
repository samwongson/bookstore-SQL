
-- ex1
SELECT isbn FROM editions JOIN publishers ON(publisher_id=id) WHERE publishers.name = 'Random House';
-- ex2
SELECT isbn, title FROM editions JOIN publishers ON(publisher_id=id) JOIN books ON(editions.book_id=books.id) WHERE publishers.name = 'Random House';
-- ex3
SELECT e.isbn, title, stock, retail
FROM editions AS e JOIN publishers ON(publisher_id=id) 
              JOIN books ON(e.book_id=books.id) 
              JOIN stock ON(e.isbn=stock.isbn)
WHERE publishers.name = 'Random House';
-- ex4
SELECT e.isbn, title, stock, retail
FROM editions AS e JOIN publishers ON(publisher_id=id) 
              JOIN books ON(e.book_id=books.id) 
              JOIN stock ON(e.isbn=stock.isbn)
WHERE publishers.name = 'Random House' AND stock != 0;
-- ex5
SELECT e.isbn, title, stock, retail, CASE WHEN type = 'h' THEN 'hardcopy'
                                          WHEN type = 'p' THEN 'paperback'
                                          END AS type
FROM editions AS e JOIN publishers ON(publisher_id=id) 
              JOIN books ON(e.book_id=books.id) 
              JOIN stock ON(e.isbn=stock.isbn)
WHERE publishers.name = 'Random House' AND stock != 0;

-- ex6
SELECT title, publication 
FROM books JOIN editions ON (id=book_id);
-- ex7
SELECT SUM(stock) FROM stock;
-- ex8
SELECT ROUND(AVG(cost),2), ROUND(AVG(retail),2) FROM stock;
-- ex9
SELECT e.book_id, s.stock
FROM editions AS e JOIN stock AS s ON(e.isbn=s.isbn)
ORDER BY s.stock DESC
LIMIT 1;
-- ex10
SELECT a.id, concat(a.first_name || ' ' || a.last_name), COUNT(b.author_id)
FROM books AS b JOIN authors AS a ON (b.author_id=a.id)
GROUP BY a.id;
-- ex11
SELECT a.id, concat(a.first_name || ' ' || a.last_name), COUNT(b.author_id)
FROM books AS b JOIN authors AS a ON (b.author_id=a.id)

ORDER BY b.author_id DESC;
-- ex12
SELECT b.title
FROM books AS b JOIN editions AS e ON (b.id=e.book_id)
GROUP BY b.title
HAVING COUNT(DISTINCT e.type) = 2;

-- ex13
SELECT DISTINCT p.name, ROUND(AVG(s.cost), 2) AS "average cost"
FROM editions AS e JOIN publishers AS p ON (p.id=e.publisher_id)
    JOIN stock AS s ON (s.isbn=e.isbn)
GROUP BY p.name;

      