SELECT e.book_id, s.stock
FROM editions AS e JOIN stock AS s ON(e.isbn=s.isbn)
ORDER BY s.stock DESC
LIMIT 1;
