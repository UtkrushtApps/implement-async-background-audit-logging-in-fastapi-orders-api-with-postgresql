-- Table 'orders' (already exists)
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    product_name TEXT NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TODO: The audit log table for tracking order status changes (implement here)
-- Must have a relation to orders(id), appropriate constraints, timestamp, status and reason fields
