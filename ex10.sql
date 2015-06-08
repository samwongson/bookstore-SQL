SELECT a.id, concat(a.first_name || ' ' || a.last_name), COUNT(b.author_id)
FROM books AS b JOIN authors AS a ON (b.author_id=a.id)
GROUP BY a.id;
