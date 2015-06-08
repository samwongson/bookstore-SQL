SELECT e.isbn, title, stock, retail, CASE WHEN type = 'h' THEN 'hardcopy'
                                          WHEN type = 'p' THEN 'paperback'
                                          END AS type
FROM editions AS e JOIN publishers ON(publisher_id=id) 
              JOIN books ON(e.book_id=books.id) 
              JOIN stock ON(e.isbn=stock.isbn)
WHERE publishers.name = 'Random House' AND stock != 0;
