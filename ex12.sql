SELECT b.title
FROM books AS b JOIN editions AS e ON (b.id=e.book_id)
GROUP BY b.title
HAVING COUNT(DISTINCT e.type) = 2;
