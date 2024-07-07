/* Table : Tree
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| p_id        | int  |
+-------------+------+
id is the column with unique values for this table.
Each row of this table contains information about the id of a node and the id of its parent node in a tree.
The given structure is always a valid tree.

Each node in the tree can be one of three types:
    - "Leaf": if the node is a leaf node.
    - "Root": if the node is the root of the tree.
    - "Inner": If the node is neither a leaf node nor a root node.

Write a solution to report the type of each node in the tree. */

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM
    Tree;

/* OR */

WITH internal_nodes AS
(
    SELECT p_id, COUNT(*) as child_count
    FROM Tree
    GROUP BY p_id
)
SELECT
    t.id,
    CASE
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN i.child_count > 0 THEN 'Inner'
        ELSE 'Leaf'
    END as type
FROM
    Tree t
    LEFT OUTER JOIN internal_nodes i ON t.id = i.p_id;
